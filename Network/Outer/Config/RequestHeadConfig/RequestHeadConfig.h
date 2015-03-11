//
//  RequestHeadConfig.h
//  Network
//  请求头配置类
//  Created by lizhennan on 14-8-4.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestHeadConfig : NSObject

//服务器地址
@property (nonatomic,strong) NSString *serverUrlString;
//超时时间
@property (nonatomic,assign) CGFloat timeOutInterval;
//demo模式开关：无网时，可设置为YES，使用本地数据,default is NO
@property (nonatomic,assign) BOOL isDemoMode;

/**
 *  单例类，提供默认设置的请求头参数
 *
 *  @return 单例对象
 */
+ (RequestHeadConfig *)sharedRequestHeadConfig;

/**
 *  恢复默认请求头参数，不包含属性|isDemoMode|
 */
- (void)resumeDefaultConfig;

@end
