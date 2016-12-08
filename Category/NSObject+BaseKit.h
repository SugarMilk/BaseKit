//
//  NSObject+BaseKit.h
//  BaseKit
//
//  Created by huangjian on 16/12/8.
//  Copyright © 2016年 huangjian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (BaseKit_NSObject_Invocation)

- (id)performSelector:(SEL)aSelector withObjects:(NSArray*)objects;

@end
