//
//  ListImageViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/11/11.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "ListImageViewController.h"

@interface ListImageViewController ()

@property (nonatomic,copy) NSArray *buttons;

@end

@implementation ListImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setListButtons];
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

- (void)setListButtons{
    
    self.buttons = @[
                     @{@"title":@"イメージの基本"},
                     @{@"title":@"データ型について"},
                     @{@"title":@"関数について"},
                     @{@"title":@"基本知識"},
                     @{@"title":@"基本構文"},
                     @{
                         @"title":@"UIImageViewでユーザーからの操作を扱いたい",
                         @"listViewController:":@"ListUIImageViewObjectViewController",
                         },
                     
                     @{
                         @"title":@"応用構文",
                         @"listViewController:":@"ListAppliedConstrueViewController",
                         },
                     @{
                         @"title":@"Fundation Framework",
                         @"listViewController:":@"ListFoundationViewController",
                         },
                     @{
                         @"title":@"UIKit Framework",
                         @"listViewController:":@"ListUIKitViewController",
                         },
                     @{
                         @"title":@"ListCoreLocation Framework",
                         @"listViewController:":@"ListCoreLocationViewController",
                         },
                     @{
                         @"title":@"MapKit Framework",
                         @"listViewController:":@"ListMapKitViewController",
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

@end

