//
//  RegisterBODYReqModel.h
//  Network
//  请求报文报文体部分
//  Created by lizhennan on 14-8-5.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import "JSONModel.h"

@interface RegisterBODYReqModel : JSONModel
@property (nonatomic,strong) NSString *USER_NAME;
@property (nonatomic,strong) NSString *VERIFY_CODE;
@property (nonatomic,strong) NSString *CERT_NO;
@property (nonatomic,strong) NSString *CUST_NAME;
@property (nonatomic,strong) NSString *LOGIN_PWD;
@end
