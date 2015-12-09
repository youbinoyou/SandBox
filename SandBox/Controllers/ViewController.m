//
//  ViewController.m
//  SandBox
//
//  Created by 大島 曜 on 2015/04/10.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "ViewController.h"
#import "CustomAlertController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setListButtons];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"Xcode 学習（c）You Ohshima";
    [titleLabel sizeToFit];
    
    if ([self.view isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scrollView = (UIScrollView *)(self.view);
        titleLabel.frame = CGRectMake(0,scrollView.contentSize.height - titleLabel.frame.size.height,[UIScreen mainScreen].applicationFrame.size.width , titleLabel.frame.size.height);
    } else {
        titleLabel.frame = CGRectMake(0,[UIScreen mainScreen].applicationFrame.size.height - titleLabel.frame.size.height,[UIScreen mainScreen].applicationFrame.size.width , titleLabel.frame.size.height);
    }
    
    [self.view addSubview:titleLabel];
}

- (void)setListButtons {
    self.buttons = @[
                     
                     @{@"title":@"Objective-Cについて",@"listViewController:":@"ListObjeciveCViewController"},
                     @{@"title":@"ビューコントローラーについて",@"listViewController:":@"ListUIViewControllerObjectViewController"},
                     @{@"title":@"ナビゲーションコントローラーについて",@"listViewController:":@"ListUINavigationControllerObjectViewController"},
                     @{@"title":@"アラートについて",@"listViewController:":@"ListAlertViewController"},
                     
                     @{@"title":@"ウィンドウについて",@"listViewController:":@"ListWindowViewController"},
                     @{@"title":@"ラベルについて",@"listViewController:":@"ListLabelViewController"},
                     @{@"title":@"テーブルビューコントローラについて",@"listViewController:":@"TableViewControllerListViewController"},
                     @{@"title":@"テーブルビューについて",@"listViewController:":@"TableViewListViewController"},
                     @{@"title":@"文字列装飾について",@"listViewController:":@"ListAttributedStringViewController"},
                     @{@"title":@"例外処理について",@"listViewController:":@"ListExceptionViewController"},
                     @{@"title":@"タブバーについて",@"listViewController:":@"ListTabBarViewController"},
                     @{@"title":@"イメージについて",@"listViewController:":@"ListImageViewController"},
                     @{@"title":@"ピッカービューについて",@"listViewController:":@"PickerViewListViewController"},
                     @{@"title":@"タッチイベントについて",@"listViewController:":@"ListUIResponderObjectViewController"},
                     @{@"title":@"アクティビティビューコントローラについて",@"listViewController:":@"ActivityViewControllerListViewController"},
                     @{@"title":@"スライダーについて",@"listViewController:":@"SliderListViewController"},
                     @{@"title":@"プログレスビューについて",@"listViewController:":@"ProgressViewListViewController"},
                     @{@"title":@"ページコントロールについて",@"listViewController:":@"PageControlListViewController"},
                     
                     @{@"title":@"ステッパーについて",@"listViewController:":@"StepperListViewController"},
                     @{@"title":@"ローカル通知について",@"listViewController:":@"ListUILocalNotificationObjectViewController"},
                     @{
                         @"title":@"オリジナルキーボード",
                         @"listViewController:":@"ListCustomKeyboardsViewController"
                         },
                     @{@"title":@"設定",@"listViewController:":@"SettingContentsViewController"},
                     /*
                      @{@"title":@"CustomAlert",@"action":@"newCustomAlert:"},
                      @{@"title":@"ActionSheet",@"action":@"newCustomActionSheet:"},
                      */
                     ];
    [self setButtons];
}

@end
