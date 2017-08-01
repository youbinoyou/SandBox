//
//  JapanCityNameModel.h
//  SandBox
//
//  Created by YouOhshima on 2017/08/02.
//  Copyright © 2017年 大島 曜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JapanCityNameModel : NSObject

@property (nonatomic,retain) NSNumber *number;
@property (nonatomic,retain) NSString *title;
@property (nonatomic,retain) NSString *prefecturalCapitalTitle;

+ (NSArray *)JapanCityModels;

@end
