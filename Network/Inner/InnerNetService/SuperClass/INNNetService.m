//
//  INNNetService.m
//  Network
//
//  Created by lizhennan on 14-8-11.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import "INNNetService.h"

@interface INNNetService ()
@property (nonatomic,strong) void(^willStart)(NSString *TXN_CODE,NSString *reqID);
@property (nonatomic,strong) void(^success)(NSString *reqID,id responseModel);
@property (nonatomic,strong) void(^failure)(NSString *reqID,id errorResModel, NSError *error);
@end
@implementation INNNetService
- (void)setPostRequestWillStart:(void(^)(NSString *TXN_CODE,NSString *reqID))willStart
                completionBlock:(void(^)(NSString *reqID,id responseModel))success
                        failure:(void(^)(NSString *reqID,id errorResModel, NSError *error))failure
{
    self.willStart = willStart;
    self.success   = success;
    self.failure   = failure;
}
- (BOOL)startRequestWithRequestIdentifier:(NSString *)reqID
{
    if ([self.requestIdentifierStore containsObject:reqID]) {
        return NO;
    } else {
        [self.requestIdentifierStore addObject:reqID];
        [self startRequestBody];
        return YES;
    }
}
- (BOOL)stopRequestWithRequestIdentifier:(NSString *)reqID
{
    if ([self.requestIdentifierStore containsObject:reqID]) {
        [self.requestIdentifierStore removeObject:reqID];
        return YES;
    }
    return NO;
}
@end
