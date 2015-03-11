//
//  NetRequest.m
//  Network
//  网络请求类
//  Created by lizhennan on 14-8-5.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import "NetRequest.h"
#import "RequestHeadConfig.h"
#import "TransformModel.h"
#import "InnerConfig.h"
#import "TransformModelNameClass.h"
#import "RequestServer.h"
#import "RequestHeadConfig.h"
#import "RequestLocal.h"

@interface NetRequest()
@property (nonatomic,strong) INNNetService *netService;
@end
@implementation NetRequest
+ (NetRequest *)createWithRequestModel:(NSObject *)reqModel
{
    NetRequest *request = [[NetRequest alloc] init];
    RequestHeadConfig *head = [RequestHeadConfig sharedRequestHeadConfig];
    if (head.isDemoMode) {
        request.netService = [[RequestLocal alloc] init];
    } else {
        request.netService = [[RequestServer alloc] init];
    }
    JSONModel *model = [TransformModel useRegularFormatWithSpecifiedModel:reqModel];
    request.netService.requestOuterModel = reqModel;
    request.netService.requestModelParameters = [model toDictionary];
    request.netService.responseModelClass = [TransformModelNameClass innerResponseModelClassFromOuterRequestModelClass:[reqModel class]];
    request.netService.requestModelTXN_CODE = [model valueForKeyPath:kRequestTXN_CODEKeyPath];
    request.netService.requestIdentifierStore = [NSMutableArray arrayWithCapacity:0];
    return request;
}
- (void)setPostRequestWillStart:(void(^)(NSString *TXN_CODE,NSString *reqID))willStart
                completionBlock:(void(^)(NSString *reqID,id responseModel))success
                        failure:(void(^)(NSString *reqID,id errorResModel, NSError *error))failure
{
    [self.netService setPostRequestWillStart:willStart completionBlock:success failure:failure];
}
- (BOOL)startRequestWithRequestIdentifier:(NSString *)reqID
{
    return [self.netService startRequestWithRequestIdentifier:reqID];
}
- (BOOL)stopRequestWithRequestIdentifier:(NSString *)reqID
{
    return [self.netService stopRequestWithRequestIdentifier:reqID];
}
@end
