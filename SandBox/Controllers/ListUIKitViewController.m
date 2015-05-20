//
//  ListUIKitViewController.m
//  SandBox
//
//  Created by 大島 曜 on 2015/05/08.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "ListUIKitViewController.h"

@interface ListUIKitViewController ()

@property (nonatomic,retain) NSArray *buttons;

@end

@implementation ListUIKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.buttons = @[
                     @{
                         @"title":@"サイズ指定"
                         },
                     @{
                         @"title":@"UIColor"
                         },
                     @{
                         @"title":@"UIFont"
                         },
                     @{
                         @"title":@"UIImage"
                         },
                     @{
                         @"title":@"UIScreen"
                         },
                     @{
                         @"title":@"UIDevice"
                         },
                     @{
                         @"title":@"UINavigationItem"
                         },
                     @{
                         @"title":@"UIAccelerometer"
                         },
                     @{
                         @"title":@"UIResponder"
                         },
                     @{
                         @"title":@"UIApplication"
                         },
                     @{
                         @"title":@"UIViewController"
                         },
                     @{
                         @"title":@"UINavigationController"
                         },
                     @{
                         @"title":@"UITabBarController"
                         },
                     @{
                         @"title":@"UIImagePickerController"
                         },
                     @{
                         @"title":@"UIView"
                         },
                     @{
                         @"title":@"UIWindow"
                         },
                     @{
                         @"title":@"UILabel"
                         },
                     @{
                         @"title":@"UIProgressView"
                         },
                     @{
                         @"title":@"UITableViewCell"
                         },
                     @{
                         @"title":@"UIAlertView"
                         },
                     @{
                         @"title":@"UIActionSheet"
                         },
                     @{
                         @"title":@"UIImageView"
                         },
                     @{
                         @"title":@"UIWebView"
                         },
                     @{
                         @"title":@"UIActivityIndicatorView"
                         },
                     @{
                         @"title":@"UIPickerView"
                         },
                     @{
                         @"title":@"UISearchBar"
                         },
                     @{
                         @"title":@"UINavigationBar"
                         },
                     @{
                         @"title":@"UIToolbar"
                         },
                     @{
                         @"title":@"UIBarButtonItem"
                         },
                     @{
                         @"title":@"UIControl"
                         },
                     @{
                         @"title":@"UIButton"
                         },
                     @{
                         @"title":@"UITextField"
                         },
                     @{
                         @"title":@"UISwitch"
                         },
                     @{
                         @"title":@"UISegmentedControl"
                         },
                     @{
                         @"title":@"UISlider"
                         },
                     @{
                         @"title":@"UIDatePicker"
                         },
                     @{
                         @"title":@"UIPageControl"
                         },
                     @{
                         @"title":@"UIScrollView"
                         },
                     @{
                         @"title":@"UITableView"
                         },
                     @{
                         @"title":@"UITextView"
                         },
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
