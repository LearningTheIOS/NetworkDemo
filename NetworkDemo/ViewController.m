//
//  ViewController.m
//  NetworkDemo
//
//  Created by lizhennan on 14-8-4.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import "ViewController.h"
#import "NetReach.h"
#import "TransformModel.h"
#import "RegisterRequestModel.h"
#import "RegisterResponseModel.h"
#import "NetRequest.h"

@interface ViewController ()
{
    NetReach *_reach;
    NetRequest *_request;
}
@property(nonatomic,strong) NetRequest *request;
- (IBAction)stopClicked:(id)sender;
- (IBAction)resumeClicked:(id)sender;
- (IBAction)startRequest:(id)sender;
- (IBAction)stopRequest:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    RegisterRequestModel *reg = [[RegisterRequestModel alloc] init];
    reg.USER_NAME = @"180";
    reg.LOGIN_PWD = @"123456";
    
    self.request = [NetRequest createWithRequestModel:reg];
    
    [_request setPostRequestWillStart:^(NSString *TXN_CODE, NSString *reqID) {
        NSLog(@"开始网络请求：%@  %@" ,TXN_CODE,reqID);

    } completionBlock:^(NSString *reqID, id responseModel) {
        if ([responseModel isKindOfClass:[RegisterResponseModel class]]) {
            RegisterResponseModel *rr = (RegisterResponseModel *)responseModel;
            NSLog(@"%@注册成功：%@ :%@",rr.RSP_CODE,rr.RSP_MSG,reqID);
        }
    } failure:^(NSString *reqID, id errorResModel, NSError *error) {
        if (errorResModel) {
            NSLog(@"操作失败：%@",reqID);
        } else {
            NSLog(@"%@请求****失败",reqID);

        }

    }];

    
    //判断网络当前状态
    
	[NetReach reachabilityDefaultServerWithNotReachable:^{
        NSLog(@"not");
    } reachableViaWiFi:^{
        NSLog(@"wifi");
    }
     reachableViaWWAN:^{
        NSLog(@"wan");
    }];
     
    //持续监听网络状态
    _reach = [NetReach startSustainedDetectDefaultServerStatus:^(NetReachStatus status) {
        [NetReach reachabilityDefaultServerWithNotReachable:^{
            NSLog(@"11not");
        } reachableViaWiFi:^{
            NSLog(@"11wifi");
        }
        reachableViaWWAN:^{
            NSLog(@"11wan");
        }];
        switch (status) {
            case NetReachStatusNotReachable:
                NSLog(@"不能连接");
                break;
            case NetReachStatusReachableViaWiFi:
                NSLog(@"WIFI连接正常");
                break;
            case NetReachStatusReachableViaWWAN:
                NSLog(@"3G连接正常");
                break;
            default:
                NSLog(@"监听异常");
                break;
        }
    }];

}

- (IBAction)stopClicked:(id)sender {
    [_reach stopDetect];
}

- (IBAction)resumeClicked:(id)sender {
    [_reach resumeDetect];
}

- (IBAction)startRequest:(id)sender {
    static int tag = 1;
    NSString *identifier = [NSString stringWithFormat:@"req%d",tag++];
    [_request startRequestWithRequestIdentifier:identifier];
}

- (IBAction)stopRequest:(id)sender {
    static int tag = 2;
    NSString *identifier = [NSString stringWithFormat:@"req%d",tag++];
    NSLog(@"停止：%@",identifier);
    [_request stopRequestWithRequestIdentifier:identifier];
}
@end
