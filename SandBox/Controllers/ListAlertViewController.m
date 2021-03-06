//
//  ListAlertViewController.m
//  SandBox
//
//  Created by 大島 曜 on 2015/04/23.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "ListAlertViewController.h"
#import "AlertViewController.h"
#import "SampleAlertViewController.h"

@interface ListAlertViewController ()<AlertViewControllerDelegate,SampleAlertViewControllerDelegate>

@property (nonatomic,retain) AlertViewController *alertViewController;
@property (nonatomic,retain) SampleAlertViewController *sampleAlertViewController;

@end

@implementation ListAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setListButtons];
}


- (void)setListButtons {
    
    self.buttons = @[
                     @{@"title":@"アラートビュー",@"action":@"newUIAlertView:",
                       @"UIAlertView":@{
                               @"title":@"UIAlertView",
                               @"message":@"message",
                               @"delegate":self,
                               @"cancelButtonIndex":@1,
                               @"alertViewStyle":[NSNumber numberWithInteger:UIAlertViewStyleDefault],
                               @"buttonTitles":@[
                                       @"ボタンタイトル１",
                                       @"ボタンタイトル２（キャンセル）",
                                       @"ボタンタイトル３",
                                       ]
                               }
                       },
                     
                     @{@"title":@"アラートビュー（操作）Title",@"action":@"setCustomAlertTitle:"},
                     @{@"title":@"アラートビュー（操作）Message",@"action":@"setCustomAlertMessage:"},
                     @{@"title":@"アラートビュー（操作）Delegate",@"action":@"setCustomAlertDelegate:"},
                     @{@"title":@"アラートビュー（操作）CancelButtonIndex",@"action":@"selectCustomAlertCancelButtonIndex"},
                     @{@"title":@"アラートビュー（操作）ViewStyle",@"action":@"selectCustomAlertViewStyle"},
                     @{@"title":@"アラートビュー（操作）ButtonTitles",@"action":@"setCustomAlertButtonTitles:"},
                     @{@"title":@"アラートビュー（デフォルト）",@"action":@"defalutUIAlertButtonAction:"},
                     @{@"title":@"アラートコントローラ",@"listViewController:":@"ListAlertControllerViewController"},
                     @{@"title":@"カスタムアラート",@"action":@"alertViewController:"},
                     @{@"title":@"カスタムアラート2",@"action":@"alert2ViewController:"},
                     @{@"title":@"カスタムアラート",@"action":@"sampleAlertViewController:"},
                     @{@"title":@"エリア選択",@"action":@"areaSelectionViewController:"},
                     
                     
                     
                     ];

    [self setButtons];
}

