//
//  RequestServer.m
//  Network
//
//  Created by lizhennan on 14-8-11.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import "RequestServer.h"
#import "AFNetworking.h"
#import "RequestHeadConfig.h"
#import "InnerConfig.h"
#import "JSONModel.h"
#import "TransformModel.h"

@interface RequestServer ()

@end
@implementation RequestServer
- (void)startRequestBody
{
    NSString *currentReqID = [self.requestIdentifierStore lastObject];
    self.willStart(self.requestModelTXN_CODE,currentReqID);
    RequestHeadConfig *head = [RequestHeadConfig sharedRequestHeadConfig];
    AFHTTPRequestSerializer *ser = [AFHTTPRequestSerializer serializer];
    NSMutableURLRequest *mr = [ser requestWithMethod:kHttpPostMethod URLString:head.serverUrlString parameters:self.requestModelParameters error:nil];
    [mr setTimeoutInterval:head.timeOutInterval];
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:mr];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    op.requestIdentifier = currentReqID;
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([self.requestIdentifierStore containsObject:operation.requestIdentifier]) {
            [self.requestIdentifierStore removeObject:operation.requestIdentifier];
            JSONModel *resModel = [[self.responseModelClass alloc] initWithDictionary:responseObject error:nil];
            id resOuterModel = [TransformModel useRegularFormatWithJSONModel:resModel];
            NSString *opErrorCode = [resOuterModel valueForKey:kOuterResponseResultKey];
            if ([opErrorCode isEqualToString:kOuterResponseRightResultCode]) {
                self.success(operation.requestIdentifier,resOuterModel);
            } else {
                self.failure(operation.requestIdentifier,resOuterModel,nil);
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if ([self.requestIdentifierStore containsObject:operation.requestIdentifier]) {
            [self.requestIdentifierStore removeObject:operation.requestIdentifier];
            self.failure(operation.requestIdentifier,nil,error);
        }
    }];
    [op start];
}
@end
