//
//  NSMutableArray+GQ_em.m
//  列表过渡动画
//
//  Created by zrar on 2019/7/9.
//  Copyright © 2019 GQ. All rights reserved.
//

#import "NSMutableArray+GQ_em.h"
#import <objc/runtime.h>

@implementation NSMutableArray (GQ_em)
+ (void)load{
    Method fromMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(objectAtIndex:));
    Method toMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(em_objectAtIndex:));
    method_exchangeImplementations(fromMethod, toMethod);
    
    // arr[4]
    Method oldObjectAtIndex = class_getInstanceMethod(objc_getClass("__NSArrayM"),@selector(objectAtIndexedSubscript:));
    Method newObjectAtIndex = class_getInstanceMethod(objc_getClass("__NSArrayM"),@selector(safeobjectAtIndexedSubscript:));
    method_exchangeImplementations(oldObjectAtIndex, newObjectAtIndex);
}
- (id)em_objectAtIndex:(NSUInteger)index {
    if (self.count - 1 < index) {
//        return @"越界";
        NSLog(@"=============数-组-存-在-越-界==============");
        return @"null";
    }else {
        return [self em_objectAtIndex:index];
    }
}

- (id)safeobjectAtIndexedSubscript:(NSUInteger)index{
    if (self.count - 1 < index) {
//        return @"越界";
        NSLog(@"===============数-组-存-在-越-界===============");
        return @"null";
    }else {
        return [self safeobjectAtIndexedSubscript:index];
    }
}
@end
