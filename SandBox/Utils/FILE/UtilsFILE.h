//
//  UtilsFILE.h
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/11/11.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UtilsFILE : NSObject

+ (NSURL *)getURLOriginalData:(NSData *)urlData;

+ (NSString *)fileStringWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);
    

@end
