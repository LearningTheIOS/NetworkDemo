//
//  LocalDataManager.m
//  Network
//
//  Created by lizhennan on 14-8-11.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import "LocalDataManager.h"
#import <CoreData/CoreData.h>
#import "RegisterRequest.h"
#import "RegisterRequestModel.h"

@interface LocalDataManager ()
@property (readonly,strong,nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly,strong,nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly,strong,nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@end
@implementation LocalDataManager
- (void)setParameters
{
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"LocalModel" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    NSURL *storeURL = [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject] URLByAppendingPathComponent:@"LocalModel.sqlite"];
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_managedObjectModel];
    [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:nil];
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:_persistentStoreCoordinator];
}
+ (LocalDataManager *)sharedLocalDataManager
{
    static LocalDataManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
        [_sharedManager setParameters];
    });
    return _sharedManager;
}
- (NSArray *)fetchDataWithEntityName:(NSString *)name
{
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:name inManagedObjectContext:self.managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    return [self.managedObjectContext executeFetchRequest:request error:nil];
}
- (BOOL)insertDataWithEntityName:(NSString *)name addData:(NSObject *)data
{
    RegisterRequest *new = [NSEntityDescription insertNewObjectForEntityForName:name inManagedObjectContext:self.managedObjectContext];
    if ([data isKindOfClass:[RegisterRequestModel class]]) {
        RegisterRequestModel *req = (RegisterRequestModel *)data;
        new.cust_name = req.CUST_NAME;
        new.cert_no = req.CERT_NO;
        new.login_pwd = req.LOGIN_PWD;
        new.user_name = req.USER_NAME;
        new.verify_code = req.VERIFY_CODE;
    }
    return [self.managedObjectContext save:nil];
}
@end
