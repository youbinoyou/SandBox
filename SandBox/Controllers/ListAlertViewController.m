//
//  ListAlertViewController.m
//  SandBox
//
//  Created by 大島 曜 on 2015/04/23.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "ListAlertViewController.h"

@interface ListAlertViewController ()

@property (nonatomic) NSArray *buttons;

@end

@implementation ListAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.buttons = @[
                     @{@"title.normal":@""},
                     @{@"title.normal":@""},
                     @{@"title.normal":@""},
                     ];
    CGRect rectButton = CGRectZero;
    for (NSDictionary *item in self.buttons) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.5 alpha:0.5];
        [button setTitle:item[@"title.normal"] forState:UIControlStateNormal];
        [button sizeToFit];
        rectButton = button.frame;
        rectButton.size.height = [UIScreen mainScreen].applicationFrame.size.height / self.buttons.count;
        button.frame = rectButton;
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

@end
