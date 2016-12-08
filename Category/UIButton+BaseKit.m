//
//  UIButton+BaseKit.m
//  BaseKit
//
//  Created by huangjian on 16/12/8.
//  Copyright © 2016年 huangjian. All rights reserved.
//

#import "UIButton+BaseKit.h"
#import <objc/runtime.h>

@implementation UIButton (BaseKit_UIButton_ImagePosition)

- (void)bk_setImagePosition:(BKButtonImagePosition)postion withInset:(CGFloat)inset {
    
    [self setTitle:self.currentTitle forState:UIControlStateNormal];
    [self setImage:self.currentImage forState:UIControlStateNormal];
    
    CGFloat imageWidth  = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGFloat labelWidth  = [self.titleLabel.text sizeWithFont:self.titleLabel.font].width;
    CGFloat labelHeight = [self.titleLabel.text sizeWithFont:self.titleLabel.font].height;
#pragma clang diagnostic pop
    
    CGFloat imageOffsetX = (imageWidth + labelWidth) / 2 - imageWidth / 2;
    CGFloat imageOffsetY = imageHeight / 2 + inset / 2;
    CGFloat labelOffsetX = (imageWidth + labelWidth / 2) - (imageWidth + labelWidth) / 2;
    CGFloat labelOffsetY = labelHeight / 2 + inset / 2;
    
    CGFloat tempWidth     = MAX(labelWidth, imageWidth);
    CGFloat changedWidth  = labelWidth + imageWidth - tempWidth;
    CGFloat tempHeight    = MAX(labelHeight, imageHeight);
    CGFloat changedHeight = labelHeight + imageHeight + inset - tempHeight;
    
    switch (postion) {
        case BKButtonImagePositionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -inset/2, 0, inset/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, inset/2, 0, -inset/2);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, inset/2, 0, inset/2);
            break;
        case BKButtonImagePositionRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + inset/2, 0, -(labelWidth + inset/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWidth + inset/2), 0, imageWidth + inset/2);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, inset/2, 0, inset/2);
            break;
        case BKButtonImagePositionTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(imageOffsetY, -changedWidth/2, changedHeight-imageOffsetY, -changedWidth/2);
            break;
        case BKButtonImagePositionBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(changedHeight-imageOffsetY, -changedWidth/2, imageOffsetY, -changedWidth/2);
            break;
        default:
            break;
    }
}

@end

@implementation UIButton (BaseKit_UIButton_CountDown)

- (void)bk_startWithDuration:(NSInteger)duration
                     running:(BKButtonRunBlock)runBlock
                    finished:(BKButtonEndBlock)endBlock {
    
    __block NSInteger timeOut = duration;
    dispatch_queue_t queue    = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer  = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        
        if (timeOut <= 0) {
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                endBlock(self);
            });
        } else {
            
            int allTime = (int)duration + 1;
            int seconds = timeOut % allTime;
            dispatch_async(dispatch_get_main_queue(), ^{
                runBlock(self, duration, seconds);
            });
            timeOut--;
        }
    });
    dispatch_resume(_timer);
}

@end


@implementation UIButton (BaseKit_UIButton_Simplify)

- (void)setBk_title:(NSString *)bk_title {
    [self setTitle:bk_title forState:UIControlStateNormal];
}

- (void)setBk_highlightedtTitle:(NSString *)bk_highlightedtTitle {
    [self setTitle:bk_highlightedtTitle forState:UIControlStateHighlighted];
}

- (void)setBk_selectedTitle:(NSString *)bk_selectedTitle {
    [self setTitle:bk_selectedTitle forState:UIControlStateSelected];
}

- (void)setBk_titleColor:(UIColor *)bk_titleColor {
    [self setTitleColor:bk_titleColor forState:UIControlStateNormal];
}

- (void)setBk_highlightedTitleColor:(UIColor *)bk_highlightedTitleColor {
    [self setTitleColor:bk_highlightedTitleColor forState:UIControlStateHighlighted];
}

- (void)setBk_selectedTitleColor:(UIColor *)bk_selectedTitleColor {
    [self setTitleColor:bk_selectedTitleColor forState:UIControlStateSelected];
}

- (void)setBk_image:(UIImage *)bk_image {
    [self setImage:bk_image forState:UIControlStateNormal];
}

- (void)setBk_highlightedImage:(UIImage *)bk_highlightedImage {
    [self setImage:bk_highlightedImage forState:UIControlStateHighlighted];
}

- (void)setBk_selectedImage:(UIImage *)bk_selectedImage {
    [self setImage:bk_selectedImage forState:UIControlStateSelected];
}

- (void)setBk_backgroundImage:(UIImage *)bk_backgroundImage {
    [self setBackgroundImage:bk_backgroundImage forState:UIControlStateNormal];
}

- (void)setBk_highlightedBackgroundImage:(UIImage *)bk_highlightedBackgroundImage {
    [self setBackgroundImage:bk_highlightedBackgroundImage forState:UIControlStateNormal];
}

- (void)setBk_selectedBackgroundImage:(UIImage *)bk_selectedBackgroundImage {
    [self setBackgroundImage:bk_selectedBackgroundImage forState:UIControlStateNormal];
}

- (NSString *)bk_title {
    return [self titleForState:UIControlStateNormal];
}

- (NSString *)bk_highlightedtTitle {
    return [self titleForState:UIControlStateHighlighted];
}

- (NSString *)bk_selectedTitle {
    return [self titleForState:UIControlStateSelected];
}

- (UIColor *)bk_titleColor {
    return self.currentTitleColor;
}

- (UIColor *)bk_highlightedTitleColor {
    return self.currentTitleColor;
}

- (UIColor *)bk_selectedTitleColor {
    return self.currentTitleColor;
}

- (UIImage *)bk_image {
    return self.currentImage;
}

- (UIImage *)bk_highlightedImage {
    return self.currentImage;
}

- (UIImage *)bk_selectedImage {
    return self.currentImage;
}

- (UIImage *)bk_backgroundImage {
    return self.currentBackgroundImage;
}

- (UIImage *)bk_highlightedBackgroundImage {
    return self.currentBackgroundImage;
}

- (UIImage *)bk_selectedBackgroundImage {
    return self.currentBackgroundImage;
}

@end

@implementation UIButton (BaseKit_UIButton_EnlargeEdge)

static char topNameKey;
static char leftNameKey;
static char bottomNameKey;
static char rightNameKey;

- (void)bk_setEnlargeEdge:(CGFloat)size {
    
    objc_setAssociatedObject(self, &topNameKey,   [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey,  [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey,[NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)bk_setEnlargeEdgeWithTop:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right {
    
    objc_setAssociatedObject(self, &topNameKey,   [NSNumber numberWithFloat:top],   OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey,  [NSNumber numberWithFloat:left],  OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey,[NSNumber numberWithFloat:bottom],OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargedRect
{
    NSNumber* topEdge    = objc_getAssociatedObject(self, &topNameKey);
    NSNumber* rightEdge  = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber* bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber* leftEdge   = objc_getAssociatedObject(self, &leftNameKey);
    
    if (topEdge && rightEdge && bottomEdge && leftEdge)
    {
        return CGRectMake(self.bounds.origin.x    - leftEdge.floatValue,
                          self.bounds.origin.y    - topEdge.floatValue,
                          self.bounds.size.width  + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
        
    }
    return self.bounds;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect rect = [self enlargedRect];
    
    if (CGRectEqualToRect(rect, self.bounds))
    {
        return [super pointInside:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? YES : NO;
}

@end






