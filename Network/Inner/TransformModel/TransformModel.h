//
//  TransformModel.h
//  Network
//  Model转换，外部使用Model转换内部JSONModel
//  Created by lizhennan on 14-8-5.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JSONModel.h"

@interface TransformModel : NSObject

/**
 *  外部请求model转换成内部请求model（注意格式）
 *
 *  @param sourceModel 外部请求model
 *
 *  @return 内部请求model
 */
+ (JSONModel *)useRegularFormatWithSpecifiedModel:(NSObject *)sourceModel;

/**
 *  内部响应model转换成外部响应model（注意格式）
 *
 *  @param sourceModel 内部响应model
 *
 *  @return 外部响应model
 */
+ (NSObject *)useRegularFormatWithJSONModel:(JSONModel *)sourceModel;

@end
