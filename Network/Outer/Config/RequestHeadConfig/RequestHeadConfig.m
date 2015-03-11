//
//  RequestHeadConfig.m
//  Network
//  请求头配置类
//  Created by lizhennan on 14-8-4.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import "RequestHeadConfig.h"
#import "OriginalConfig.h"

@implementation RequestHeadConfig
- (void)setOriginalParameters
{
    self.serverUrlString = kServerUrlString;
    self.timeOutInterval = kHttpTimeOutInterval;
}
+ (RequestHeadConfig *)sharedRequestHeadConfig
{
    static RequestHeadConfig *_sharedConfig = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedConfig = [[self alloc] init];
        [_sharedConfig setOriginalParameters];
    });
    return _sharedConfig;
}
- (void)resumeDefaultConfig
{
    [self setOriginalParameters];
}
@end
