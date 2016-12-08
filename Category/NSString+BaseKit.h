//
//  NSString+BaseKit.h
//  BaseKit
//
//  Created by huangjian on 16/12/8.
//  Copyright © 2016年 huangjian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BaseKit_NSString_MD5)

/**
 * MD5加密(32位小写)
 *
 * @return 返回经过MD5加密算法(32位小写)之后的加密字符串
 */
- (NSString *)bk_md5;

@end

@interface NSString (BaseKit_NSString_Judge)

/**
 * 判断字符串为纯数字
 */
- (BOOL)bk_isPureInt;

/**
 * 判断字符串对象是否包含subString字符串
 * iOS 8以上系统也可使用[self containsString: subString]
 *
 *  @param subString 子字符串
 *  @return 包含返回YES,不包含返回NO
 */
- (BOOL)bk_isContainerString:(NSString *)subString;

@end
