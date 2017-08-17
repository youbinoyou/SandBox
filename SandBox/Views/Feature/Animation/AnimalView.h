//
//  AnimalView.h
//  SandBox
//
//  Created by 大島 曜 on 2017/08/17.
//  Copyright © 2017年 大島 曜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimalView : UIView

@property (nonatomic,retain) UIImageView *headImageView;
@property (nonatomic,retain) UIImageView *bodyImageView;
@property (nonatomic,retain) UIImageView *legLeftImageView;
@property (nonatomic,retain) UIImageView *legRightImageView;
@property (nonatomic,retain) UIImageView *handLeftImageView;
@property (nonatomic,retain) UIImageView *handRightImageView;

- (void)updateViews;

@end
