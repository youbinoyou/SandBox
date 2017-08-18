//
//  JapanCityNameModel.m
//  SandBox
//
//  Created by YouOhshima on 2017/08/02.
//  Copyright © 2017年 大島 曜. All rights reserved.
//

#import "JapanCityNameModel.h"
#import "UtilsLocalJSON.h"
#import "LocalJSONModel.h"

@implementation JapanCityNameModel

+ (NSArray *)JapanCityModels {
    NSMutableArray *models = [NSMutableArray new];
    for (NSDictionary *item in [self JapanCityItems]) {
        [models addObject:[JapanCityNameModel setModelDictionary:item]];
    }
    return [models copy];
}

+ (JapanCityNameModel *)setModelDictionary:(NSDictionary *)dic {
    JapanCityNameModel *jcnModel = [JapanCityNameModel new];
    jcnModel.number = dic[@"number"];
    jcnModel.title = dic[@"title"];
    jcnModel.prefecturalCapitalTitle = dic[@"prefecturalCapitalTitle"];
    return jcnModel;
}

+ (NSArray *)JapanCityItems {
    UtilsLocalJSON *json = [UtilsLocalJSON new];
    NSDictionary *item = [json requestFileName:@"JapanCityName"];
    LocalJSONModel *jsonModel = [LocalJSONModel setModelDictionary:item];
    return [jsonModel.results copy];
}

@end
