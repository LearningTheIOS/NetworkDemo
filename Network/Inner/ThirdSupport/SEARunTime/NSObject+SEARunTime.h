//
//  NSObject+SEARunTime.h
//  StudyEfficiencyAccumulation
//
//  Created by lizhennan on 14-6-13.
//  Copyright (c) 2014年 BOC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (SEARunTime)

/**
 *  获取实例的属性名称数组(隐藏属性也能获取)
 */
@property (nonatomic,readonly) NSArray *propertyNameArray;

/**
 *  父类属性也能获取
 */
@property (nonatomic,readonly) NSArray *recurPropertyNameArray;

/**
 *  类方法
 *
 *  @return 类的属性名称数组(隐藏属性也能获取)
 */
+ (NSArray *)gainPropertyNameArray;

/**
 *  类方法
 *
 *  @return 父类属性也能获取
 */
+ (NSArray *)recurGainPropertyNameArray;

/**
 *  类方法
 *
 *  @return 类的成员变量，字典key:成员变量名称；字典value:成员变量类型
 */
+ (NSDictionary *)gainIvars;

/**
 *  根据传入的class类型获取属性列表
 *
 *  @param sourceClass 源class
 *
 *  @return 属性列表
 */
+ (NSArray *)gainPropertyNameArrayWithClass:(Class)sourceClass;

@end
