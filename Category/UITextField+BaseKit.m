//
//  UITextField+BaseKit.m
//  BaseKit
//
//  Created by huangjian on 16/12/8.
//  Copyright © 2016年 huangjian. All rights reserved.
//

#import "UITextField+BaseKit.h"

@implementation UITextField (BaseKit_UITextField_LeftView)

- (void)bk_addLeftViewWithImage:(UIImage *)image {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = UIViewContentModeCenter;
    self.leftView = imageView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)bk_addLeftIndent:(CGFloat)width {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    self.leftView = imageView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

@end
