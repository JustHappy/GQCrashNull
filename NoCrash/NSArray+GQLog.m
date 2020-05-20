//
//  NSArray+GQLog.m
//  列表过渡动画
//
//  Created by zrar on 2019/7/9.
//  Copyright © 2019 GQ. All rights reserved.
//

#import "NSArray+GQLog.h"

@implementation NSArray (GQLog)
// 数组打印
-(NSString *)descriptionWithLocale:(id)locale{
    NSMutableString * string = [NSMutableString string];
    //开头有个[
    [string appendString:@"[\n"];
    //n遍历所有元素
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [string appendFormat:@"\t%@,\n",obj];
    }];
    //结尾有个]
    [string appendString:@"]"];
    //查找最后一个逗号
    NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
    if (range.location != NSNotFound) {
        [string deleteCharactersInRange:range];
    }
    return string;
}
@end
