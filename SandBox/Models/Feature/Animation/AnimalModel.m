//
//  AnimalModel.m
//  SandBox
//
//  Created by 大島 曜 on 2017/08/17.
//  Copyright © 2017年 大島 曜. All rights reserved.
//

#import "AnimalModel.h"

@implementation AnimalModel
//MARK: conform
/**
 * 表示
 */
- (void)infoDisplay {
    NSLog(@"%@\n*******\n"
          @"infomaction.name = %@\n"
          @"lifePoint : %@",
          self.class,
          self.infomation[@"name"],
          self.lifePoint
          );
}

/**
 * モデル化
 */
+ (AnimalModel *)setModelDictionary:(NSDictionary *)dic {
    AnimalModel *animalModel = [AnimalModel new];
    animalModel.infomation = dic[@"infomation"];
    animalModel.lifePoint = dic[@"lifePoint"];
    animalModel.head = dic[@"head"];
    animalModel.body = dic[@"body"];
    animalModel.hands = dic[@"hands"];
    animalModel.legs = dic[@"legs"];
    [animalModel checkModel];
    return animalModel;
}

//MARK: startUp

/**
 * 初回会員情報情報
 */
+ (NSDictionary *)startUpAnimalInfo {
    return @{
             @"infomation":@{
                     @"name":@"名無しのごんべい"
                     },
             @"lifePoint":@"100",
             @"head":@"head",
             @"body":@"body",
             @"hands":@{
                     @"left":@"hand_left",
                     @"right":@"hand_right",
                     },
             @"legs":@{
                     @"left":@"leg_left",
                     @"right":@"leg_right",
                     },
             };
}

/**
 * 内容確認
 */
- (void)checkModel {
    if (!self.head) {
        NSLog(@"顔が無くなり、、、");
        [self death];
    }
    if (!self.body) {
        NSLog(@"体が無くなり、、、");
        [self death];
    }
    if (!self.hands) {
        NSLog(@"腕が無くなり、、、");
        [self death];
    }
    if (!self.legs) {
        NSLog(@"足が無くなり、、、");
        [self death];
    }
    
    
    if (!self.birthday) {
        [self birth];
    } else {
        [self infoDisplay];
    }
}

//MARK: action
/**
 * ライフチェック
 */
- (void)lifeCheck {
    [self checkModel];
}

/**
 * 誕生
 */
- (void)birth {
    [self infoDisplay];
    self.birthday = [self stringDate:[NSDate new]];
    NSLog(@"は、%@に誕生しました",self.birthday);
}

/**
 * 死亡
 */
- (void)death {
    [self infoDisplay];
    NSLog(@"は、%@に死亡しました",[NSDate new]);
    abort();
}


//MARK: private
// TODO: 共通化
- (NSString *)stringDate:(NSDate *)inputDate {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formatter stringFromDate:inputDate];
}

@end
