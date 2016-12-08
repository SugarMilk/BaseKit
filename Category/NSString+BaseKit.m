//
//  NSString+BaseKit.m
//  HJCategory
//
//  Created by 黄健 on 2016/10/29.
//  Copyright © 2016年 黄健. All rights reserved.
//

#import "NSString+BaseKit.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (BaseKit_NSString_MD5)

- (NSString *)bk_md5 {
    
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    
    NSMutableString * result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    
    return result;
}

@end
