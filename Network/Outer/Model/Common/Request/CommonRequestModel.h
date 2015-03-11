//
//  CommonRequestModel.h
//  Network
//  请求报文公共部分
//  Created by lizhennan on 14-8-5.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonRequestModel : NSObject
//系统头部分
@property (nonatomic,strong) NSString *TXN_CODE;
@property (nonatomic,strong) NSString *CHNL_ID;
@property (nonatomic,strong) NSString *PLATFORM;
@property (nonatomic,strong) NSString *VERSION;
@property (nonatomic,strong) NSString *SESSION_ID;
@property (nonatomic,strong) NSString *CUST_NO;
//应用头部分
@property (nonatomic,strong) NSString *TOTAL_NUM;
@property (nonatomic,strong) NSString *CURRENT_NUM;
@property (nonatomic,strong) NSString *PAGE_INDEX;
@end
