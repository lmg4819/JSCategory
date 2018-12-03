//
//  UITextField+JSCategory.h
//  TestProject
//
//  Created by lmg on 2018/11/30.
//  Copyright © 2018 lmg. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (JSCategory)

@property (copy, nonatomic) BOOL (^js_shouldBegindEditingBlock)(UITextField *textField);
@property (copy, nonatomic) BOOL (^js_shouldEndEditingBlock)(UITextField *textField);
@property (copy, nonatomic) void (^js_didBeginEditingBlock)(UITextField *textField);
@property (copy, nonatomic) void (^js_didEndEditingBlock)(UITextField *textField);
@property (copy, nonatomic) BOOL (^js_shouldChangeCharactersInRangeBlock)(UITextField *textField, NSRange range, NSString *replacementString);
@property (copy, nonatomic) BOOL (^js_shouldReturnBlock)(UITextField *textField);
@property (copy, nonatomic) BOOL (^js_shouldClearBlock)(UITextField *textField);


- (void)setJs_shouldBegindEditingBlock:(BOOL (^)(UITextField *textField))shouldBegindEditingBlock;
- (void)setJs_shouldEndEditingBlock:(BOOL (^)(UITextField *textField))shouldEndEditingBlock;
- (void)setJs_didBeginEditingBlock:(void (^)(UITextField *textField))didBeginEditingBlock;
- (void)setJs_didEndEditingBlock:(void (^)(UITextField *textField))didEndEditingBlock;
- (void)setJs_shouldChangeCharactersInRangeBlock:(BOOL (^)(UITextField *textField, NSRange range, NSString *string))shouldChangeCharactersInRangeBlock;
- (void)setJs_shouldClearBlock:(BOOL (^)(UITextField *textField))shouldClearBlock;
- (void)setJs_shouldReturnBlock:(BOOL (^)(UITextField *textField))shouldReturnBlock;

@property (assign, nonatomic)  NSInteger js_maxLength;//if <=0, no limit

/**
 Set all text selected.
 */
- (void)js_selectAllText;

/**
 Set text in range selected.
 
 @param range  The range of selected text in a document.
 */
- (void)js_setSelectedRange:(NSRange)range;


@end

NS_ASSUME_NONNULL_END