- (void)cheackUIAlertView:(UIAlertView *)alertView{
    
    if (alertView.delegate) {
        /* @property(nonatomic,assign) id delegate; */
        NSLog(@"delegate : %@",alertView.delegate);
    }
    
    if (alertView.title) {
        /* @property(nonatomic,copy) NSString *title; */
        NSLog(@"title : %@",alertView.title);
    }
    
    if (alertView.message) {
        /* @property(nonatomic,copy) NSString *message; */
        NSLog(@"message : %@",alertView.message);
    }
    
    if (alertView.numberOfButtons){
        /* @property(nonatomic,readonly) NSInteger numberOfButtons; */
        NSLog(@"numberOfButtons : %ld",(long)alertView.numberOfButtons);
    }
    
    if ([alertView respondsToSelector:@selector(buttonTitleAtIndex:)]){
        /*  - (NSString *)buttonTitleAtIndex:(NSInteger)buttonIndex; */
        for (int b = 0; b < alertView.numberOfButtons; b++) {
            NSLog(@"alert[%d].title = %@",b,[alertView buttonTitleAtIndex:b]);
        }
    }
    
    if (alertView.cancelButtonIndex > -1){
        /* @property(nonatomic) NSInteger cancelButtonIndex; */
        NSLog(@"cancelButtonIndex : %ld",(long)alertView.cancelButtonIndex);
    }
    
    if (alertView.firstOtherButtonIndex){
        /* @property(nonatomic,readonly) NSInteger firstOtherButtonIndex; */
        NSLog(@"firstOtherButtonIndex : %ld",(long)alertView.firstOtherButtonIndex);
    }
    
    if (alertView.visible){
        /* @property(nonatomic,readonly,getter=isVisible) BOOL visible; */
        NSLog(@"visible : %@",alertView.visible?@"YES":@"NO");
    }
    
    if ([alertView respondsToSelector:@selector(dismissWithClickedButtonIndex:animated:)]){
        /*  - (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated; */
        for (int b = 0; b < alertView.numberOfButtons; b++) {
            BOOL animeted = (arc4random_uniform(10) / 10.0) > 5?YES:NO;
            [alertView dismissWithClickedButtonIndex:b animated:animeted];
        }
    }
    
    switch (alertView.alertViewStyle) {
            /*  @property(nonatomic,assign) UIAlertViewStyle alertViewStyle;NS_AVAILABLE_IOS(5_0) */
            //            typedef NS_ENUM(NSInteger, UIAlertViewStyle) {
            //                UIAlertViewStyleDefault = 0,
            //                UIAlertViewStyleSecureTextInput,
            //                UIAlertViewStylePlainTextInput,
            //                UIAlertViewStyleLoginAndPasswordInput
            //            };
            
        case UIAlertViewStyleDefault : {
            NSLog(@"alertViewStyle : %ld",(long)UIAlertViewStyleDefault);
            break;
        }
        case UIAlertViewStyleSecureTextInput : {
            NSLog(@"alertViewStyle : %ld",(long)UIAlertViewStyleSecureTextInput);
            break;
        }
        case UIAlertViewStylePlainTextInput : {
            NSLog(@"alertViewStyle : %ld",(long)UIAlertViewStylePlainTextInput);
            break;
        }
        case UIAlertViewStyleLoginAndPasswordInput : {
            NSLog(@"alertViewStyle : %ld",(long)UIAlertViewStyleLoginAndPasswordInput);
            break;
        }
        default:{
            NSLog(@"alertViewStyle : %ld",(long)alertView.alertViewStyle);
            break;
        }
    }
    
}

- (void)newUIAlertView:(id)sender{
    
    NSLog(@"%@ : 生成",sender);
    
    //    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"UIAlertView"
    //                                                        message:@"message"
    //                                                       delegate:self
    //                                              cancelButtonTitle:@"キャンセル"
    //                                              otherButtonTitles:nil];
    
    UIAlertView *alertView = [UIAlertView new];
    NSDictionary *item = self.buttons[0][@"UIAlertView"];
    if (item[@"title"]) {
        alertView.title = item[@"title"];
    }
    if (item[@"message"]) {
        alertView.message = item[@"message"];
    }
    if (item[@"delegate"]) {
        alertView.delegate = item[@"delegate"];
    }
    for(int b = 0; b < alertView.numberOfButtons;b++) {
        NSLog(@"button[%d] : %@",b,[alertView buttonTitleAtIndex:b]);
    }
    if (item[@"buttonTitles"]) {
        if ([alertView respondsToSelector:@selector(addButtonWithTitle:)]){
            /* - (NSInteger)addButtonWithTitle:(NSString *)title; */
            NSArray *buttonTitles = item[@"buttonTitles"];
            if ([buttonTitles isKindOfClass:[NSArray class]]) {
                for(NSString *buttonTitle in buttonTitles){
                    [alertView addButtonWithTitle:buttonTitle];
                }
            }
        }
    }
    if (item[@"cancelButtonIndex"]) {
        alertView.cancelButtonIndex = [item[@"cancelButtonIndex"] integerValue];
    }
    if (item[@"alertViewStyle"]) {
        alertView.alertViewStyle = [item[@"alertViewStyle"] integerValue];
    }
    
    //
    [self cheackUIAlertView:alertView];
    
    if ([alertView respondsToSelector:@selector(show)]){
        /*  - (void)show; */
        [alertView show];
    }
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSLog(@"%s",__PRETTY_FUNCTION__);
    NSLog(@"@param\n\nalertView:\n%@\nindex:\n%ld",alertView,(long)buttonIndex);
    NSLog(@"alert[%ld].title = %@",(long)buttonIndex,[alertView buttonTitleAtIndex:buttonIndex]);
    
    [self cheackUIAlertView:alertView];
    
    if (UIAlertViewStylePlainTextInput == alertView.alertViewStyle){
        if ([alertView respondsToSelector:@selector(textFieldAtIndex:)]){
            /*  - (UITextField *)textFieldAtIndex:(NSInteger)textFieldIndex NS_AVAILABLE_IOS(5_0); */
            for (int b = 0; b < 1; b++) {
                NSLog(@"alertView.text = %@",[alertView textFieldAtIndex:b].text);
            }
        }
    }
    if (UIAlertViewStyleSecureTextInput == alertView.alertViewStyle){
        if ([alertView respondsToSelector:@selector(textFieldAtIndex:)]){
            /*  - (UITextField *)textFieldAtIndex:(NSInteger)textFieldIndex NS_AVAILABLE_IOS(5_0); */
            for (int b = 0; b < 1; b++) {
                NSLog(@"alertView.text = %@",[alertView textFieldAtIndex:b].text);
            }
        }
    }
    if (UIAlertViewStyleLoginAndPasswordInput == alertView.alertViewStyle){
        if ([alertView respondsToSelector:@selector(textFieldAtIndex:)]){
            /*  - (UITextField *)textFieldAtIndex:(NSInteger)textFieldIndex NS_AVAILABLE_IOS(5_0); */
            for (int b = 0; b < 2; b++) {
                NSLog(@"alertView.text = %@",[alertView textFieldAtIndex:b].text);
            }
        }
    }
}

