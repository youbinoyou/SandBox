//
//  AlertViewController.h
//  SandBox
//
//  Created by YouOhshima on 2015/05/18.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AlertViewControllerDelegate;

@interface AlertViewController : UIViewController
@property (weak, nonatomic) IBOutlet UINavigationBar *alertNavigationBar;
@property (weak, nonatomic) IBOutlet UINavigationItem *alertNavigationItem;
@property (weak, nonatomic) IBOutlet UIView *alertView;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

/**
 * 処理のデリゲート先の参照
 */
@property (weak, nonatomic) id<AlertViewControllerDelegate> delegate;


@end

@protocol AlertViewControllerDelegate <NSObject>

/**
 * 当該PickerViewを閉じるためのデリゲートメソッド
 */
-(void)closeAlertView:(UIViewController *)controller;

@end