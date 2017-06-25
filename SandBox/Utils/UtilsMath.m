//
//  UtilsMath.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2016/01/04.
//  Copyright © 2016年 大島 曜. All rights reserved.
//

#import "UtilsMath.h"

@implementation UtilsMath

+ (CGFloat)randomColorFloat {
    return arc4random_uniform(255) / 255.0;
}

@end
