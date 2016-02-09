//
//  ListUILocalNotificationObjectViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/11/11.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "ListUILocalNotificationObjectViewController.h"

@interface ListUILocalNotificationObjectViewController ()

@end

@implementation ListUILocalNotificationObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setListButtons];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)setListButtons {
    self.buttons = @[
                     @{
                         keyTitle : @"iPhoneローカル通知を設定"
                         },
                     @{
                         keyTitle : @"ローカル通知を作成",
                         keyAction : @"setUILocalNotification",
                         },
                     @{
                         keyTitle : @"情報提供元",
                         keyLink : @"http://www.yoheim.net/blog.php?q=20111120",
                         }
                     
                     ];
    [self setButtons];
}

- (void)setUILocalNotification {
    // TODO: ローカル通知を作成 [Isusues:#12] 設定しているのですがうまくシュミレーター上では確認ができず
    UIAlertView *alertView = [UIAlertView new];
    alertView.title = @"ローカル通知を作成";
    alertView.message = @"[Isusues:#12]\n設定しているのですがうまくシュミレーター上では確認ができず";
    [alertView addButtonWithTitle:@"OK"];
    [alertView show];
    //本アプリに対して登録されているすべての通知を取得する。
    //NSArray *notificationArray = [[UIApplication sharedApplication] scheduledLocalNotifications];
    
    //それぞれの通知に登録されている文字列を比較して、キャンセルしたい通知を特定しキャンセルする。
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    // ローカル通知を作成する
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    // 通知日時を設定する。今から10秒後
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:10];
    [notification setFireDate:date];
    
    // タイムゾーンを指定する
    [notification setTimeZone:[NSTimeZone localTimeZone]];
    
    // メッセージを設定する
    [notification setAlertBody:@"でたー！！"];
    // アイコンの数値を設定する
    [notification setApplicationIconBadgeNumber:0];
    // 効果音は標準の効果音を利用する
    [notification setSoundName:UILocalNotificationDefaultSoundName];
    // ボタンの設定
    [notification setAlertAction:@"Open"];
    // [notification setAlertTitle:@"AlertTitle"];
    
    // ローカル通知を登録する
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
    // 解放
    //[notification release];
}

@end
