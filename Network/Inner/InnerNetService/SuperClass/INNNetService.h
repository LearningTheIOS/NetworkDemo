//
//  INNNetService.h
//  Network
//  空类，模拟抽象类，使用需用具体子类
//  Created by lizhennan on 14-8-11.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface INNNetService : NSObject
@property (nonatomic,strong) NSObject *requestOuterModel;
@property (nonatomic,strong) id requestModelParameters;
@property (nonatomic,strong) Class responseModelClass;
@property (nonatomic,strong) NSString *requestModelTXN_CODE;
@property (nonatomic,strong) NSMutableArray *requestIdentifierStore;
@property (nonatomic,strong,readonly) void(^willStart)(NSString *TXN_CODE,NSString *reqID);
@property (nonatomic,strong,readonly) void(^success)(NSString *reqID,id responseModel);
@property (nonatomic,strong,readonly) void(^failure)(NSString *reqID,id errorResModel, NSError *error);

- (void)setPostRequestWillStart:(void(^)(NSString *TXN_CODE,NSString *reqID))willStart
                completionBlock:(void(^)(NSString *reqID,id responseModel))success
                        failure:(void(^)(NSString *reqID,id errorResModel, NSError *error))failure;
- (BOOL)startRequestWithRequestIdentifier:(NSString *)reqID;
- (BOOL)stopRequestWithRequestIdentifier:(NSString *)reqID;
@end

@interface INNNetService (SubClassImplement)
/**
 *  具体请求方法实体，由子类具体实现，不同请求方式，实现则不同
 */
- (void)startRequestBody;
@end
