//
//  UtilsFILE.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/11/11.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import "UtilsFILE.h"

@implementation UtilsFILE

const NSString *dataApplicationOctetstreamBase64 = @"data:application/octet-stream;base64,%@";

+ (NSURL *)getURLOriginalData:(NSData *)urlData {
    NSData * originalData = urlData;
    NSString * dataFormatString = [NSString stringWithFormat:@"%@",dataApplicationOctetstreamBase64];
    NSString * base64Data = [originalData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    NSString * dataString = [NSString stringWithFormat:dataFormatString, base64Data];
    return [NSURL URLWithString:dataString];
}

+ (NSString *)fileStringWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) {
    va_list argList;
    va_start(argList,format);
    NSString *string = [[NSString alloc] initWithFormat:format arguments:argList];
    va_end(argList);
    return string;
}

@end
