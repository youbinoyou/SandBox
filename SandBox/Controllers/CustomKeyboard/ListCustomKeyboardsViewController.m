//
//  ListCustomKeyboardsViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/12/09.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import "ListCustomKeyboardsViewController.h"
#import "CustomNumberKeyboard.h"
#import "UtilsViewController.h"
#import "CustomSecurityNumberKeyboardViewController.h"

@interface ListCustomKeyboardsViewController () {
    UITextField *kingakuTx;
}

@end

@implementation ListCustomKeyboardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setListButtons];
    kingakuTx = [UITextField new];
    kingakuTx.borderStyle = UITextBorderStyleRoundedRect;
    kingakuTx.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1];
    CGRect kingakuTxRect = [UIScreen mainScreen].applicationFrame;
    kingakuTxRect.origin.y = 60;
    kingakuTxRect.size.height = 44;
    kingakuTx.frame = kingakuTxRect;
    [self.view addSubview:kingakuTx];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setListButtons {
    self.buttons = @[
                     @{
                         keyTitle : @"CustomNumberKeyboardの設定",
                         keyAction : @"makeCustomNumberKeyboard",
                         },
                     @{
                         keyTitle : @"セキュリティ設定",
                         keyAction : @"openCustomSecurityNumberKeyboardViewController",
                         },
                     ];
    [self setButtons];
}

- (void)makeCustomNumberKeyboard {
    CustomNumberKeyboard *aCustomNumberKeyboard = [CustomNumberKeyboard new];
    aCustomNumberKeyboard.activeTextField = kingakuTx;
    kingakuTx.inputView = aCustomNumberKeyboard;
//    NSLog(@"aCustomNumberKeyboard : %@",aCustomNumberKeyboard);
//    for (UIView *subViews in aCustomNumberKeyboard.subviews) {
//        NSLog(@"%@",subViews);
//    }
//
//    CGRect aCustomNumberKeyboardRect = aCustomNumberKeyboard.frame;
//    aCustomNumberKeyboardRect.origin.y = [UIScreen mainScreen].bounds.size.height - aCustomNumberKeyboardRect.size.height;
//    aCustomNumberKeyboard.frame = aCustomNumberKeyboardRect;
//
//    [self.view addSubview:aCustomNumberKeyboard];

}

- (void)openCustomSecurityNumberKeyboardViewController {
    id viewController = [UtilsViewController getTransitionModalViewController:@"CustomSecurityNumberKeyboard"
                                                     withStortboardIdentifier:@"CustomSecurityNumberKeyboardViewController"];
    id nextViewController = [UtilsViewController getTransitionModalViewController:@"Main"
                                                     withStortboardIdentifier:@"ViewController"];
    
    ((CustomSecurityNumberKeyboardViewController *)viewController).nextViewController = nextViewController;
    
    [self presentViewController:viewController animated:YES completion:^(void){
        
    }];
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
