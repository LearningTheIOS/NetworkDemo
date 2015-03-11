//
//  NetReach.m
//  Network
//  判断和监听网络状态
//  Created by lizhennan on 14-8-5.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import "NetReach.h"
#import "Reachability.h"
#import "RequestHeadConfig.h"

@interface NetReach()
@property (nonatomic,strong) Reachability *reach;
@property (nonatomic,strong) NetReachStatusChangeBlock statusChangeBlock;
@end
@implementation NetReach
- (void)netReachStatusChanged:(NSNotification *)noti
{
    NetworkStatus curStatus = [self.reach currentReachabilityStatus];
    NetReachStatus reStatus;
    switch (curStatus) {
        case NotReachable:
            reStatus = NetReachStatusNotReachable;
            break;
        case ReachableViaWiFi:
            reStatus = NetReachStatusReachableViaWiFi;
            break;
        case ReachableViaWWAN:
            reStatus = NetReachStatusReachableViaWWAN;
            break;
        default:
            reStatus = MAX_CANON;
            break;
    }
    if (self.statusChangeBlock) {
        self.statusChangeBlock(reStatus);
    }
}
+ (BOOL)reachabilityDefaultServerWithNotReachable:(void (^)(void))notReachable
                                 reachableViaWiFi:(void (^)(void))viaWiFi
                                 reachableViaWWAN:(void (^)(void))viaWWAN
{
    BOOL judgeResult = YES;
    RequestHeadConfig *head = [RequestHeadConfig sharedRequestHeadConfig];
    Reachability *reach = [Reachability reachabilityWithHostName:head.serverUrlString];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            if (notReachable) {
                notReachable();
            }
            break;
        case ReachableViaWiFi:
            if (viaWiFi) {
                viaWiFi();
            }
            break;
        case ReachableViaWWAN:
            if (viaWWAN) {
                viaWWAN();
            }
            break;
        default:
            judgeResult = NO;
            break;
    }
    return judgeResult;
}
+ (NetReach *)startSustainedDetectDefaultServerStatus:(NetReachStatusChangeBlock)statusChange
{
    NetReach *netReach = [[NetReach alloc] init];
    RequestHeadConfig *head = [RequestHeadConfig sharedRequestHeadConfig];
    netReach.reach = [Reachability reachabilityWithHostName:head.serverUrlString];
    netReach.statusChangeBlock = statusChange;
    [[NSNotificationCenter defaultCenter] addObserver:netReach selector:@selector(netReachStatusChanged:) name:kReachabilityChangedNotification object:nil];
    [netReach.reach startNotifier];
    return netReach;
}
- (void)stopDetect
{
    [self.reach stopNotifier];
}
- (void)resumeDetect
{
    [self.reach startNotifier];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
