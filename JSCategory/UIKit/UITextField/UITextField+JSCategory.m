//
//  UITextField+JSCategory.m
//  TestProject
//
//  Created by lmg on 2018/11/30.
//  Copyright © 2018 lmg. All rights reserved.
//

#import "UITextField+JSCategory.h"
#import <objc/runtime.h>

typedef BOOL (^JSUITextFieldReturnBlock) (UITextField *textField);
typedef void (^JSUITextFieldVoidBlock) (UITextField *textField);
typedef BOOL (^JSUITextFieldCharacterChangeBlock) (UITextField *textField, NSRange range, NSString *replacementString);


static const void *JSUITextFieldDelegateKey = &JSUITextFieldDelegateKey;
static const void *JSUITextFieldShouldBeginEditingKey = &JSUITextFieldShouldBeginEditingKey;
static const void *JSUITextFieldShouldEndEditingKey = &JSUITextFieldShouldEndEditingKey;
static const void *JSUITextFieldDidBeginEditingKey = &JSUITextFieldDidBeginEditingKey;
static const void *JSUITextFieldDidEndEditingKey = &JSUITextFieldDidEndEditingKey;
static const void *JSUITextFieldShouldChangeCharactersInRangeKey = &JSUITextFieldShouldChangeCharactersInRangeKey;
static const void *JSUITextFieldShouldClearKey = &JSUITextFieldShouldClearKey;
static const void *JSUITextFieldShouldReturnKey = &JSUITextFieldShouldReturnKey;

static const void *JSTextFieldInputLimitMaxLength = &JSTextFieldInputLimitMaxLength;



@implementation UITextField (JSCategory)

- (NSInteger)js_maxLength {
    return [objc_getAssociatedObject(self, JSTextFieldInputLimitMaxLength) integerValue];
}
- (void)setJs_maxLength:(NSInteger)maxLength {
    objc_setAssociatedObject(self, JSTextFieldInputLimitMaxLength, @(maxLength), OBJC_ASSOCIATION_ASSIGN);
    [self addTarget:self action:@selector(js_textFieldTextDidChange) forControlEvents:UIControlEventEditingChanged];
}
- (void)js_textFieldTextDidChange {
    NSString *toBeString = self.text;
    //获取高亮部分
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    
    //没有高亮选择的字，则对已输入的文字进行字数统计和限制
    //在iOS7下,position对象总是不为nil
    if ( (!position ||!selectedRange) && (self.js_maxLength > 0 && toBeString.length > self.js_maxLength))
    {
        NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:self.js_maxLength];
        if (rangeIndex.length == 1)
        {
            self.text = [toBeString substringToIndex:self.js_maxLength];
        }
        else
        {
            NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.js_maxLength)];
            NSInteger tmpLength;
            if (rangeRange.length > self.js_maxLength) {
                tmpLength = rangeRange.length - rangeIndex.length;
            }else{
                tmpLength = rangeRange.length;
            }
            self.text = [toBeString substringWithRange:NSMakeRange(0, tmpLength)];
        }
    }
}

- (void)js_selectAllText {
    UITextRange *range = [self textRangeFromPosition:self.beginningOfDocument toPosition:self.endOfDocument];
    [self setSelectedTextRange:range];
}

- (void)js_setSelectedRange:(NSRange)range {
    UITextPosition *beginning = self.beginningOfDocument;
    UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition *endPosition = [self positionFromPosition:beginning offset:NSMaxRange(range)];
    UITextRange *selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    [self setSelectedTextRange:selectionRange];
}

