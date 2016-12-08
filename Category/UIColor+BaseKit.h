//
//  UIColor+BaseKit.h
//  BaseKit
//
//  Created by huangjian on 16/12/8.
//  Copyright © 2016年 huangjian. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BKHexRandomColor         [UIColor bk_randomColor]
#define BKHexStringColor(string) [UIColor bk_colorWithHexString:string]
#define BKHexRGBColor(R, G, B)   [UIColor bk_colorWith8BitRed:R green:G blue:B]

@interface UIColor (BaseKit_UIColor_Hex)

+ (UIColor *)bk_randomColor;

+ (UIColor *)bk_colorWithHexString:(NSString *)color;
+ (UIColor *)bk_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

+ (UIColor *)bk_colorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;
+ (UIColor *)bk_colorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha;

@end
