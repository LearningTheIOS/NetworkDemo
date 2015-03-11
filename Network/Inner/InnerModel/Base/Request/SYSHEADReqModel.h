//
//  SYSHEADReqModel.h
//  Network
//  请求报文系统头部分
//  Created by lizhennan on 14-8-5.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import "JSONModel.h"

@interface SYSHEADReqModel : JSONModel
@property (nonatomic,strong) NSString *TXN_CODE;
@property (nonatomic,strong) NSString *CHNL_ID;
@property (nonatomic,strong) NSString *PLATFORM;
@property (nonatomic,strong) NSString *VERSION;
@property (nonatomic,strong) NSString *SESSION_ID;
@property (nonatomic,strong) NSString *CUST_NO;
@end
