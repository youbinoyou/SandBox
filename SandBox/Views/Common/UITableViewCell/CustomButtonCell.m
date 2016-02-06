//
//  CustomButtonCell.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/12/25.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import "CustomButtonCell.h"

@interface CustomButtonCell ()

@property (nonatomic, assign) SEL action;

@end

@implementation CustomButtonCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        if (self.action) {
            [self.delegate customButtonAction:self action:self.action];
        }
    }
    // Configure the view for the selected state
}

- (void)setAttribute:(NSDictionary *)attributeDictionary {
    
}

/**
 * モデルの設定
 *
 * @param modelDictionary モデルディクショナリ
 */
- (void)setModelDictionary:(NSDictionary *)modelDictionary
{
    [self setAttribute:modelDictionary[@"attribute"]];
    [self.button setTitle:modelDictionary[@"text"] forState:UIControlStateNormal];
    self.action = NSSelectorFromString(modelDictionary[@"action"]);
    SEL action = NSSelectorFromString (@"buttonAction:");
    [self.button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonAction:(id)sender {
    if (self.action) {
        [self.delegate customButtonAction:self action:self.action];
    }
}

@end
