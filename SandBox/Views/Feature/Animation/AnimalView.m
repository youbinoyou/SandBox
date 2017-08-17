//
//  AnimalView.m
//  SandBox
//
//  Created by 大島 曜 on 2017/08/17.
//  Copyright © 2017年 大島 曜. All rights reserved.
//

#import "AnimalView.h"

@implementation AnimalView

- (void)updateViews {
    if (!self.headImageView) {
        self.headImageView = [[UIImageView alloc] init];
    }
    [self addSubview:self.headImageView];
    //        if (!self.bodyImageView) {
    //            self.bodyImageView = [[UIImageView alloc] init];
    //            [self addSubview:self.bodyImageView];
    //        }
    //        // hand
    //        if (!self.handRightImageView) {
    //            self.handRightImageView = [[UIImageView alloc] init];
    //            [self addSubview:self.handRightImageView];
    //        }
    //        if (!self.handLeftImageView) {
    //            self.handLeftImageView = [[UIImageView alloc] init];
    //            [self addSubview:self.handLeftImageView];
    //        }
    //        // leg
    //        if (!self.legRightImageView) {
    //            self.legRightImageView = [[UIImageView alloc] init];
    //            [self addSubview:self.legRightImageView];
    //        }
    //        if (!self.legLeftImageView) {
    //            self.legLeftImageView = [[UIImageView alloc] init];
    //            [self addSubview:self.legLeftImageView];
    //        }
    self.headImageView.frame = self.bounds;
    //    self.bodyImageView.frame = self.bounds;
    //    self.legRightImageView.frame = self.bounds;
    //    self.legLeftImageView.frame = self.bounds;
    //    self.handRightImageView.frame = self.bounds;
    //    self.handLeftImageView.frame = self.bounds;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
