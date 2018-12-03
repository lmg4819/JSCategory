//
//  UITextView+JSCategory.h
//  TestProject
//
//  Created by lmg on 2018/11/30.
//  Copyright © 2018 lmg. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (JSCategory)<UITextViewDelegate>
@property (nonatomic, strong) UITextView *js_placeHolderTextView;
@property (assign, nonatomic)  NSInteger js_maxLength;//if <=0, no limit

- (NSRange)js_selectedRange;
- (void)js_selectAllText;
- (void)js_setSelectedRange:(NSRange)range;
- (NSInteger)js_getInputLengthWithText:(NSString *)text;

- (void)js_addPlaceHolder:(NSString *)placeHolder;

@end

NS_ASSUME_NONNULL_END
