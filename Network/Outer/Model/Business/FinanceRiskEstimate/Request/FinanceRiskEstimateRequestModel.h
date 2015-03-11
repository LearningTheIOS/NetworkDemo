//
//  FinanceRiskEstimateRequestModel.h
//  Network
//  理财风险评估请求Model--DBT024
//  Created by lizhennan on 14-8-6.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import "CommonRequestModel.h"
#import "JSONModel.h"

@protocol FinanceRiskEstimateItemRequestModel
@end

@interface FinanceRiskEstimateRequestModel : CommonRequestModel
//报文体部分，是个数组，数组内对象是FinanceRiskEstimateItemRequestModel
//数组已初始化，可以直接使用
@property (nonatomic,strong) NSMutableArray<FinanceRiskEstimateItemRequestModel> *List;
@end

@interface FinanceRiskEstimateItemRequestModel : JSONModel
@property (nonatomic,strong) NSString *EVALUATE_NO;
@property (nonatomic,strong) NSString *ANSWER_NO;
@end
