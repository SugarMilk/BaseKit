//
//  BaseKit.h
//  BaseKit
//
//  Created by huangjian on 16/12/8.
//  Copyright © 2016年 huangjian. All rights reserved.
//

#import <UIKit/UIKit.h>

#define bk_WeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;

//! Project version number for BaseKit.
FOUNDATION_EXPORT double BaseKitVersionNumber;

//! Project version string for BaseKit.
FOUNDATION_EXPORT const unsigned char BaseKitVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <BaseKit/PublicHeader.h>

#import "BKDeviceManager.h"
#import "BKAppManager.h"

#import "NSObject+BaseKit.h"
#import "NSString+BaseKit.h"
#import "UIColor+BaseKit.h"
#import "UIButton+BaseKit.h"
#import "UITextField+BaseKit.h"
#import "UIStoryboard+BaseKit.h"
#import "UIBarButtonItem+BaseKit.h"
