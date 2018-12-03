//
//  UIBarButtonItem+JSCategory.m
//  TestProject
//
//  Created by lmg on 2018/11/30.
//  Copyright © 2018 lmg. All rights reserved.
//

#import "UIBarButtonItem+JSCategory.h"
#import <objc/runtime.h>

static const int block_key;

@interface _JSUIBarButtonItemBlockTarget : NSObject

@property (nonatomic, copy) void (^block)(id sender);

- (id)initWithBlock:(void (^)(id sender))block;
- (void)invoke:(id)sender;

@end

@implementation _JSUIBarButtonItemBlockTarget

- (id)initWithBlock:(void (^)(id sender))block{
    self = [super init];
    if (self) {
        _block = [block copy];
    }
    return self;
}

- (void)invoke:(id)sender {
    if (self.block) self.block(sender);
}

@end


@implementation UIBarButtonItem (JSCategory)

- (void (^)(id)) js_actionBlock {
    _JSUIBarButtonItemBlockTarget *target = objc_getAssociatedObject(self, &block_key);
    return target.block;
}

-(void)setJs_actionBlock:(void (^)(id _Nonnull))js_actionBlock
{
    _JSUIBarButtonItemBlockTarget *target = [[_JSUIBarButtonItemBlockTarget alloc] initWithBlock:js_actionBlock];
    objc_setAssociatedObject(self, &block_key, target, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setTarget:target];
    [self setAction:@selector(invoke:)];
}

@end
