//
//  FinanceRiskEstimateRequestModel.m
//  Network
//  理财风险评估请求Model--DBT024
//  Created by lizhennan on 14-8-6.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import "FinanceRiskEstimateRequestModel.h"
#import "OriginalConfig.h"

@implementation FinanceRiskEstimateRequestModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.TXN_CODE = kFinanceRiskEstimate;
        self.List     = (NSMutableArray<FinanceRiskEstimateItemRequestModel> *)[NSMutableArray arrayWithCapacity:0];
    }
    return self;
}
@end

@implementation FinanceRiskEstimateItemRequestModel

@end