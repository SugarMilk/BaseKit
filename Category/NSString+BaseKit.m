//
//  NSString+BaseKit.m
//  BaseKit
//
//  Created by huangjian on 16/12/8.
//  Copyright © 2016年 huangjian. All rights reserved.
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


@implementation NSString (BaseKit_NSString_Judge)

- (BOOL)bk_isPureInt {
    NSScanner * scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

- (BOOL)bk_isContainerString:(NSString *)subString {
    if([self rangeOfString:subString].location != NSNotFound) {
        return YES;
    }
    return NO;
}

@end