#pragma mark UITextField Delegate methods
+ (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    JSUITextFieldReturnBlock block = textField.js_shouldBegindEditingBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, JSUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
        return [delegate textFieldShouldBeginEditing:textField];
    }
    // return default value just in case
    return YES;
}
+ (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    JSUITextFieldReturnBlock block = textField.js_shouldEndEditingBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, JSUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldEndEditing:)]) {
        return [delegate textFieldShouldEndEditing:textField];
    }
    // return default value just in case
    return YES;
}
+ (void)textFieldDidBeginEditing:(UITextField *)textField
{
    JSUITextFieldVoidBlock block = textField.js_didBeginEditingBlock;
    if (block) {
        block(textField);
    }
    id delegate = objc_getAssociatedObject(self, JSUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
        [delegate textFieldDidBeginEditing:textField];
    }
}
+ (void)textFieldDidEndEditing:(UITextField *)textField
{
    JSUITextFieldVoidBlock block = textField.js_didEndEditingBlock;
    if (block) {
        block(textField);
    }
    id delegate = objc_getAssociatedObject(self, JSUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldDidEndEditing:)]) {
        [delegate textFieldDidBeginEditing:textField];
    }
}
+ (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    JSUITextFieldCharacterChangeBlock block = textField.js_shouldChangeCharactersInRangeBlock;
    if (block) {
        return block(textField,range,string);
    }
    id delegate = objc_getAssociatedObject(self, JSUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        return [delegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    return YES;
}
+ (BOOL)textFieldShouldClear:(UITextField *)textField
{
    JSUITextFieldReturnBlock block = textField.js_shouldClearBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, JSUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldClear:)]) {
        return [delegate textFieldShouldClear:textField];
    }
    return YES;
}
+ (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    JSUITextFieldReturnBlock block = textField.js_shouldReturnBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, JSUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        return [delegate textFieldShouldReturn:textField];
    }
    return YES;
}

#pragma mark Block setting/getting methods
- (BOOL (^)(UITextField *))js_shouldBegindEditingBlock
{
    return objc_getAssociatedObject(self, JSUITextFieldShouldBeginEditingKey);
}
- (void)setJs_shouldBegindEditingBlock:(BOOL (^)(UITextField *))shouldBegindEditingBlock
{
    [self js_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, JSUITextFieldShouldBeginEditingKey, shouldBegindEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *))js_shouldEndEditingBlock
{
    return objc_getAssociatedObject(self, JSUITextFieldShouldEndEditingKey);
}
- (void)setJs_shouldEndEditingBlock:(BOOL (^)(UITextField *))shouldEndEditingBlock
{
    [self js_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, JSUITextFieldShouldEndEditingKey, shouldEndEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (void (^)(UITextField *))js_didBeginEditingBlock
{
    return objc_getAssociatedObject(self, JSUITextFieldDidBeginEditingKey);
}
- (void)setJs_didBeginEditingBlock:(void (^)(UITextField *))didBeginEditingBlock
{
    [self js_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, JSUITextFieldDidBeginEditingKey, didBeginEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (void (^)(UITextField *))js_didEndEditingBlock
{
    return objc_getAssociatedObject(self, JSUITextFieldDidEndEditingKey);
}
- (void)setJs_didEndEditingBlock:(void (^)(UITextField *))didEndEditingBlock
{
    [self js_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, JSUITextFieldDidEndEditingKey, didEndEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *, NSRange, NSString *))js_shouldChangeCharactersInRangeBlock
{
    return objc_getAssociatedObject(self, JSUITextFieldShouldChangeCharactersInRangeKey);
}
- (void)setJs_shouldChangeCharactersInRangeBlock:(BOOL (^)(UITextField *, NSRange, NSString *))shouldChangeCharactersInRangeBlock
{
    [self js_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, JSUITextFieldShouldChangeCharactersInRangeKey, shouldChangeCharactersInRangeBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *))js_shouldReturnBlock
{
    return objc_getAssociatedObject(self, JSUITextFieldShouldReturnKey);
}
- (void)setJs_shouldReturnBlock:(BOOL (^)(UITextField *))shouldReturnBlock
{
    [self js_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, JSUITextFieldShouldReturnKey, shouldReturnBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *))js_shouldClearBlock
{
    return objc_getAssociatedObject(self, JSUITextFieldShouldClearKey);
}
- (void)setJs_shouldClearBlock:(BOOL (^)(UITextField *textField))shouldClearBlock
{
    [self js_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, JSUITextFieldShouldClearKey, shouldClearBlock, OBJC_ASSOCIATION_COPY);
}

#pragma mark control method
/*
 Setting itself as delegate if no other delegate has been set. This ensures the UITextField will use blocks if no delegate is set.
 */
- (void)js_setDelegateIfNoDelegateSet
{
    if (self.delegate != (id<UITextFieldDelegate>)[self class]) {
        objc_setAssociatedObject(self, JSUITextFieldDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id<UITextFieldDelegate>)[self class];
    }
}
@end
