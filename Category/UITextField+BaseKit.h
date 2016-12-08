//
//  UITextField+BaseKit.h
//  BaseKit
//
//  Created by huangjian on 16/12/8.
//  Copyright © 2016年 huangjian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (BaseKit_UITextField_LeftView)

/**
 * UITextField添加左边图标
 */
- (void)bk_addLeftViewWithImage:(UIImage *)image;

/**
 * UITextField添加左边文字缩进
 */
- (void)bk_addLeftIndent:(CGFloat)width;

@end
