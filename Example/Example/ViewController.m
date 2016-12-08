//
//  ViewController.m
//  Example
//
//  Created by huangjian on 16/12/8.
//  Copyright © 2016年 huangjian. All rights reserved.
//

#import "ViewController.h"
#import <BaseKit/BaseKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString * string = @"123456";
    
    NSString * md5_string = [string bk_md5];
    
    NSLog(@"md5_string:  %@", md5_string);
}


@end
