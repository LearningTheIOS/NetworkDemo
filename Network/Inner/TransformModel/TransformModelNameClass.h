//
//  TransformModelNameClass.h
//  Network
//  内外部model--Class转换
//  Created by lizhennan on 14-8-6.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransformModelNameClass : NSObject
+ (Class)innerModelClassFromOuterModelClass:(Class)source;
+ (Class)innerResponseModelClassFromOuterRequestModelClass:(Class)source;
@end
