//
//  UIColor+SandBox.m
//  SandBox
//
//  Created by 大島 曜 on 2017/07/26.
//  Copyright © 2017年 大島 曜. All rights reserved.
//

#import "UIColor+SandBox.h"

@implementation UIColor(SandBox)

/// UIColor Util
+ (UIColor *)colorWithHex:(NSString *)hexString alpha:(CGFloat)alpha
{
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    UInt32 color = 0;
    if ([scanner scanHexInt:&color]) {
        CGFloat red = (CGFloat)((color & 0xFF0000) >> 16) / 255.0;
        CGFloat green = (CGFloat)((color & 0x00FF00) >> 8) / 255.0;
        CGFloat blue = (CGFloat)(color & 0x0000FF) / 255.0;
        return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    } else {
        printf("invalid hex string");
        return [UIColor whiteColor];
    }
}

@end
