//
//  INNFinanceRiskEstimateRequestModel.h
//  Network
//  内部使用，理财风险评估报文
//  Created by lizhennan on 14-8-6.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import "JSONModel.h"
#import "FinanceRiskEstimateRequestModel.h"

@class SYSHEADReqModel;
@class APPHEADReqModel;

@interface INNFinanceRiskEstimateRequestModel : JSONModel
@property (nonatomic,strong) SYSHEADReqModel *SYSHEAD;
@property (nonatomic,strong) APPHEADReqModel *APPHEAD;
@property (nonatomic,strong) NSMutableArray<FinanceRiskEstimateItemRequestModel> *BODY;
@end

