//
//  InnerConfig.h
//  Network
//  内部配置文件
//  Created by lizhennan on 14-8-5.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#ifndef Network_InnerConfig_h
#define Network_InnerConfig_h

#define kHttpGetMethod @"GET"
#define kHttpPostMethod @"POST"

#define kPrefixInnerModer @"INN"
//用在modle转换时，判断有没有数组列表，做特殊处理
#define kListIdentifier @"List"
#define kRequestModelBodyIdentifier @"BODY"

#define kRequestTXN_CODEKeyPath @"SYSHEAD.TXN_CODE"

#define kRequestIdentifier @"Request"
#define kResponseIdentifier @"Response"

#define kOuterResponseResultKey @"RSP_CODE"
#define kOuterResponseRightResultCode @"000000"

#endif
