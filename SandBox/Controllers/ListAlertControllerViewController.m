//
//  ListAlertControllerViewController.m
//  SandBox
//
//  Created by YouOhshima on 2015/04/28.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "ListAlertControllerViewController.h"
#import "CustomAlertController.h"

@interface ListAlertControllerViewController ()

@property (nonatomic) NSArray *buttons;

@end

@implementation ListAlertControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.buttons = @[
                     @{@"title":@"アラートコントローラー",@"action":@"newUIAlertController:",
                       @"UIAlertController":@{
                               @"title":@"UIAlertController",
                               @"message":@"message",
                               @"cancelButtonIndex":@1,
                               @"alertViewStyle":[NSNumber numberWithInteger:UIAlertViewStyleDefault],
                               @"buttonTitles":@[
                                       @"ボタンタイトル１",
                                       @"ボタンタイトル２（キャンセル）",
                                       @"ボタンタイトル３",
                                       ]
                               }
                       },
                     /*
                     @{@"title":@"アラートビュー（操作）Title",@"action":@"setCustomAlertTitle:"},
                     @{@"title":@"アラートビュー（操作）Message",@"action":@"setCustomAlertMessage:"},
                     @{@"title":@"アラートビュー（操作）Delegate",@"action":@"setCustomAlertDelegate:"},
                     @{@"title":@"アラートビュー（操作）CancelButtonIndex",@"action":@"selectCustomAlertCancelButtonIndex"},
                     @{@"title":@"アラートビュー（操作）ViewStyle",@"action":@"selectCustomAlertViewStyle"},
                     @{@"title":@"アラートビュー（操作）ButtonTitles",@"action":@"setCustomAlertButtonTitles:"},
                     @{@"title":@"アラートビュー（デフォルト）",@"action":@"defalutUIAlertButtonAction:"},
                      */
                     @{@"title":@"カスタムUIAlertController",@"action":@"newCustomAlertController:",},
                     @{@"title":@"オリジナルアラートコントローラー",@"action":@"newOriginalAlertController:",},
                     @{@"title":@"カスタムアラートコントローラー",@"action":@"newCustomAlertController:",},
                     @{@"title":@"アラートについて",@"action":@"dismissCloseButtonAction:"},
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)newUIAlertController:(id)sender{
    
    NSLog(@"%@ : 生成",sender);
    
    UIAlertController *alertController =
    [UIAlertController alertControllerWithTitle:@"UIAlertViewController"
                                        message:@"message"
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addChildViewController:[[UIViewController alloc] init]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"actionTitle"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action){
                                                          NSLog(@"%@",action);
                                                          UIView *view = [[UIView alloc] init];
                                                          view.frame = self.view.frame;
                                                          [alertController.view addSubview:view];
                                                      }]];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.text = @"OK";
        textField.textAlignment = NSTextAlignmentCenter;
        textField.backgroundColor = [UIColor colorWithRed:1 green:0.8 blue:0.8 alpha:0.5];
    }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = @"Sample Text";
        textField.backgroundColor = [UIColor colorWithRed:1 green:0.8 blue:0.8 alpha:0.5];
    }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.text = @"UITextBorderStyleBezel";
        textField.borderStyle = UITextBorderStyleBezel;
        textField.backgroundColor = [UIColor colorWithRed:1 green:0.8 blue:0.8 alpha:0.5];
    }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.text = @"UITextBorderStyleLine";
        textField.borderStyle = UITextBorderStyleLine;
        textField.backgroundColor = [UIColor colorWithRed:1 green:0.8 blue:0.8 alpha:0.5];
    }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.text = @"UITextBorderStyleRoundedRect";
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.backgroundColor = [UIColor colorWithRed:1 green:0.8 blue:0.8 alpha:0.5];
    }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.text = @"UITextBorderStyleNone";
        textField.borderStyle = UITextBorderStyleNone;
        textField.backgroundColor = [UIColor colorWithRed:1 green:0.8 blue:0.8 alpha:0.5];
    }];
    
    [self presentViewController:alertController animated:YES
                     completion:^(void){
                         NSLog(@"作成");
                     }];
//    //    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"UIAlertView"
//    //                                                        message:@"message"
//    //                                                       delegate:self
//    //                                              cancelButtonTitle:@"キャンセル"
//    //                                              otherButtonTitles:nil];
//    
//    UIAlertView *alertView = [UIAlertView new];
//    NSDictionary *item = self.buttons[0][@"UIAlertView"];
//    if (item[@"title"]) {
//        alertView.title = item[@"title"];
//    }
//    if (item[@"message"]) {
//        alertView.message = item[@"message"];
//    }
//    if (item[@"delegate"]) {
//        alertView.delegate = item[@"delegate"];
//    }
//    for(int b = 0; b < alertView.numberOfButtons;b++) {
//        NSLog(@"button[%d] : %@",b,[alertView buttonTitleAtIndex:b]);
//    }
//    if (item[@"buttonTitles"]) {
//        if ([alertView respondsToSelector:@selector(addButtonWithTitle:)]){
//            /* - (NSInteger)addButtonWithTitle:(NSString *)title; */
//            NSArray *buttonTitles = item[@"buttonTitles"];
//            if ([buttonTitles isKindOfClass:[NSArray class]]) {
//                for(NSString *buttonTitle in buttonTitles){
//                    [alertView addButtonWithTitle:buttonTitle];
//                }
//            }
//        }
//    }
//    if (item[@"cancelButtonIndex"]) {
//        alertView.cancelButtonIndex = [item[@"cancelButtonIndex"] integerValue];
//    }
//    if (item[@"alertViewStyle"]) {
//        alertView.alertViewStyle = [item[@"alertViewStyle"] integerValue];
//    }
//    
//    //
//    [self cheackUIAlertView:alertView];
//    
//    if ([alertView respondsToSelector:@selector(show)]){
//        /*  - (void)show; */
//        [alertView show];
//    }
}

- (void)newCustomAlertController:(id)sender {
    CustomAlertController *customAlertController = [[CustomAlertController alloc] init];
    customAlertController.view.backgroundColor = self.view.backgroundColor;
    [self presentViewController:customAlertController animated:YES completion:^(void){
        NSLog(@"Custom");
        customAlertController.navigationItem.leftBarButtonItem =
        // TOPページに戻る処理
        [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(dismissCloseButtonAction:)];

    }];
}

- (void)newOriginalAlertController:(id)sender {
    CustomAlertController *customAlertController = [[CustomAlertController alloc] init];
    customAlertController.view.backgroundColor = self.view.backgroundColor;
    [self presentViewController:customAlertController animated:YES completion:^(void){
        NSLog(@"Custom");
        customAlertController.navigationItem.leftBarButtonItem =
        // TOPページに戻る処理
        [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(dismissCloseButtonAction:)];
        
    }];
    
}

- (void)newCustomUIAlertController:(id)sender {
    CustomAlertController *customAlertController = [[CustomAlertController alloc] init];
    customAlertController.view.backgroundColor = self.view.backgroundColor;
    [self presentViewController:customAlertController animated:YES completion:^(void){
        NSLog(@"Custom");
        customAlertController.navigationItem.leftBarButtonItem =
        // TOPページに戻る処理
        [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(dismissCloseButtonAction:)];
        
    }];
    
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

@end
