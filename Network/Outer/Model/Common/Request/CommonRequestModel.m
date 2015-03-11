//
//  CommonRequestModel.m
//  Network
//  请求报文公共部分
//  Created by lizhennan on 14-8-5.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import "CommonRequestModel.h"
#import "OriginalConfig.h"

@implementation CommonRequestModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.TXN_CODE    = kNullString;
        self.CHNL_ID     = kChannelID;
        self.PLATFORM    = kPlatform;
        self.VERSION     = kVersion;
        self.SESSION_ID  = kNullString;
        self.CUST_NO     = kNullString;
        self.TOTAL_NUM   = kNullString;
        self.CURRENT_NUM = kNullString;
        self.PAGE_INDEX  = kNullString;
    }
    return self;
}
@end
