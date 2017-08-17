//
//  AnimalModel.h
//  SandBox
//
//  Created by 大島 曜 on 2017/08/17.
//  Copyright © 2017年 大島 曜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnimalModel : NSObject

@property (nonatomic,retain) NSDictionary *infomation;
@property (nonatomic,retain) NSString *lifePoint;
@property (nonatomic,retain) NSString *birthday;

@property (nonatomic,retain) NSString *head;
@property (nonatomic,retain) NSString *body;
@property (nonatomic,retain) NSDictionary<NSString *,NSString *> *hands;
@property (nonatomic,retain) NSDictionary<NSString *,NSString *> *legs;

//MARK: conform
/**
 * 表示
 */
- (void)infoDisplay;

//MARK: input

/**
 * モデル化
 */
+ (AnimalModel *)setModelDictionary:(NSDictionary *)dic;

//MARK: startUp

/**
 * 初回会員情報情報
 */
+ (NSDictionary *)startUpAnimalInfo;

//MARK: action
/**
 * ライフチェック
 */
- (void)lifeCheck;

@end
