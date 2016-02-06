//
//  ProgressViewListViewController.m
//  SandBox
//
//  Created by YouOhshima on 2015/05/19.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "ProgressViewListViewController.h"

@interface ProgressViewListViewController ()

@property (nonatomic,retain) NSArray *buttons;

@end

@implementation ProgressViewListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.buttons = @[
                     @{@"title":@"プログレスビュー",@"action":@"newUISlider:",
                       @"UISlider":@{
                               }
                       },
                     
                     @{@"title":@"プログレスビュー",@"action":@"setProgressView:"},
                     @{@"title":@"カスタムカラープログレスビュー",@"action":@"setColorProgressView:"},
//                     @{@"title":@"カスタムカラースライダー",@"action":@"setCustomColorSlider:"},
//                     @{@"title":@"カスタムイラストスライダー",@"action":@"setCustomImageSlider:"},
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

- (void)setProgressView:(id)sender
{
    // プログレスバーを作成
    UIProgressView *progressView =
    [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    progressView.frame = CGRectMake(10, 110, 250, 0);
    // プログレスバーをビューに追加
    [self.view addSubview:progressView];
    progressView.progress = 0.0;
    // タイマーを生成（0.1秒おきにdoTimer:メソッドを呼び出す）
    progressView.tag = 0;
    [NSTimer scheduledTimerWithTimeInterval:0.1f
                                     target:self
                                   selector:@selector(doTimer:)
                                   userInfo:@{
                                              @"progressView":progressView}
                                    repeats:YES
     ];
}


- (void)setColorProgressView:(id)sender
{
    // プログレスバーを作成
    UIProgressView *progressView =
    [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    progressView.frame = CGRectMake(10, 110, 250, 0);
    progressView.progressTintColor = [UIColor orangeColor];
    progressView.trackTintColor = [UIColor lightGrayColor];
    progressView.progressViewStyle = UIProgressViewStyleDefault;
    
    progressView.transform = CGAffineTransformMakeScale( 1.0f, 10.0f ); // 横方向に1倍、縦方向に3倍して表示する
    // プログレスバーをビューに追加
    [self.view addSubview:progressView];
    progressView.progress = 0.0;
    // タイマーを生成（0.1秒おきにdoTimer:メソッドを呼び出す）
    progressView.tag = 0;
    [NSTimer scheduledTimerWithTimeInterval:0.1f
                                     target:self
                                   selector:@selector(doTimer:)
                                   userInfo:@{
                                              @"progressView":progressView}
                                    repeats:YES
     ];
    
    progressView.layer.cornerRadius = 20.0f;
    progressView.clipsToBounds = YES;
    // aViewは、UIView型のインスタンス
    // 領域外をマスクで切り取る設定をしない
    progressView.layer.masksToBounds = YES;
    // 影のかかる方向を指定する
    progressView.layer.shadowOffset = CGSizeMake(-2.0f, 2.0f);
    // 影の透明度
    progressView.layer.shadowOpacity = 0.7f;
    // 影の色
    progressView.layer.shadowColor = [UIColor blackColor].CGColor;
    // ぼかしの量
    progressView.layer.shadowRadius = 2.0f;

}


/**
 * 指定時間後にタイマーから呼ばれる
 * @param timer 呼び出し元のNSTimerオブジェクト
 */
- (void)doTimer:(NSTimer *)timer
{
    NSLog(@"userInfo%@",timer.userInfo[@"progressView"]);
    UIProgressView *progressView = timer.userInfo[@"progressView"];
    int p = (int)progressView.tag;
    // プログレスバーのバーをのばす
    progressView.progress = (float)p / 100.0;
    
    progressView.tag++;
    if (progressView.tag > 100) {
        // タイマーを止める
        [timer invalidate];
        progressView.tag = 0;
        
        [progressView setProgress:0.5 animated:YES];
        //        [self dismissCloseButtonAction:nil];
    }
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
 * 戻る処理
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



@end