- (void)alertViewCancel:(UIAlertView *)alertView  {
    
    //    NSLog(@"%s",__PRETTY_FUNCTION__);
    //    NSLog(@"@param\n\nalertView:\n%@",alertView);
    
}

/**
 * UIAlertViewを呼び出す前の処理
 */
- (void)willPresentAlertView:(UIAlertView *)alertView {
    
    //    NSLog(@"%s",__PRETTY_FUNCTION__);
    //    NSLog(@"@param\n\nalertView:\n%@",alertView);
    
}

/**
 * UIAlertViewを呼び出した後の処理
 */
- (void)didPresentAlertView:(UIAlertView *)alertView {
    
    //    NSLog(@"%s",__PRETTY_FUNCTION__);
    //    NSLog(@"@param\n\nalertView:\n%@",alertView);
    
}

/**
 * UIAlertViewのボタンを表示する前の処理
 */
- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    //    NSLog(@"%s",__PRETTY_FUNCTION__);
    //    NSLog(@"@param\n\nalertView:\n%@\nindex:\n%ld",alertView,buttonIndex);
    
}

/**
 * UIAlertViewのボタンを表示した後の処理
 */
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    //    NSLog(@"%s",__PRETTY_FUNCTION__);
    //    NSLog(@"@param\n\nalertView:\n%@\nindex:\n%ld",alertView,buttonIndex);
    
}

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView {
    
    NSLog(@"%s",__PRETTY_FUNCTION__);
    NSLog(@"@param\n\nalertView:\n%@",alertView);
    
    [self cheackUIAlertView:alertView];
    
    return NO;
}

- (void)setCustomAlertTitle:(NSString *)title {
    title = @"カメハメハ";
    NSMutableArray *mButtons = [self.buttons mutableCopy];
    NSMutableDictionary *mButton = [mButtons[0] mutableCopy];
    NSMutableDictionary *mUIAlertView = [mButton[@"UIAlertView"] mutableCopy];
    mUIAlertView[@"title"] = title;
    mButton[@"UIAlertView"] = mUIAlertView;
    mButtons[0] = mButton;
    self.buttons = mButtons;
}

- (void)setCustomAlertMessage:(NSString *)message {
    message = @"カメハメハ";
    NSMutableArray *mButtons = [self.buttons mutableCopy];
    NSMutableDictionary *mButton = [mButtons[0] mutableCopy];
    NSMutableDictionary *mUIAlertView = [mButton[@"UIAlertView"] mutableCopy];
    mUIAlertView[@"message"] = message;
    mButton[@"UIAlertView"] = mUIAlertView;
    mButtons[0] = mButton;
    self.buttons = mButtons;
}

