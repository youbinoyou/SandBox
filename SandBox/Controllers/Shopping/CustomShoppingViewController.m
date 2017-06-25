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
    NSDictionary *titleItem = @{
                                @"Top":@"トップ",
                                @"Gifting":@"贈り物",
                                @"Shopping":@"買い物",
                                @"Setting":@"設定",
                                };
    //NSString *titleKey = self.selectedViewController.tabBarItem.title;
    self.title = titleItem[@"Top"];
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
//    NSLog(@"selectedIndex : %ld",self.selectedIndex);
//    NSLog(@"title : %@",viewController.title);
//    NSLog(@"title : %@",tabBarController.tabBarItem.title);
//    NSLog(@"title : %@",tabBarController.tabBarController.title);
//    NSLog(@"title : %@",viewController.tabBarItem.title);
//    NSLog(@"title : %@",viewController.tabBarController.title);
//    NSArray *titles = @[@"トップ",@"贈り物",@"買い物",@"設定"];
    NSDictionary *titleItem = @{
                                @"Top":@"トップ",
                                @"Gifting":@"贈り物",
                                @"Shopping":@"買い物",
                                @"Setting":@"設定",
                                };
    NSString *titleKey = viewController.tabBarItem.title;
    self.title = titleItem[titleKey];
    //self.title = titles[self.selectedIndex];
//    NSLog(@"title : %@",viewController.navigationController.navigationItem.title);
// タブの切り替え
//    NSMutableArray *viewControllers = [NSMutableArray array];
//    for (int i = (int)[self.viewControllers count] - 1;i >= 0; i--) {
//        [viewControllers addObject:self.viewControllers[i]];
//    }
//    [tabBarController setViewControllers:viewControllers animated:NO];
}

@end
