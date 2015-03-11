//
//  NSObject+SEARunTime.m
//  StudyEfficiencyAccumulation
//
//  Created by lizhennan on 14-6-13.
//  Copyright (c) 2014年 BOC. All rights reserved.
//

#import "NSObject+SEARunTime.h"

@implementation NSObject (SEARunTime)

- (NSArray *)propertyNameArray
{
    return [[self class] gainPropertyNameArray];
}
- (NSArray *)recurPropertyNameArray
{
    return [[self class] recurGainPropertyNameArray];
}
+ (NSArray *)gainPropertyNameArray
{
    return [[self class] gainPropertyNameArrayWithClass:[self class]];
}
+ (NSArray *)recurGainPropertyNameArray
{
    NSMutableArray *re = [NSMutableArray arrayWithCapacity:0];
    unsigned int outCount;
    Class judgeSuperClass = [self class];
    while (judgeSuperClass != [NSObject class]) {
        objc_property_t *props = class_copyPropertyList(judgeSuperClass, &outCount);
        for (int i = 0; i < outCount; i++) {
            objc_property_t property = props[i];
            const char *propName = property_getName(property);
            [re addObject:[NSString stringWithUTF8String:propName]];
        }
        free(props);
        judgeSuperClass = [judgeSuperClass superclass];
    }
    return [re copy];
}
+ (NSDictionary *)gainIvars
{
    NSMutableDictionary *re = [NSMutableDictionary dictionaryWithCapacity:0];
    unsigned int numIvars;
    Ivar *vars = class_copyIvarList([self class], &numIvars);
    NSString *keyName;
    NSString *valueType;
    for (int i = 0; i < numIvars; i++) {
        Ivar thisIvar = vars[i];
        keyName = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
        valueType = [NSString stringWithUTF8String:ivar_getTypeEncoding(thisIvar)];
        [re setObject:valueType forKey:keyName];
    }
    free(vars);
    return [re copy];
}
+ (NSArray *)gainPropertyNameArrayWithClass:(Class)sourceClass
{
    {
        NSMutableArray *re = [NSMutableArray arrayWithCapacity:0];
        unsigned int outCount;
        objc_property_t *props = class_copyPropertyList(sourceClass, &outCount);
        for (int i = 0; i < outCount; i++) {
            objc_property_t property = props[i];
            const char *propName = property_getName(property);
            [re addObject:[NSString stringWithUTF8String:propName]];
        }
        free(props);
        return [re copy];
    }
}
@end
