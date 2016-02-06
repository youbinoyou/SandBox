//
//  ListUIWindowObjectViewController.m
//  SandBox
//
//  Created by YouOhshima on 2015/04/30.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "ListUIWindowObjectViewController.h"

@interface ListUIWindowObjectViewController ()

@property (nonatomic) UIWindow *window;

@end

@implementation ListUIWindowObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setListButtons];
}

- (void)setListButtons {
    self.buttons = @[
                     @{@"title":@"ウィンドウ",@"action":@"newUIWindow:",
                       @"UIWindow":@{
                               }
                       },
                     @{@"title":@"カスタムウィンドウ",@"action":@"customWindow:"},
                     ];
    
    [self setButtons];
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

- (IBAction)newUIWindow:(id)sender {
    [self showWindow];
}

- (void)showWindow
{
    UIWindow *window = [UIWindow new];
    window.frame = UIScreen.mainScreen.bounds;
    window.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.0];
    UIView *alertView = [UIView new];
    alertView.frame =  CGRectMake(0, 0, 200, 200);
    alertView.backgroundColor = [UIColor colorWithRed:1
                                                  green:1
                                                   blue:1
                                                  alpha:0.3];
    UIButton *alertButton = [UIButton new];
    alertButton.frame = CGRectMake(0, 0, 100, 100);
    alertButton.center = alertView.center;
    alertView.center = self.view.center;

    alertButton.backgroundColor = [UIColor colorWithRed:0
                                                  green:1
                                                   blue:0
                                                  alpha:0.6];
    [alertButton setTitle:@"remove" forState:UIControlStateNormal];
    [alertButton addTarget:self action:@selector(removeWindow) forControlEvents:UIControlEventTouchUpInside];
    [alertView addSubview:alertButton];
    [window addSubview:alertView];

    [window makeKeyAndVisible];
    self.window = window;
    window.transform = CGAffineTransformMakeScale(1.4, 1.4);
    [UIView animateWithDuration:0.3 animations:^(void){
        window.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.2];
        window.transform = CGAffineTransformIdentity;
    }completion:^(BOOL finished){
        
    }];
    
}

- (void)removeWindow
{
    
    [UIView animateWithDuration:0.3 animations:^(void){
        self.window.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.0];
        for (UIView *view in self.window.subviews) {
            view.transform = CGAffineTransformMakeScale(0.5, 0.5);
        }
    }completion:^(BOOL finished){
        if (finished) {
            UIApplication *app = UIApplication.sharedApplication;
            NSRange range = NSMakeRange(0, [app.windows indexOfObject:self.window] - 1);
            UIWindow *nextKeyWindow = [[app.windows subarrayWithRange:range] lastObject];
            [nextKeyWindow makeKeyAndVisible];
            self.window = nil; // 保持していたwindowを破棄
        }
    }];
}

- (IBAction)customWindow:(id)sender {
    [self showCustomWindow];
}

- (void)showCustomWindow
{
    UIWindow *window = [UIWindow new];
    window.frame = UIScreen.mainScreen.bounds;
    window.backgroundColor = [UIColor colorWithRed:1
                                              green:1
                                               blue:0
                                              alpha:0.0];
    UIView *alertView = [UIView new];
    alertView.frame =  CGRectMake(0, 0, CGRectGetWidth(window.frame) - 10, 200);
    alertView.backgroundColor = [UIColor colorWithRed:1
                                                green:1
                                                 blue:0
                                                alpha:0.3];
    /**
     * 角丸の作成
     */
    alertView.layer.cornerRadius = 10;
    alertView.layer.masksToBounds = YES;
    alertView.layer.borderColor = [UIColor colorWithRed:1
                                                  green:1
                                                   blue:0
                                                  alpha:0.45].CGColor;
    alertView.layer.borderWidth = 2.0;
    NSArray *buttonItems = @[
                              @{
                                  @"title":@"open",
                                  @"action":@"newUIWindow:",
                                  @"x":@0,
                                  @"y":@99,
                                  @"width":@(CGRectGetWidth(alertView.frame)) ,
                                  @"height":@44,
                                  },
                              @{
                                  @"title":@"close",
                                  @"action":@"removeCustomWindow",
                                  @"x":@0,
                                  @"y":@144,
                                  @"width":@(CGRectGetWidth(alertView.frame)),
                                  @"height":@44,
                                  }
                              ];
    for (NSDictionary *buttonItem in buttonItems) {
        UIButton *alertButton = [UIButton new];
        alertButton.frame = CGRectMake([buttonItem[@"x"] floatValue],
                                       [buttonItem[@"y"] floatValue],
                                       [buttonItem[@"width"] floatValue],
                                       [buttonItem[@"height"] floatValue]);
        alertButton.backgroundColor = [UIColor colorWithRed:1
                                                      green:1
                                                       blue:0
                                                      alpha:0.6];
        [alertButton setTitle:buttonItem[@"title"] forState:UIControlStateNormal];
        [alertButton setTitleColor:[UIColor colorWithRed:0
                                                   green:0
                                                    blue:0
                                                   alpha:1.0]
                          forState:UIControlStateNormal];
        SEL action = NSSelectorFromString(buttonItem[@"action"]);
        if ([self respondsToSelector:action]) {
            [alertButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
        } else {
            NSLog(@"no action");
        }
        [alertView addSubview:alertButton];
    }
    alertView.center = self.view.center;
    [window addSubview:alertView];
    [window makeKeyAndVisible];
    self.window = window;
    window.transform = CGAffineTransformMakeScale(1.4, 1.4);
    [UIView animateWithDuration:0.3 animations:^(void){
        window.backgroundColor =  [UIColor colorWithRed:1
                                                  green:1
                                                   blue:0
                                                  alpha:0.2];
        window.transform = CGAffineTransformIdentity;
    }completion:^(BOOL finished){
        
    }];
    
}

- (void)removeCustomWindow
{
    
    [UIView animateWithDuration:0.3 animations:^(void){
        self.window.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.0];
        for (UIView *view in self.window.subviews) {
            view.transform = CGAffineTransformMakeScale(0.5, 0.5);
        }
    }completion:^(BOOL finished){
        if (finished) {
            [self removeWindow];
        }
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
