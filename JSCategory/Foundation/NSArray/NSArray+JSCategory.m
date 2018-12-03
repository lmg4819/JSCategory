//
//  NSArray+JSCategory.m
//  TestProject
//
//  Created by lmg on 2018/11/29.
//  Copyright © 2018 lmg. All rights reserved.
//

#import "NSArray+JSCategory.h"

@implementation NSArray (JSCategory)

- (NSString *)js_JsonString {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return json;
    }
    return nil;
}

@end