- (void)setCustomAlertDelegate:(id)delegate {
    delegate = self;
    NSMutableArray *mButtons = [self.buttons mutableCopy];
    NSMutableDictionary *mButton = [mButtons[0] mutableCopy];
    NSMutableDictionary *mUIAlertView = [mButton[@"UIAlertView"] mutableCopy];
    mUIAlertView[@"delegate"] = delegate;
    mButton[@"UIAlertView"] = mUIAlertView;
    mButtons[0] = mButton;
    self.buttons = mButtons;
}

- (void)setCustomAlertCancelButtonIndex:(NSInteger )cancelButtonIndex {
    NSMutableArray *mButtons = [self.buttons mutableCopy];
    NSMutableDictionary *mButton = [mButtons[0] mutableCopy];
    NSMutableDictionary *mUIAlertView = [mButton[@"UIAlertView"] mutableCopy];
    mUIAlertView[@"cancelButtonIndex"] = [NSNumber numberWithInteger:cancelButtonIndex];
    mButton[@"UIAlertView"] = mUIAlertView;
    mButtons[0] = mButton;
    self.buttons = mButtons;
}
- (void)selectCustomAlertCancelButtonIndex{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"UIAlertView"
                                                                   message:@"cancelButtonIndex?"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    NSArray *buttonTitles = self.buttons[0][@"UIAlertView"][@"buttonTitles"];
    for(NSString *buttonTitle in buttonTitles){
        [alert addAction:[UIAlertAction actionWithTitle:buttonTitle
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction *action){
                                                    [self setCustomAlertCancelButtonIndex:[buttonTitles indexOfObject:buttonTitle]];
                                                }]];
    }
    
    [self presentViewController:alert animated:YES completion:^(){
        
    }];
    
}

- (void)setCustomAlertViewStyle:(UIAlertViewStyle )alertViewStyle {
    NSMutableArray *mButtons = [self.buttons mutableCopy];
    NSMutableDictionary *mButton = [mButtons[0] mutableCopy];
    NSMutableDictionary *mUIAlertView = [mButton[@"UIAlertView"] mutableCopy];
    mUIAlertView[@"alertViewStyle"] = [NSNumber numberWithInteger:alertViewStyle];
    mButton[@"UIAlertView"] = mUIAlertView;
    mButtons[0] = mButton;
    self.buttons = mButtons;
}

- (void)selectCustomAlertViewStyle{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"UIAlertView"
                                                                   message:@"alertViewStyle?"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"UIAlertViewStyleDefault"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction *action){
                                                [self setCustomAlertViewStyle:UIAlertViewStyleDefault];
                                            }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"UIAlertViewStylePlainTextInput"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction *action){
                                                [self setCustomAlertViewStyle:UIAlertViewStylePlainTextInput];
                                            }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"UIAlertViewStyleSecureTextInput"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction *action){
                                                [self setCustomAlertViewStyle:UIAlertViewStyleSecureTextInput];
                                            }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"UIAlertViewStyleLoginAndPasswordInput"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction *action){
                                                [self setCustomAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
                                            }]];
    
    [self presentViewController:alert animated:YES completion:^(){
        
    }];
    
}

- (void)setCustomAlertButtonTitles:(NSArray *)buttonTitles {
    buttonTitles = @[
                     @"button1",
                     @"button2",
                     @"button3（キャンセル）",
                     ];
    NSMutableArray *mButtons = [self.buttons mutableCopy];
    NSMutableDictionary *mButton = [mButtons[0] mutableCopy];
    NSMutableDictionary *mUIAlertView = [mButton[@"UIAlertView"] mutableCopy];
    mUIAlertView[@"buttonTitles"] = buttonTitles;
    mButton[@"UIAlertView"] = mUIAlertView;
    mButtons[0] = mButton;
    self.buttons = mButtons;
}

