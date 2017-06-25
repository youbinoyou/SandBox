//
//  ListObjeciveCViewController.m
//  SandBox
//
//  Created by 大島 曜 on 2015/05/08.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "ListObjeciveCViewController.h"

@interface ListObjeciveCViewController ()

@end

@implementation ListObjeciveCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setListButtons];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setListButtons {
    self.buttons = @[
                     @{keyTitle : @"ObjectiveCの基本"},
                     @{keyTitle : @"データ型について"},
                     @{keyTitle : @"関数について"},
                     @{keyTitle : @"基本知識"},
                     @{keyTitle : @"基本構文"},
                     @{
                         keyTitle : @"応用構文",
                         keyListViewController : @"ListAppliedConstrueViewController",
                         },
                     @{
                         keyTitle : @"XCode エラーについて",
                         keyListViewController : @"ListXCodeErrorViewController",
                         },
                     @{
                         keyTitle : @"Fundation Framework",
                         keyListViewController : @"ListFoundationViewController",
                         },
                     @{
                         keyTitle : @"UIKit Framework",
                         keyListViewController : @"ListUIKitViewController",
                         },
                     @{
                         keyTitle : @"ListCoreLocation Framework",
                         keyListViewController : @"ListCoreLocationViewController",
                         },
                     @{
                         keyTitle : @"MapKit Framework",
                         keyListViewController : @"ListMapKitViewController",
                         },
                     ];
    [self setButtons];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
