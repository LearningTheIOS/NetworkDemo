//
//  RegisterRequestModel.m
//  Network
//  注册请求model--DBT001
//  Created by lizhennan on 14-8-5.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import "RegisterRequestModel.h"
#import "OriginalConfig.h"

@implementation RegisterRequestModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.TXN_CODE    = kRegisterID;
        self.USER_NAME   = kNullString;
        self.VERIFY_CODE = kNullString;
        self.CERT_NO     = kNullString;
        self.CUST_NAME   = kNullString;
        self.LOGIN_PWD   = kNullString;
    }
    return self;
}
@end
