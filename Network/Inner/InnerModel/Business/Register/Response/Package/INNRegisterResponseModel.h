//
//  INNRegisterResponseModel.h
//  Network
//  注册响应model
//  Created by lizhennan on 14-8-5.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import "JSONModel.h"

@class SYSHEADResModel;
@interface INNRegisterResponseModel : JSONModel
@property (nonatomic,strong) SYSHEADResModel *SYSHEAD;
@property (nonatomic,strong) NSString *BODY;
@end
