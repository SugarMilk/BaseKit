//
//  UIStoryboard+BaseKit.m
//  BaseKit
//
//  Created by huangjian on 16/12/8.
//  Copyright © 2016年 huangjian. All rights reserved.
//

#import "UIStoryboard+BaseKit.h"

@implementation UIStoryboard (BaseKit_UIStoryboard_Simplify)

+ (id)bk_storyboardWithName:(NSString *)name identifier:(NSString *)identifier {
    
    UIStoryboard *storyboard = [self storyboardWithName:name bundle:nil];
    
    UIViewController *viewController;
    
    if (identifier) {
        viewController = [storyboard instantiateViewControllerWithIdentifier:identifier];
    } else {
        viewController = [storyboard instantiateInitialViewController];
    }
    
    return viewController;
}

@end
