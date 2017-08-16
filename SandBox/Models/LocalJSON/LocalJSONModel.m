//
//  LocalJSONModel.m
//  SandBox
//
//  Created by 大島 曜 on 2017/08/16.
//  Copyright © 2017年 大島 曜. All rights reserved.
//

#import "LocalJSONModel.h"

@implementation LocalJSONModel

+ (LocalJSONModel *)setModelDictionary:(NSDictionary *)dic {
    LocalJSONModel *jsonModel = [LocalJSONModel new];
    jsonModel.response = dic[@"response"];
    jsonModel.results = dic[@"results"];
    return jsonModel;
}

@end
