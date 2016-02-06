//
//  CustomButtonCell.h
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/12/25.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonCell.h"

@protocol CustomButtonCellDelegate <NSObject>

@optional

- (void)customButtonAction:(id)sender action:(SEL)action;

@end

@interface CustomButtonCell : CommonCell

@property (weak, nonatomic) IBOutlet UIButton *button;

@property (nonatomic,assign) id<CustomButtonCellDelegate>delegate;

@end
