//
//  BKDeviceManager.h
//  BaseKit
//
//  Created by huangjian on 16/12/8.
//  Copyright © 2016年 huangjian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define bk_StatusH 20
#define bk_NavBarH 44
#define bk_StatusAndNavBarH 64
#define bk_TabBarH 49

#define BKCurrentDevice [BKDeviceManager sharedInstance]

@interface BKDeviceManager : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, assign, readonly) CGFloat screenWidth;
@property (nonatomic, assign, readonly) CGFloat screenHeight;

@property (nonatomic, copy, readonly) NSString * uuid;
@property (nonatomic, copy, readonly) NSString * model;
@property (nonatomic, copy, readonly) NSString * systemName;
@property (nonatomic, copy, readonly) NSString * systemVersion;

@property(nonatomic, assign) UIDeviceOrientation orientation;

@end
