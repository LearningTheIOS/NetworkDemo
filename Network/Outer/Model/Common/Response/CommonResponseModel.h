//
//  CommonResponseModel.h
//  Network
//  响应报文公共部分
//  Created by lizhennan on 14-8-5.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonResponseModel : NSObject
//系统头部分
@property (nonatomic,strong) NSString *RSP_CODE;
@property (nonatomic,strong) NSString *RSP_MSG;
@end
