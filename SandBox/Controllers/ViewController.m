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

@property (nonatomic,retain) NSArray *buttons;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"Xcode 学習（c）You Ohshima";
    [titleLabel sizeToFit];
    titleLabel.frame = CGRectMake(0,[UIScreen mainScreen].applicationFrame.size.height - titleLabel.frame.size.height,[UIScreen mainScreen].applicationFrame.size.width , titleLabel.frame.size.height);
    [self.view addSubview:titleLabel];
    self.buttons = @[
                     @{@"title":@"ビューコントローラーについて",@"listViewController:":@"ListViewController"},
                     @{@"title":@"アラートについて",@"listViewController:":@"ListAlertViewController"},
                     
                     @{@"title":@"ウィンドウについて",@"listViewController:":@"ListWindowViewController"},
                     @{@"title":@"ラベルについて",@"listViewController:":@"ListLabelViewController"},
                     @{@"title":@"文字列装飾について",@"listViewController:":@"ListAttributedStringViewController"},
                     @{@"title":@"例外処理について",@"listViewController:":@"ListExceptionViewController"},
                     @{@"title":@"アクション",@"action":@"newsAlert:"},
                     
                     
                     @{@"title":@"CustomAlert",@"action":@"newCustomAlert:"},
                     @{@"title":@"ActionSheet",@"action":@"newCustomActionSheet:"},
                     ];
    
    CGRect rectButton = CGRectZero;
    for (NSDictionary *item in self.buttons) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        const CGFloat r = arc4random_uniform(255) / 255.0;
        const CGFloat g = arc4random_uniform(255) / 255.0;
        const CGFloat b = arc4random_uniform(255) / 255.0;
        
        button.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:0.5];
        [button setTitle:item[@"title"] forState:UIControlStateNormal];
        [button sizeToFit];
        button.tag = [self.buttons indexOfObject:item];
        rectButton.origin.x = 20;
        rectButton.size.width  = [UIScreen mainScreen].applicationFrame.size.width - 40;
        rectButton.size.height = [UIScreen mainScreen].applicationFrame.size.height / (self.buttons.count + 2);
        rectButton.origin.y += rectButton.size.height + 1;
        button.frame = rectButton;
        if (item[@"action"]) {
            SEL action = NSSelectorFromString(item[@"action"]);
            if ([self respondsToSelector:action]) {
                [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
            }
        }
        if (item[@"listViewController:"]) {
            SEL action = NSSelectorFromString(@"listViewController:event:");
            if ([self respondsToSelector:action]) {
                [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
            }
        }
        [self.view addSubview:button];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)listViewController:(id)sender event:(id)event{
    
    NSLog(@"%s",__PRETTY_FUNCTION__);
    NSLog(@"@param\n\nsender:\n%@\nevent:\n%@",sender,event);
    
    UIButton *sendButton = sender;
    Class listViewControllerClass = NSClassFromString(self.buttons[sendButton.tag][@"listViewController:"]);
    if (listViewControllerClass) {
        
        /**
         * 遷移するViewControllerの生成
         */
        UIViewController *listViewController = [[listViewControllerClass alloc] init];
        listViewController.view.backgroundColor = self.view.backgroundColor;
        listViewController.title = self.buttons[sendButton.tag][@"title"];
        listViewController.navigationItem.leftBarButtonItem =
        // TOPページに戻る処理
        [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(dismissCloseButtonAction:)];
    
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:listViewController];
        navigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:navigationController animated:YES completion:^(){
            NSLog(@"%@",self.buttons[sendButton.tag][@"title"]);
        }];
    } else {
        NSLog(@"No Class : %@",self.buttons[sendButton.tag][@"listViewController:"]);
    }
}

/**
 * TOPページに戻る処理
 */
- (void)dismissCloseButtonAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^(){
        NSLog(@"%@",sender);
    }];
}

- (void)newsAlert:(id)sender {
    
    CustomAlertController *customAlertController = [CustomAlertController customAlertControllerWithTitle:@"お知らせ" message:@"ログインボーナスを取得しました。" preferredStyle:CustomAlertControllerStyleAlert];
    CustomAlertAction *okAction = [CustomAlertAction actionWithTitle:@"OK" style:CustomAlertActionStyleDefault handler:^(CustomAlertAction *action){
        NSLog(@"OK");
        
    }];
    [customAlertController addAction:okAction];
    
    [self presentViewController:customAlertController animated:YES completion:^(void){
        NSLog(@"お知らせ");
    }];

}

- (void)newCustomAlert:(id)sender{
    CustomAlertController *customAlertController = [CustomAlertController customAlertControllerWithTitle:@"タイトル" message:@"message" preferredStyle:CustomAlertControllerStyleAlert];
    CustomAlertAction *okAction = [CustomAlertAction actionWithTitle:@"OK" style:CustomAlertActionStyleDefault handler:^(CustomAlertAction *action){
        NSLog(@"OK");

    }];
    [customAlertController addAction:okAction];
    CustomAlertAction *cancelAction = [CustomAlertAction actionWithTitle:@"NG" style:CustomAlertActionStyleCancel handler:^(CustomAlertAction *action){
        NSLog(@"NG");
    }];
    [customAlertController addAction:cancelAction];
    
//    CustomAlertAction *cancel2Action = [CustomAlertAction actionWithTitle:@"NG" style:CustomAlertActionStyleCancel handler:^(CustomAlertAction *action){
//        NSLog(@"NG");
//    }];
//    [customAlertController addAction:cancel2Action];
    
    CustomAlertAction *openAction = [CustomAlertAction actionWithTitle:@"開く" style:CustomAlertActionStyleDestructive handler:^(CustomAlertAction *action){
        NSLog(@"MENU");
    }];
    [customAlertController addAction:openAction];
    
    [self presentViewController:customAlertController animated:YES completion:^(void){
        NSLog(@"Custom");
    }];
}

- (void)newCustomActionSheet:(id)sender{
    CustomAlertController *customAlertController = [CustomAlertController customAlertControllerWithTitle:@"タイトル" message:@"message" preferredStyle:CustomAlertControllerStyleActionSheet];
    CustomAlertAction *okAction = [CustomAlertAction actionWithTitle:@"OK" style:CustomAlertActionStyleDefault handler:^(CustomAlertAction *action){
        NSLog(@"OK");
        
    }];
    [customAlertController addAction:okAction];
    CustomAlertAction *cancelAction = [CustomAlertAction actionWithTitle:@"NG" style:CustomAlertActionStyleCancel handler:^(CustomAlertAction *action){
        NSLog(@"NG");
    }];
    [customAlertController addAction:cancelAction];
    
    [self presentViewController:customAlertController animated:YES completion:^(void){
        NSLog(@"Custom");
    }];
}


@end
