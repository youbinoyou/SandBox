//
//  AnimalViewModel.m
//  SandBox
//
//  Created by 大島 曜 on 2017/08/17.
//  Copyright © 2017年 大島 曜. All rights reserved.
//

#import "AnimalViewModel.h"
#import "AnimalView.h"
#import "AnimalModel.h"

@implementation AnimalViewModel

- (instancetype)initWithViewId:(NSString *)viewId animalModel:(AnimalModel *)animalModel {
    self = [super init];
    if (self) {
        self.viewID = viewId;
        self.animalModel = animalModel;
    }
    return self;
}

- (void)updateAnimalView:(AnimalView *)animalView {
    if (self.animalModel) {
        if (!self.animalModel.lifePoint) {
            [animalView updateViews];
            
            animalView.headImageView.image = [UIImage imageNamed:self.animalModel.head];
            
            animalView.bodyImageView.image = [UIImage imageNamed:self.animalModel.body];
            
            animalView.legLeftImageView.image = [UIImage imageNamed:self.animalModel.legs[@"leg_left"]];
            
            animalView.legRightImageView.image = [UIImage imageNamed:self.animalModel.legs[@"leg_right"]];
            
            animalView.handLeftImageView.image = [UIImage imageNamed:self.animalModel.hands[@"hand_left"]];
            
            animalView.handRightImageView.image = [UIImage imageNamed:self.animalModel.hands[@"hand_right"]];
            
        } else {
            // 頭
            animalView.headImageView.animationImages = @[ [UIImage imageNamed:self.animalModel.head]];
            animalView.headImageView.animationDuration = 0.5;// アニメーションの間隔
            animalView.headImageView.animationRepeatCount = -1;// -1は無限ループ
            [animalView.headImageView startAnimating];// アニメーションスタート
            /*
            // 胴体
            animalView.bodyImageView.animationImages = @[ [UIImage imageNamed:self.animalModel.body]];
            animalView.bodyImageView.animationDuration = 0.5;// アニメーションの間隔
            animalView.bodyImageView.animationRepeatCount = -1;// -1は無限ループ
            [animalView.bodyImageView startAnimating];// アニメーションスタート
            
            // 右腕
            animalView.handRightImageView.animationImages = @[ [UIImage imageNamed:self.animalModel.hands[@"hand_right"]]];
            animalView.handRightImageView.animationDuration = 0.5;// アニメーションの間隔
            animalView.handRightImageView.animationRepeatCount = -1;// -1は無限ループ
            [animalView.handRightImageView startAnimating];// アニメーションスタート
            
            
            // 左腕
            animalView.handLeftImageView.animationImages = @[ [UIImage imageNamed:self.animalModel.hands[@"hand_left"]]];
            animalView.handLeftImageView.animationDuration = 0.5;// アニメーションの間隔
            animalView.handLeftImageView.animationRepeatCount = -1;// -1は無限ループ
            [animalView.handLeftImageView startAnimating];// アニメーションスタート
            
            // 右足
            animalView.legRightImageView.animationImages = @[ [UIImage imageNamed:self.animalModel.legs[@"leg_right"]]];
            animalView.legRightImageView.animationDuration = 0.5;// アニメーションの間隔
            animalView.legRightImageView.animationRepeatCount = -1;// -1は無限ループ
            [animalView.legRightImageView startAnimating];// アニメーションスタート
            
            // 左足
            animalView.legLeftImageView.animationImages = @[ [UIImage imageNamed:self.animalModel.legs[@"leg_left"]]];
            animalView.legLeftImageView.animationDuration = 0.5;// アニメーションの間隔
            animalView.legLeftImageView.animationRepeatCount = -1;// -1は無限ループ
            [animalView.legLeftImageView startAnimating];// アニメーションスタート
             */
        }
    }
}

- (void)selected {
    if (self.animalModel) {
        [self.animalModel infoDisplay];
        [self.animalModel lifeCheck];
    }
}

@end
