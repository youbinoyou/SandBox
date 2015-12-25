//
//  CustomShoppingViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/12/22.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import "CustomShoppingViewController.h"

@interface CustomShoppingViewController ()<UITabBarControllerDelegate>

@end

@implementation CustomShoppingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"トップ";
    self.delegate = self;
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

#pragma mark - UITabBarControllerDelegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"selectedIndex : %ld",self.selectedIndex);
}

@end
