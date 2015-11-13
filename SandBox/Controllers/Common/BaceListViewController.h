//
//  BaceListViewController.h
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/11/11.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaceListViewController : UIViewController

extern const NSString *keyTitle;
extern const NSString *keyLink;;
extern const NSString *keyAction;
extern const NSString *keyListViewController;

@property (nonatomic,copy) NSArray *buttons;

- (void)setListButtons;
- (void)setButtons;

@end
