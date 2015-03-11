//
//  INNRegisterReqModel.h
//  Network
//  内部使用，注册报文
//  Created by lizhennan on 14-8-5.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import "JSONModel.h"

@class SYSHEADReqModel;
@class APPHEADReqModel;
@class RegisterBODYReqModel;

@interface INNRegisterRequestModel : JSONModel
@property (nonatomic,strong) SYSHEADReqModel      *SYSHEAD;
@property (nonatomic,strong) APPHEADReqModel      *APPHEAD;
@property (nonatomic,strong) RegisterBODYReqModel *BODY;
@end
