//
//  CommonCell.h
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/12/25.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonCell : UITableViewCell

/**
 * 属性を設定
 *
 * @param attributeDictionary 属性ディクショナリ
 */
- (void)setAttribute:(NSDictionary *)attributeDictionary;

/**
 * モデルの設定
 *
 * @param modelDictionary モデルディクショナリ
 */
- (void)setModelDictionary:(NSDictionary *)modelDictionary;

/**
 * モデルの設定
 *
 * @param modelArray モデルリスト
 */
- (void)setModelList:(NSArray *)modelList;

@end
