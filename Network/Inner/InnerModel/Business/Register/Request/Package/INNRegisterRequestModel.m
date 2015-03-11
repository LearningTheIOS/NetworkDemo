//
//  INNRegisterReqModel.m
//  Network
//  内部使用，注册报文
//  Created by lizhennan on 14-8-5.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import "INNRegisterRequestModel.h"
#import "SYSHEADReqModel.h"
#import "APPHEADReqModel.h"
#import "RegisterBODYReqModel.h"

@implementation INNRegisterRequestModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.SYSHEAD = [[SYSHEADReqModel alloc] init];
        self.APPHEAD = [[APPHEADReqModel alloc] init];
        self.BODY    = [[RegisterBODYReqModel alloc] init];
    }
    return self;
}

@end
