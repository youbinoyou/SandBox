//
//  NSDate+SandBox.m
//  SandBox
//
//  Created by 大島 曜 on 2017/07/26.
//  Copyright © 2017年 大島 曜. All rights reserved.
//

#import "NSDate+SandBox.h"

@implementation NSDate(SandBox)

/// NSDate Util
- (NSString *)convertToString:(NSDate *)date
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy.MM.dd";
    return [formatter stringFromDate:date];
}

- (NSString *)convertToString:(NSDate *)date dateFormat:(NSString *)dateFormat
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = dateFormat;
    return [formatter stringFromDate:date];
}


@end
