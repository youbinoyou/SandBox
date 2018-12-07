//
//  UtilsLocalJSON.m
//  SandBox
//
//  Created by 大島 曜 on 2017/08/16.
//  Copyright © 2017年 大島 曜. All rights reserved.
//

#import "UtilsLocalJSON.h"

@implementation UtilsLocalJSON

- (id)requestFileName:(NSString *)fileName {
    
    //------------------------------
    // JSONを読み込む
    //------------------------------
    NSError *jsonReadError = nil;
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:fileName ofType:@"json"];
    if(path){
        NSError *nofileError = [NSError errorWithDomain:@"nofileError" code:200 userInfo:@{@"path":path}];
        NSLog(@"nofileError : %@",nofileError);
        return nil;
    }
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error: &jsonReadError];
    NSData *jsonData = [jsonString dataUsingEncoding:NSUnicodeStringEncoding];
    if (jsonReadError) {
        NSLog(@"jsonReadError : %@",jsonReadError);
        return nil;
    }
    //------------------------------
    // NSArray に変換
    //------------------------------
    NSError *parseFormatError = nil;
    NSArray *array = [NSJSONSerialization JSONObjectWithData:jsonData
                                                     options:NSJSONReadingAllowFragments
                                                       error:&parseFormatError];
    if (parseFormatError) {
        NSLog(@"parseFormatError : %@",parseFormatError);
        return nil;
    }
    if ([array isKindOfClass:[NSDictionary class]]) {
        NSDictionary *response = (NSDictionary *)[array copy];
        if (response[@"response"]) {
            if ([response[@"response"][@"code"] integerValue] == 200) {
                NSLog(@"**success**\n\nFileName : %@",fileName);
            }
        } else {
            NSError *otherFormatError = [NSError errorWithDomain:@"OtherFormatError" code:200 userInfo:response];
            NSLog(@"otherFormatError : %@",otherFormatError);
            return array;
        }
    } else {
        NSError *otherFormatError = [NSError errorWithDomain:@"OtherFormatError" code:200 userInfo:@{@"result":array}];
        NSLog(@"otherFormatError : %@",otherFormatError);
        return array;
    }
    NSLog(@"%@",array);
    return array;
}

@end
