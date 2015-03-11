//
//  INNFinanceRiskEstimateRequestModel.m
//  Network
//  内部使用，理财风险评估报文
//  Created by lizhennan on 14-8-6.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import "INNFinanceRiskEstimateRequestModel.h"
#import "SYSHEADReqModel.h"
#import "APPHEADReqModel.h"

@implementation INNFinanceRiskEstimateRequestModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.SYSHEAD = [[SYSHEADReqModel alloc] init];
        self.APPHEAD = [[APPHEADReqModel alloc] init];
        self.BODY = (NSMutableArray<FinanceRiskEstimateItemRequestModel> *)[NSMutableArray arrayWithCapacity:0];
    }
    return self;
}
@end
