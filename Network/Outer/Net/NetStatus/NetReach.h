//
//  NetReach.h
//  Network
//  判断和监听网络状态
//  Created by lizhennan on 14-8-5.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, NetReachStatus) {
    NetReachStatusNotReachable = 0,//不能连接
	NetReachStatusReachableViaWiFi,//wifi
	NetReachStatusReachableViaWWAN //3G
};

typedef void(^NetReachStatusChangeBlock)(NetReachStatus status);

@interface NetReach : NSObject

/**
 *  判断当前网络状态(采用程序内初始设置的服务器地址)
 *
 *  @param notReachable 不能连接---则执行此block
 *  @param viaWiFi      wifi---则执行此block
 *  @param viaWWAN      3G---则执行此block
 *
 *  @return 判断有效则返回YES，否则返回NO
 */
+ (BOOL)reachabilityDefaultServerWithNotReachable:(void(^)(void))notReachable
                                 reachableViaWiFi:(void(^)(void))viaWiFi
                                 reachableViaWWAN:(void(^)(void))viaWWAN;

/**
 *  持续监听网络状态(采用程序内初始设置的服务器地址)
 *
 *  @param statusChange 当网络状态发生变化时，就会触发执行block|statusChange|
 *
 *  @return |NetReach|实例
 */
+ (NetReach *)startSustainedDetectDefaultServerStatus:(NetReachStatusChangeBlock)statusChange;

/**
 *  停止监听
 */
- (void)stopDetect;

/**
 *  恢复监听
 */
- (void)resumeDetect;

@end
