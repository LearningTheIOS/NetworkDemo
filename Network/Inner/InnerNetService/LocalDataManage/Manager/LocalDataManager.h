//
//  LocalDataManager.h
//  Network
//  单例类，控制本地数据的读写操作
//  Created by lizhennan on 14-8-11.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalDataManager : NSObject
+ (LocalDataManager *)sharedLocalDataManager;
- (NSArray *)fetchDataWithEntityName:(NSString *)name;
- (BOOL)insertDataWithEntityName:(NSString *)name addData:(NSObject *)data;
@end
