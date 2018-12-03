//
//  NSObject+JSRuntime.h
//  TestProject
//
//  Created by lmg on 2018/11/29.
//  Copyright © 2018 lmg. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (JSRuntime)

//类名
- (NSString *)js_className;
+ (NSString *)js_className;

//父类类名
- (NSString *)js_superClassName;
+ (NSString *)js_superClassName;

//属性key-value字典
-(NSDictionary *)js_propertyDictionary;

//属性key列表
- (NSArray*)js_propertyKeys;
+ (NSArray *)js_propertyKeys;

//属性详细信息列表
- (NSArray *)js_propertiesInfo;
+ (NSArray *)js_propertiesInfo;

//格式化后的属性详细信息列表
+ (NSArray *)js_propertiesWithCodeFormat;

//实例方法列表
- (NSArray *)js_instanceMethodList;
+ (NSArray *)js_instanceMethodList;

//类方法列表
- (NSArray *)js_classMethodList;
+ (NSArray *)js_classMethodList;

//方法列表信息
-(NSArray*)js_methodListInfo;

//实例变量列表
+ (NSArray *)js_instanceVariable;

//协议列表
-(NSDictionary *)js_protocolList;
+ (NSDictionary *)js_protocolList;

- (BOOL)js_hasPropertyForKey:(NSString*)key;
- (BOOL)js_hasIvarForKey:(NSString*)key;

#pragma mark -AssociatedObject

/**
 Associate one object to `self`, as if it was a strong property (strong, nonatomic).
 */
- (void)js_setAssociateValue:(nullable id)value withKey:(void *)key;

/**
Associate one object to `self`, as if it was a weak property (week, nonatomic).
 */
- (void)js_setAssociateWeakValue:(nullable id)value withKey:(void *)key;

/**
 Get the associated value from `self`.
 */
- (nullable id)js_getAssociatedValueForKey:(void *)key;

/**
 Remove all associated values.
 */
- (void)js_removeAssociatedValues;

@end

NS_ASSUME_NONNULL_END
