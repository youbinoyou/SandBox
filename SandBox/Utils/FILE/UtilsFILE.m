//
//  UtilsFILE.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/11/11.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import "UtilsFILE.h"

@implementation UtilsFILE

+ (NSURL *)getURLOriginalData:(NSData *)urlData {
    NSData * originalData = urlData;
    NSString * dataFormatString = @"data:application/octet-stream;base64,%@";
    NSString * base64Data = [originalData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    NSString * dataString = [NSString stringWithFormat:dataFormatString, base64Data];
    return [NSURL URLWithString:dataString];
}

+ (NSString *)fileStringWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) {
    va_list ap;
    va_start(ap,format);
    NSString *string = [[NSString alloc] initWithFormat:format arguments:ap];
    va_end(ap);
    return string;
}

@end
