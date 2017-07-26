//
//  NSDate+SandBox.h
//  SandBox
//
//  Created by 大島 曜 on 2017/07/26.
//  Copyright © 2017年 大島 曜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate(SandBox)

/// NSDate Util
- (NSString *)convertToString:(NSDate *)date;
- (NSString *)convertToString:(NSDate *)date dateFormat:(NSString *)dateFormat;

@end
