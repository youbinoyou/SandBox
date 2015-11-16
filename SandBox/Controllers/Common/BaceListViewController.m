//
//  BaceListViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/11/11.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "BaceListViewController.h"
#import "UtilsFILE.h"

#define KEY_TITLE @"title"
#define KEY_LINL @"link"
#define KEY_ACTION @"action"
#define KEY_LIST_VIEW_CONTROLLER @"listViewController:"

const NSString *keyTitle = @"title";
const NSString *keyLink = @"link";
const NSString *keyAction = @"action";
const NSString *keyListViewController = @"listViewController:";

@interface BaceListViewController ()

@end

@implementation BaceListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",[UtilsFILE fileStringWithFormat:@"%@",NSStringFromClass(self.class)]);
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
                     @{keyTitle : @"イメージの基本"},
                     @{keyTitle : @"データ型について"},
                     @{keyTitle : @"関数について"},
                     @{keyTitle : @"基本知識"},
                     @{keyTitle : @"基本構文"},
                     @{
                         KEY_TITLE : @"UIImageViewでユーザーからの操作を扱いたい",
                         KEY_LIST_VIEW_CONTROLLER : @"ListUIImageViewObjectViewController",
                         },
                     
                     @{
                         KEY_TITLE : @"応用構文",
                         KEY_LIST_VIEW_CONTROLLER : @"ListAppliedConstrueViewController",
                         },
                     @{
                         KEY_TITLE : @"Fundation Framework",
                         KEY_LIST_VIEW_CONTROLLER : @"ListFoundationViewController",
                         },
                     @{
                         KEY_TITLE : @"UIKit Framework",
                         KEY_LIST_VIEW_CONTROLLER : @"ListUIKitViewController",
                         },
                     @{
                         KEY_TITLE : @"ListCoreLocation Framework",
                         KEY_LIST_VIEW_CONTROLLER : @"ListCoreLocationViewController",
                         },
                     @{
                         KEY_TITLE : @"MapKit Framework",
                         KEY_LIST_VIEW_CONTROLLER : @"ListMapKitViewController",
                         },
                     ];
    [self setButtons];
}

- (void)setButtons{
    CGRect rectButton = CGRectZero;
    
    if (self.buttons.count > 10) {
        UIScrollView *scrollView = [UIScrollView new];
        scrollView.frame = self.view.frame;
        scrollView.backgroundColor = self.view.backgroundColor;
        self.view = scrollView;
    }

    for (NSDictionary *item in self.buttons) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        const CGFloat r = arc4random_uniform(255) / 255.0;
        const CGFloat g = arc4random_uniform(255) / 255.0;
        const CGFloat b = arc4random_uniform(255) / 255.0;
        const CGFloat x = 20;
        button.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:0.5];
        [button setTitle : item[ keyTitle ] forState : UIControlStateNormal];
        [button sizeToFit];
        button.tag = [self.buttons indexOfObject : item];
        rectButton.origin.x = x;
        rectButton.size.width  = [UIScreen mainScreen].applicationFrame.size.width - (x * 2);
        
        if (self.buttons.count > 10) {
            rectButton.size.height = [UIScreen mainScreen].applicationFrame.size.height / (10 + 2);
        } else {
            rectButton.size.height = [UIScreen mainScreen].applicationFrame.size.height / (self.buttons.count + 2);
        }
        
        rectButton.origin.y += rectButton.size.height + 1;
        button.frame = rectButton;
        
        if (item[keyLink]) {
            SEL linkAction = NSSelectorFromString(@"linkURLAction:event:");
            if ([self respondsToSelector : linkAction]) {
                [button addTarget:self action:linkAction forControlEvents:UIControlEventTouchUpInside];
            }
        }
        
        if (item[keyListViewController]) {
            SEL action = NSSelectorFromString(@"listViewController:event:");
            if ([self respondsToSelector : action]) {
                [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
            }
        }
        
        if (item[keyAction]) {
            SEL action = NSSelectorFromString(item[keyAction]);
            if ([self respondsToSelector:action]) {
                [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
            }
        }
        
        [self.view addSubview:button];
        
        if (self.buttons.count > 10) {
            if ([self.view isKindOfClass:[UIScrollView class]]) {
                NSLog(@"UIScrollView");
                UIScrollView *scrollView = (UIScrollView *)(self.view);
                scrollView.contentSize = CGSizeMake(self.view.frame.size.width, button.frame.origin.y + button.frame.size.height + 30);
            }
        }
    }
}

- (void)linkURLAction:(id)sender event:(id)event {
    
    UIButton *sendButton = sender;
    NSString *linkURLString = self.buttons[sendButton.tag][keyLink];
    NSURL *linkURL = [NSURL URLWithString:linkURLString];
    if ([[UIApplication sharedApplication] canOpenURL:linkURL]) {
        [[UIApplication sharedApplication] openURL:linkURL];
    } else {
        NSLog(@"リンク切れ : %@",linkURLString);
    }
    
}

- (void)listViewController:(id)sender event:(id)event {
    
    NSLog(@"%@", [NSString stringWithUTF8String:__PRETTY_FUNCTION__]);
    NSLog(@"@param\n\nsender:\n%@\nevent:\n%@",sender,event);
    
    UIButton *sendButton = sender;
    Class listViewControllerClass = NSClassFromString(self.buttons[sendButton.tag][keyListViewController]);
    if (listViewControllerClass) {
        /**
         * 遷移するViewControllerの生成
         */
        UIViewController *listViewController = [[listViewControllerClass alloc] init];
        listViewController.view.backgroundColor = self.view.backgroundColor;
        listViewController.title = self.buttons[sendButton.tag][keyTitle];
        listViewController.navigationItem.leftBarButtonItem =
        // TOPページに戻る処理
        [[UIBarButtonItem alloc] initWithTitle:@"<<<" style:UIBarButtonItemStylePlain target:self action:@selector(dismissCloseButtonAction:)];
        
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:listViewController];
        navigationController.modalTransitionStyle = arc4random_uniform(4);
        
        [self presentViewController:navigationController animated:YES completion:^(){
            NSLog(@"%@",self.buttons[sendButton.tag][keyTitle]);
        }];
    } else {
        NSLog(@"No Class : %@",self.buttons[sendButton.tag][keyListViewController]);
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
