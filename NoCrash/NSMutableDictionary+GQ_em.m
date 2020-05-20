//
//  NSMutableDictionary+GQ_em.m
//  列表过渡动画
//
//  Created by zrar on 2019/7/9.
//  Copyright © 2019 GQ. All rights reserved.
//

#import "NSMutableDictionary+GQ_em.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (GQ_em)
+ (void)load {
    
    Method fromMethod = class_getInstanceMethod(objc_getClass("__NSDictionaryM"), @selector(setObject:forKey:));
    Method toMethod = class_getInstanceMethod(objc_getClass("__NSDictionaryM"), @selector(em_setObject:forKey:));
    method_exchangeImplementations(fromMethod, toMethod);
}



- (void)em_setObject:(id)emObject forKey:(NSString *)key {
    if (emObject == nil) {
        NSLog(@"==========字-典-存-在-插-入-nil-值================");
        [self em_setObject:@"null" forKey:key];
//        [self em_setObject:@"字典插入了nil" forKey:key];
    }else {
        [self em_setObject:emObject forKey:key];
    }
}
@end
