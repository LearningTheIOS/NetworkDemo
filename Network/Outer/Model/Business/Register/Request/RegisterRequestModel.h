//
//  RegisterRequestModel.h
//  Network
//  注册请求model--DBT001
//  Created by lizhennan on 14-8-5.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import "CommonRequestModel.h"

@interface RegisterRequestModel : CommonRequestModel
//报文体部分
@property (nonatomic,strong) NSString *USER_NAME;
@property (nonatomic,strong) NSString *VERIFY_CODE;
@property (nonatomic,strong) NSString *CERT_NO;
@property (nonatomic,strong) NSString *CUST_NAME;
@property (nonatomic,strong) NSString *LOGIN_PWD;
@end