-(void)defalutUIAlertButtonAction:(id)sender {
    NSMutableArray *mButtons = [self.buttons mutableCopy];
    NSMutableDictionary *mButton = [mButtons[0] mutableCopy];
    mButton[@"UIAlertView"] = @{
                                @"title":@"UIAlertView",
                                @"message":@"message",
                                @"delegate":self,
                                @"cancelButtonIndex":@1,
                                @"alertViewStyle":[NSNumber numberWithInteger:UIAlertViewStyleDefault],
                                @"buttonTitles":@[
                                        @"ボタンタイトル１",
                                        @"ボタンタイトル２（キャンセル）",
                                        @"ボタンタイトル３",
                                        ]
                                };
    mButtons[0] = mButton;
    self.buttons = mButtons;
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
        navigationController.modalTransitionStyle = arc4random_uniform(4);

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

- (void)dealloc
{
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
    
}


- (void)sampleAlertViewController:(id)sender {
    SampleAlertViewController *sampleAlertViewController =
    [[UIStoryboard storyboardWithName:@"SampleAlert" bundle:nil] instantiateViewControllerWithIdentifier:@"SampleAlertViewController"];

    sampleAlertViewController.delegate = self;
    // アニメーション完了時のPickerViewの位置を計算
    UIView *alertView = sampleAlertViewController.view;
    CGPoint middleCenter = alertView.center;
    
    // アニメーション開始時のPickerViewの位置を計算
    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
    [mainWindow addSubview:alertView];
    alertView.alpha = 0.0f;
    
    // アニメーションを使ってPickerViewをアニメーション完了時の位置に表示されるようにする
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    alertView.alpha = 1.0f;
    alertView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    alertView.center = middleCenter;
    [UIView commitAnimations];

    self.sampleAlertViewController = sampleAlertViewController;
}



- (void)alertViewController:(id)sender {
    // PickerViewControllerのインスタンスをStoryboardから取得し
    self.alertViewController = [[UIStoryboard storyboardWithName:@"Alert" bundle:nil] instantiateViewControllerWithIdentifier:@"AlertViewController"];
    if (!self.alertViewController)
    {
        self.alertViewController = [[AlertViewController alloc] init];
        self.alertViewController.view.backgroundColor = [UIColor clearColor];
    }
    
    self.alertViewController.delegate = self;
    
    // AlertViewをサブビューとして表示する
    // 表示するときはアニメーションをつけて下から上にゆっくり表示させる
    
    // アニメーション完了時のPickerViewの位置を計算
    UIView *alertView = self.alertViewController.view;
    CGPoint middleCenter = alertView.center;
    
    // アニメーション開始時のPickerViewの位置を計算
    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
    [mainWindow addSubview:alertView];
    alertView.alpha = 0.0f;
    
    // アニメーションを使ってPickerViewをアニメーション完了時の位置に表示されるようにする
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    alertView.alpha = 1.0f;
    alertView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    alertView.center = middleCenter;
    [UIView commitAnimations];
    
    
}


- (void)alert2ViewController:(id)sender {
    // PickerViewControllerのインスタンスをStoryboardから取得し
    self.alertViewController = [[UIStoryboard storyboardWithName:@"Alert2" bundle:nil] instantiateViewControllerWithIdentifier:@"Alert2ViewController"];
    if (!self.alertViewController)
    {
        self.alertViewController = [[AlertViewController alloc] init];
        self.alertViewController.view.backgroundColor = [UIColor clearColor];
    }
    
    self.alertViewController.delegate = self;
    
    // AlertViewをサブビューとして表示する
    // 表示するときはアニメーションをつけて下から上にゆっくり表示させる
    
    // アニメーション完了時のPickerViewの位置を計算
    UIView *alertView = self.alertViewController.view;
    CGPoint middleCenter = alertView.center;
    
    // アニメーション開始時のPickerViewの位置を計算
    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
    [mainWindow addSubview:alertView];
    alertView.alpha = 0.0f;
    
    // アニメーションを使ってPickerViewをアニメーション完了時の位置に表示されるようにする
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    alertView.alpha = 1.0f;
    alertView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    alertView.center = middleCenter;
    [UIView commitAnimations];
    
    
}


- (void)areaSelectionViewController:(id)sender {
    // PickerViewControllerのインスタンスをStoryboardから取得し
    self.alertViewController = [[UIStoryboard storyboardWithName:@"AreaSelection" bundle:nil] instantiateViewControllerWithIdentifier:@"AreaSelectionAlertViewController"];
    if (!self.alertViewController)
    {
        self.alertViewController = [[AlertViewController alloc] init];
        self.alertViewController.view.backgroundColor = [UIColor clearColor];
    }
    
    
    self.alertViewController.delegate = self;

    // AlertViewをサブビューとして表示する
    // 表示するときはアニメーションをつけて下から上にゆっくり表示させる
    
    // アニメーション完了時のPickerViewの位置を計算
    UIView *alertView = self.alertViewController.view;
    CGPoint middleCenter = alertView.center;
    
    // アニメーション開始時のPickerViewの位置を計算
    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
    [mainWindow addSubview:alertView];
    alertView.alpha = 0.0f;
    
    // アニメーションを使ってPickerViewをアニメーション完了時の位置に表示されるようにする
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    alertView.alpha = 1.0f;
    alertView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    alertView.center = middleCenter;
    [UIView commitAnimations];
    
    
}


// PickerViewController上にある透明ボタンがタップされたときに呼び出されるPickerViewControllerDelegateプロトコルのデリゲートメソッド

- (void)closeAlertView:(UIViewController *)controller{
    // AlertViewをアニメーションを使ってゆっくり非表示にする
    UIView *alertView = controller.view;
    [UIView beginAnimations:nil context:(void *)alertView];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    // アニメーション終了時に呼び出す処理を設定
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    alertView.alpha = 0.0f;
    [UIView commitAnimations];
    controller = nil;
    NSString *torstMessage = [[NSString stringWithFormat:@"「%@」",@""] stringByAppendingString:@"が設定されました"];
    UILabel *torstLabel = [UILabel new];
    torstLabel.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
    torstLabel.textAlignment = NSTextAlignmentCenter;
    torstLabel.text = torstMessage;
    [torstLabel sizeToFit];
    torstLabel.frame = CGRectMake(0,
                                  0,
                                  CGRectGetWidth([UIScreen mainScreen].bounds) - 100,
                                  CGRectGetHeight(torstLabel.frame) * 3);
    torstLabel.center = self.view.center;
    [self.view addSubview:torstLabel];
    [UIView animateKeyframesWithDuration:3.0
                                   delay:0.3
                                 options:UIViewKeyframeAnimationOptionCalculationModeLinear
                              animations:^(void){
                                  torstLabel.alpha = 0.0f;
                              }completion:^(BOOL finished) {
                                  [torstLabel removeFromSuperview];
                              }];

}

- (void)closeAlertView:(UIViewController *)controller withObject:(id)object
{
    // AlertViewをアニメーションを使ってゆっくり非表示にする
    UIView *alertView = controller.view;
    [UIView beginAnimations:nil context:(void *)alertView];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    // アニメーション終了時に呼び出す処理を設定
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    alertView.alpha = 0.0f;
    [UIView commitAnimations];
    controller = nil;
    NSString *torstMessage = [[NSString stringWithFormat:@"「%@」",object] stringByAppendingString:@"が設定されました"];
    UILabel *torstLabel = [UILabel new];
    torstLabel.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
    torstLabel.textAlignment = NSTextAlignmentCenter;
    torstLabel.text = torstMessage;
    [torstLabel sizeToFit];
    torstLabel.frame = CGRectMake(0,
                                  0,
                                  CGRectGetWidth([UIScreen mainScreen].bounds) - 100,
                                  CGRectGetHeight(torstLabel.frame) * 3);
    torstLabel.center = self.view.center;
    [self.view addSubview:torstLabel];
    [UIView animateKeyframesWithDuration:3.0
                                   delay:0.3
                                 options:UIViewKeyframeAnimationOptionCalculationModeLinear
                              animations:^(void){
                                  torstLabel.alpha = 0.0f;
                              }completion:^(BOOL finished) {
                                  [torstLabel removeFromSuperview];
                              }];
}

// 単位のPickerViewを閉じるアニメーションが終了したときに呼び出されるメソッド
- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    // PickerViewをサブビューから削除
    UIView *alertView = (__bridge UIView *)context;
    [alertView removeFromSuperview];
    self.alertViewController = nil;
}

@end
