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
@property (nonatomic) NSArray *buttons;

@end

@implementation CustomAlertController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.modalPresentationStyle = 4;
    self.modalTransitionStyle = 0;
    self.view.backgroundColor = [UIColor clearColor];
    self.title = NSStringFromClass(self.class);
    
    self.buttons = @[
                     @{@"title":@"押しボタン（アクション）",@"action":@"pressActionButton:"},
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



/*
 UIAlertController と Alertの設定
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
        pop.sourceView.backgroundColor = [UIColor redColor];
        
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
