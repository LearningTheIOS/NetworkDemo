//
//  NetRequest.h
//  Network
//  网络请求类
//  Created by lizhennan on 14-8-5.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetRequest : NSObject

/**
 *  通过|reqModel|创建接口请求对象，一个接口请求对象只能对应一个请求Model
 *
 *  @param reqModel 请求Model
 *
 *  @return 接口请求对象
 */
+ (NetRequest *)createWithRequestModel:(NSObject *)reqModel;

/**
 *  设置Block参数
 *
 *  @param willStart 将要请求执行
 *  @param success   操作成功返回
 *  @param failure   操作失败:error = nil,请求失败:errorResModel = nil
 */
- (void)setPostRequestWillStart:(void(^)(NSString *TXN_CODE,NSString *reqID))willStart
                completionBlock:(void(^)(NSString *reqID,id responseModel))success
                        failure:(void(^)(NSString *reqID,id errorResModel, NSError *error))failure;

/**
 *  开始请求接口
 *
 *  @param reqID 请求接口标示符，标示符不能与正在请求的标示符重复
 *
 *  @return 开启有效请求则返回YES，否则返回NO
 */
- (BOOL)startRequestWithRequestIdentifier:(NSString *)reqID;

/**
 *  停止网络请求
 *
 *  @param reqID 停止网络请求标示符
 *
 *  @return 标示符是正在请求的标示符，则返回YES，否则返回NO
 */
- (BOOL)stopRequestWithRequestIdentifier:(NSString *)reqID;

@end
