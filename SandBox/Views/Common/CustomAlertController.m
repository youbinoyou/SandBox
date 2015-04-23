//
//  CustomAlertController.m
//  SandBox
//
//  Created by 大島 曜 on 2015/04/22.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "CustomAlertController.h"

@interface CustomAlertController ()<UIActionSheetDelegate>

@property UIButton *actionButton;

@end

@implementation CustomAlertController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *showAlertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [showAlertButton setTitle:@"アラート" forState:UIControlStateNormal];
    [showAlertButton sizeToFit];
    showAlertButton.center = self.view.center;
    [showAlertButton addTarget:self action:@selector(showAlertButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    //[self.view addSubview:showAlertButton];

    UIButton *pressActionButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pressActionButton setTitle:@"ボタンを押す" forState:UIControlStateNormal];
    [pressActionButton sizeToFit];
    pressActionButton.center = self.view.center;
    [pressActionButton addTarget:self action:@selector(pressActionButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pressActionButton];
    
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

- (void)showAlert:(NSString*)text
{
    Class UIAlertControllerClass = NSClassFromString(@"UIAlertController");
    if(UIAlertControllerClass){
        // UIAlertControllerを使ってアラートを表示
        UIAlertController *alert = nil;
        alert = [UIAlertControllerClass alertControllerWithTitle:@"Title"
                                                    message:text
                                             preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK"
                                                  style:UIAlertActionStyleDefault
                                                handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        // UIAlertViewを使ってアラートを表示
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title"
                                                        message:text
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
        [alert show];
    }
}
// action1ボタンが押された時の処理
- (void)action1
{
    [self showAlert:@"action 1"];
}

// action2ボタンが押された時の処理
- (void)action2
{
    [self showAlert:@"action 2"];
}

// action3ボタンが押された時の処理
- (void)action3
{
    [self showAlert:@"action 3"];
}

- (IBAction)showAlertButtonAction:(id)sender{
    [self showAlert:@"ボタンが押された"];
}

- (IBAction)pressActionButton:(id)sender {
    Class class = NSClassFromString(@"UIAlertController");
    if(class){
        // UIAlertControllerを使ってアクションシートを表示
        UIAlertController *actionSheet = nil;
        actionSheet = [UIAlertController alertControllerWithTitle:@"Title"
                                                          message:@"Message"
                                                   preferredStyle:UIAlertControllerStyleActionSheet];
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Action 1"
                                                        style:UIAlertActionStyleDestructive
                                                      handler:^(UIAlertAction *action){
                                                          [self action1];
                                                      }]];
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Action 2"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action){
                                                          [self action2];
                                                      }]];
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Action 3"
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction *action){
                                                          [self action3];
                                                      }]];
        
        // ユニバーサルアプリかiPadアプリの場合は、
        // UIPopoverPresentationControllerを使った以下のコードが無いと落ちてしまうので注意
        // （このコードがあっても、iPhoneでの実行時には何も変化なし）
        actionSheet.modalPresentationStyle = UIModalPresentationPopover;
        UIPopoverPresentationController *pop = actionSheet.popoverPresentationController;
        pop.sourceView = self.actionButton;
        pop.sourceRect = self.actionButton.bounds;
        
        [self presentViewController:actionSheet
                           animated:YES
                         completion:nil];
    }else{
        // UIActionSheetを使ってアクションシートを表示
        UIActionSheet *as = [[UIActionSheet alloc] init];
        as.delegate = self;
        as.title = @"Title";
        [as addButtonWithTitle:@"Action 1"];
        [as addButtonWithTitle:@"Action 2"];
        [as addButtonWithTitle:@"Action 3"];
        as.destructiveButtonIndex = 0;
        as.cancelButtonIndex = 2;
        [as showInView:self.view];
    }
}

// iOS 7でアクションシートのボタンが押された時の処理
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self action1];
            break;
        case 1:
            [self action2];
            break;
        case 2:
            [self action3];
            break;
            default:
            break;
    }
}

@end
