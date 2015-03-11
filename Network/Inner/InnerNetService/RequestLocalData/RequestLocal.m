//
//  RequestLocal.m
//  Network
//
//  Created by lizhennan on 14-8-11.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import "RequestLocal.h"
#import "InnerConfig.h"
#import "LocalDataManager.h"
#import "RegisterRequestModel.h"
#import "RegisterRequest.h"
#import "RegisterResponseModel.h"

@interface RequestLocal ()
@property(nonatomic,strong) LocalDataManager *manager;
@end
@implementation RequestLocal
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.manager = [LocalDataManager sharedLocalDataManager];
    }
    return self;
}
- (void)startRequestBody
{
    NSString *currentReqID = [self.requestIdentifierStore lastObject];
    self.willStart(self.requestModelTXN_CODE,currentReqID);
    
    NSArray *array = [self.manager fetchDataWithEntityName:@"RegisterRequest"];
    RegisterRequestModel *reqOuterModel = (RegisterRequestModel *)self.requestOuterModel;
    for (RegisterRequest *item in array) {
        if ([item.user_name isEqualToString:reqOuterModel.USER_NAME]) {
            RegisterResponseModel *resModel = [[RegisterResponseModel alloc] init];
            resModel.RSP_CODE = @"000001";
            resModel.RSP_MSG = @"注册失败！";
            self.failure(self.requestModelTXN_CODE,resModel,nil);
            return;
        }
    }
    [self.manager insertDataWithEntityName:@"RegisterRequest" addData:reqOuterModel];
    RegisterResponseModel *resModel = [[RegisterResponseModel alloc] init];
    resModel.RSP_CODE = kOuterResponseRightResultCode;
    resModel.RSP_MSG = @"注册成功！";
    self.success(self.requestModelTXN_CODE,resModel);
}
@end
