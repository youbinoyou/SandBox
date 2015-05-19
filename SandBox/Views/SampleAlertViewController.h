//
//  SampleAlertViewController.h
//  SandBox
//
//  Created by YouOhshima on 2015/05/19.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SampleAlertViewControllerDelegate;

@interface SampleAlertViewController : UIViewController
/**
 * 処理のデリゲート先の参照
 */
@property (weak, nonatomic) id<SampleAlertViewControllerDelegate> delegate;

@end

@protocol SampleAlertViewControllerDelegate <NSObject>

/**
 * 当該PickerViewを閉じるためのデリゲートメソッド
 */
-(void)closeAlertView:(UIViewController *)controller;

@end