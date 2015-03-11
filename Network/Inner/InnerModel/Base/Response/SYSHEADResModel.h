//
//  SYSHEADResModel.h
//  Network
//  响应报文系统头部分
//  Created by lizhennan on 14-8-5.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import "JSONModel.h"

@interface SYSHEADResModel : JSONModel
//系统头部分
@property (nonatomic,strong) NSString *RSP_CODE;
@property (nonatomic,strong) NSString *RSP_MSG;
@end
