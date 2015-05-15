//
//  PickerViewController.h
//  SandBox
//
//  Created by 大島 曜 on 2015/05/15.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PickerViewControllerDelegate;

@interface PickerViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

/**
 * 空の領域にある透明なボタン
 */
@property (weak, nonatomic) UIButton *closeButton;

/**
 * 処理のデリゲート先の参照
 */
@property (weak, nonatomic) id<PickerViewControllerDelegate> delegate;

/**
 * PickerViewを閉じる処理を行うメソッド。closeButtonが押下されたときに呼び出される
 */
- (void)closePickerView:(UIButton *)sender;

@end

@protocol PickerViewControllerDelegate <NSObject>

/**
 * 選択された文字列を適用するためのデリゲートメソッド
 */
-(void)applySelectedString:(NSString *)str;

/**
 * 当該PickerViewを閉じるためのデリゲートメソッド
 */
-(void)closePickerView:(PickerViewController *)controller;

@end