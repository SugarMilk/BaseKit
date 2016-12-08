//
//  BKAppManager.h
//  BaseKit
//
//  Created by huangjian on 16/12/8.
//  Copyright © 2016年 huangjian. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BKCurrentApplication [BKAppManager sharedInstance]

@interface BKAppManager : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, copy, readonly) NSString * bundleID;
@property (nonatomic, copy, readonly) NSString * bundleName;
@property (nonatomic, copy, readonly) NSString * bundleVersion;
@property (nonatomic, copy, readonly) NSString * bundleBuild;

@property (nonatomic, copy, readonly) NSString * displayName;

@end
