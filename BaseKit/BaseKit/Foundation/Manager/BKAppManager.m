//
//  BKAppManager.m
//  BaseKit
//
//  Created by huangjian on 16/12/8.
//  Copyright © 2016年 huangjian. All rights reserved.
//

#import "BKAppManager.h"

@implementation BKAppManager

+ (instancetype)sharedInstance {
    static BKAppManager * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (NSString *)bundleID {
    return [[NSBundle mainBundle] bundleIdentifier];
}

- (NSString *)bundleName {
    return [[NSBundle mainBundle] infoDictionary][(id)kCFBundleNameKey];
}

- (NSString *)bundleVersion {
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
}

- (NSString *)bundleBuild {
    return [[NSBundle mainBundle] infoDictionary][(id)kCFBundleVersionKey];
}

- (NSString *)displayName {
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleDisplayName"];
}

@end
