//
//  UIButton+BaseKit.h
//  BaseKit
//
//  Created by huangjian on 16/12/8.
//  Copyright © 2016年 huangjian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BKButtonImagePosition) {
    BKButtonImagePositionLeft   = 0,  // 图片左文字右
    BKButtonImagePositionRight  = 1,  // 图片右文字左
    BKButtonImagePositionTop    = 2,  // 图片上文字下
    BKButtonImagePositionBottom = 3,  // 图片下文字上
};

@interface UIButton (BaseKit_UIButton_ImagePosition)

/**
 *  设置按钮图片和文字的位置
 *
 *  @param postion 图片和文字的位置类型
 *  @param inset   图片和文字的间距
 */
- (void)bk_setImagePosition:(BKButtonImagePosition)postion withInset:(CGFloat)inset;

@end

typedef void(^BKButtonRunBlock)(UIButton *button, NSInteger totalTime, NSInteger leftTime);
typedef void(^BKButtonEndBlock)(UIButton *button);

@interface UIButton (BaseKit_UIButton_CountDown)

/**
 *  倒计时按钮
 *
 *  为防止文字闪烁，请将UIButton的类型由 System 改为 Custom
 *
 *  @param duration 总时间
 *  @param runBlock 倒计时期间回调
 *  @param endBlock 倒计时结束回调
 */
- (void)bk_startWithDuration:(NSInteger)duration
                     running:(BKButtonRunBlock)runBlock
                    finished:(BKButtonEndBlock)endBlock;

@end


@interface UIButton (BaseKit_UIButton_Simplify)

@property (nonatomic, copy) NSString * bk_title;
@property (nonatomic, copy) NSString * bk_highlightedtTitle;
@property (nonatomic, copy) NSString * bk_selectedTitle;

@property (nonatomic, strong) UIColor * bk_titleColor;
@property (nonatomic, strong) UIColor * bk_highlightedTitleColor;
@property (nonatomic, strong) UIColor * bk_selectedTitleColor;

@property (nonatomic, strong) UIImage * bk_image;
@property (nonatomic, strong) UIImage * bk_highlightedImage;
@property (nonatomic, strong) UIImage * bk_selectedImage;

@property (nonatomic, strong) UIImage * bk_backgroundImage;
@property (nonatomic, strong) UIImage * bk_highlightedBackgroundImage;
@property (nonatomic, strong) UIImage * bk_selectedBackgroundImage;

@end


@interface UIButton (BaseKit_UIButton_EnlargeEdge)

/**
 *  同时向按钮的四个方向延伸响应面积
 *
 *  @param size 间距
 */
- (void)bk_setEnlargeEdge:(CGFloat)size;

/**
 *
 *  向按钮的四个方向延伸响应面积
 *
 *  @param top    上间距
 *  @param left   左间距
 *  @param bottom 下间距
 *  @param right  右间距
 */
- (void)bk_setEnlargeEdgeWithTop:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right;

@end



