//
//  UIBarButtonItem+BaseKit.h
//  BaseKit
//
//  Created by huangjian on 16/12/8.
//  Copyright © 2016年 huangjian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (BaseKit_UIBarButtonItem_Simplify)

+ (instancetype)bk_itemWithTitle:(NSString *)title
                           color:(UIColor *)color target:(id)target action:(SEL)action;

+ (instancetype)bk_itemWithImage:(UIImage *)image
                       highImage:(UIImage *)highImage target:(id)target action:(SEL)action;

+ (instancetype)bk_itemWithSpaceWidth:(CGFloat)width;

@end
