//
//  TransformModelNameClass.m
//  Network
//  内外部model--Class转换
//  Created by lizhennan on 14-8-6.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import "TransformModelNameClass.h"
#import "InnerConfig.h"

@implementation TransformModelNameClass
+ (Class)innerModelClassFromOuterModelClass:(Class)source
{
    NSString *sourceClass = NSStringFromClass(source);
    NSString *destClass = [NSString stringWithFormat:@"%@%@",kPrefixInnerModer,sourceClass];
    return NSClassFromString(destClass);
}
+ (Class)innerResponseModelClassFromOuterRequestModelClass:(Class)source
{
    Class reClass = [[self class] innerModelClassFromOuterModelClass:source];
    NSMutableString *reStr = [NSMutableString stringWithString:NSStringFromClass(reClass)];
    [reStr replaceOccurrencesOfString:kRequestIdentifier withString:kResponseIdentifier options:NSRegularExpressionSearch range:NSMakeRange(0, reStr.length)];
    return NSClassFromString(reStr);
}
@end
