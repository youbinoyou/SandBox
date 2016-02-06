//
//  ContentsSettingViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/12/22.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import "ContentsSettingViewController.h"
#import "ContentsSettingTableView.h"

@interface ContentsSettingViewController ()<ContentsSettingTableViewDelegate>

@property (strong, nonatomic) IBOutlet ContentsSettingTableView *contentsSettingTableView;

@end

@implementation ContentsSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.contentsSettingTableView.contentsDelegate = self;
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

- (void)close {
    [self dismissViewControllerAnimated:YES completion:^(void){}];
}

#pragma mark - ContentsSettingTableViewDelegate

- (void)contentsSettingTableView:(ContentsSettingTableView *)settingTableView action:(SEL)action {
    if (action) {
        [self performSelector:action withObject:nil afterDelay:0.0];
    }
}

- (void)contentsCellObject:(id)sender action:(SEL)action {
    if (action) {
        [self performSelector:action withObject:nil afterDelay:0.0];
    }
}

@end
