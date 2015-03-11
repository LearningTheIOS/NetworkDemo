//
//  APPHEADReqModel.h
//  Network
//  请求报文应用头部分
//  Created by lizhennan on 14-8-5.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import "JSONModel.h"

@interface APPHEADReqModel : JSONModel
@property (nonatomic,strong) NSString *TOTAL_NUM;
@property (nonatomic,strong) NSString *CURRENT_NUM;
@property (nonatomic,strong) NSString *PAGE_INDEX;
@end
