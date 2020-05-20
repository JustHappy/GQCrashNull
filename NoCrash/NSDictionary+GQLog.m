//
//  NSDictionary+GQLog.m
//  列表过渡动画
//
//  Created by zrar on 2019/7/9.
//  Copyright © 2019 GQ. All rights reserved.
//

#import "NSDictionary+GQLog.h"

@implementation NSDictionary (GQLog)
//
-(NSString *)descriptionWithLocale:(id)locale{
    NSMutableString * string = [NSMutableString string];
    //开头一个[
    [string appendString:@"[\n"];
    //遍历所有的键值对
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [string appendFormat:@"\t%@,",key];
        [string appendString:@" : "];
        [string appendFormat:@"%@,\n",obj];
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
