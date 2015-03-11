//
//  RegisterRequest.h
//  NetworkDemo
//
//  Created by lizhennan on 14-8-11.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface RegisterRequest : NSManagedObject

@property (nonatomic, retain) NSString * cert_no;
@property (nonatomic, retain) NSString * cust_name;
@property (nonatomic, retain) NSString * login_pwd;
@property (nonatomic, retain) NSString * user_name;
@property (nonatomic, retain) NSString * verify_code;

@end
