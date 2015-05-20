//
//  ViewControllerListViewController.m
//  SandBox
//
//  Created by YouOhshima on 2015/04/24.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "ViewControllerListViewController.h"


#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 90000
#define __IPHONE_TARGET_IOS9 1
#else
#define __IPHONE_TARGET_IOS9 0
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
#define __IPHONE_TARGET_IOS8 1
#else
#define __IPHONE_TARGET_IOS8 0
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_7_0
#define __IPHONE_TARGET_IOS7 1
#else
#define __IPHONE_TARGET_IOS7 0
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_6_0
#define __IPHONE_TARGET_IOS6 1
#else
#define __IPHONE_TARGET_IOS6 0
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_5_0
#define __IPHONE_TARGET_IOS5 1
#else
#define __IPHONE_TARGET_IOS5 0
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_4_0
#define __IPHONE_TARGET_IOS4 1
#else
#define __IPHONE_TARGET_IOS4 0
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_3_0
#define __IPHONE_TARGET_IOS3 1
#else
#define __IPHONE_TARGET_IOS3 0
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_2_0
#define __IPHONE_TARGET_IOS2 1
#else
#define __IPHONE_TARGET_IOS2 0
#endif


@interface ViewControllerListViewController ()

@property (nonatomic,retain) NSArray *buttons;

@end

@implementation ViewControllerListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.buttons = @[
                     @{@"title":@"端末の向き",@"action":@"viewSize:"},
                     ];
    
    CGRect rectButton = CGRectZero;
    for (NSDictionary *item in self.buttons) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
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
        }        [self.view addSubview:button];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewSize:(id)sender{
    NSLog(@"bounds: width = %f, height = %f",
          [UIScreen mainScreen].bounds.size.width,
          [UIScreen mainScreen].bounds.size.height);
    NSLog(@"applicationFrame: width = %f, height = %f",
          [UIScreen mainScreen].applicationFrame.size.width,
          [UIScreen mainScreen].applicationFrame.size.height);
    
}


#if __IPHONE_TARGET_IOS8

- (void)viewWillTransitionToSize:(CGSize)size
       withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    if (size.width <= size.height) {
        // 画面回転後、縦向きになった
        NSLog(@"%@",@"iOS8 画面回転後、縦向きになった");
        [self viewSize:self];
    } else {
        // 画面回転後、横向きになった
        NSLog(@"%@",@"iOS8 画面回転後、横向きになった");
        [self viewSize:self];
    }
}

#else

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                duration:(NSTimeInterval)duration {
    // 画面回転後、縦向きになった
    NSLog(@"%@",@"iOS8 画面回転後、縦向きになった");
    [self viewSize:self];
    // 画面回転前
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    // 画面回転後、横向きになった
    NSLog(@"%@",@"iOS8 画面回転後、横向きになった");
    // 画面回転後
    [self viewSize:self];
}

#endif
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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

@end