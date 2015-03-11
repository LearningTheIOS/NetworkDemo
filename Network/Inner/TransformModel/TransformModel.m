//
//  TransformModel.m
//  Network
//  Model转换，外部使用Model转换内部JSONModel
//  Created by lizhennan on 14-8-5.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import "TransformModel.h"
#import "NSObject+SEARunTime.h"
#import "InnerConfig.h"
#import "TransformModelNameClass.h"

@implementation TransformModel
+ (JSONModel *)useRegularFormatWithSpecifiedModel:(NSObject *)sourceModel
{
    Class destClass = [TransformModelNameClass innerModelClassFromOuterModelClass:[sourceModel class]];
    JSONModel *reModel = [[destClass alloc] init];

    NSMutableArray *muAll = [NSMutableArray arrayWithCapacity:0];
    for (NSString  *item in reModel.propertyNameArray) {
        NSMutableArray *muItem = [NSMutableArray arrayWithCapacity:0];
        [muItem addObject:item];
        Class t = object_getClass([reModel valueForKey:item]);
        NSArray *subArray = [NSObject gainPropertyNameArrayWithClass:t];
        for (NSString *subItem in subArray) {
            NSMutableString *muItemStr = [[NSMutableString alloc] initWithString:item];
            [muItemStr appendFormat:@".%@",subItem];
            [muAll addObject:muItemStr];
        }
    }
    NSArray *propertyNameArray = sourceModel.recurPropertyNameArray;
    for (int i = 0; i < propertyNameArray.count; i++) {
        NSString *sourceKey = propertyNameArray[i];
        id value = [sourceModel valueForKey:sourceKey];
        for (int j = 0; j < muAll.count; j++) {
            NSString  *keyPath = muAll[j];
            if ([keyPath hasSuffix:sourceKey]) {
                [reModel setValue:value forKeyPath:keyPath];
            }
        }
        if ([sourceKey isEqualToString:kListIdentifier]) {
            [reModel setValue:value forKey:kRequestModelBodyIdentifier];
        }
    }
    return reModel;
}
+ (NSObject *)useRegularFormatWithJSONModel:(JSONModel *)sourceModel
{
    NSString *destClass = NSStringFromClass([sourceModel class]);
    if ([destClass hasPrefix:kPrefixInnerModer]) {
        NSMutableString *muDestClass = [NSMutableString stringWithString:destClass];
        destClass = [muDestClass substringFromIndex:kPrefixInnerModer.length];
    }else {
        return nil;
    }
    NSObject *reModel = [[NSClassFromString(destClass) alloc] init];
    
    NSMutableArray *muAll = [NSMutableArray arrayWithCapacity:0];
    for (NSString  *item in sourceModel.propertyNameArray) {
        NSMutableArray *muItem = [NSMutableArray arrayWithCapacity:0];
        [muItem addObject:item];
        Class t = object_getClass([sourceModel valueForKey:item]);
        NSArray *subArray = [NSObject gainPropertyNameArrayWithClass:t];
        for (NSString *subItem in subArray) {
            NSMutableString *muItemStr = [[NSMutableString alloc] initWithString:item];
            [muItemStr appendFormat:@".%@",subItem];
            [muAll addObject:muItemStr];
        }
    }
  
    NSArray *propertyNameArray = reModel.recurPropertyNameArray;
    for (int i = 0; i < muAll.count; i++) {
        id value = [sourceModel valueForKeyPath:muAll[i]];
        for (int j = 0; j < propertyNameArray.count; j++) {
            NSString  *key = propertyNameArray[j];
            if ([muAll[i] hasSuffix:key]) {
                [reModel setValue:value forKey:key];
            }
        }
    }
    return reModel;
}
@end
