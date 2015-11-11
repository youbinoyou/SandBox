//
//  ListUIImageViewObjectViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/11/11.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "ListUIImageViewObjectViewController.h"

@interface ListUIImageViewObjectViewController ()

@end

@implementation ListUIImageViewObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setListButtons];
    [self setImageView];
    
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
                     @{@"title":@"UIImageViewでユーザー操作を扱う設定"},
                     @{
                         @"title":@"userInteractionEnabledを YES にする。",
                         @"action":@"setImageUserInteractionEnabledYES",
                       },
                     @{
                         @"title":@"userInteractionEnabledを NO にする。",
                         @"action":@"setImageUserInteractionEnabledNO",
                       },
                     @{
                         @"title":@"UIImageViewでユーザー操作を追加する",
                         @"action":@"setImageTapGesture",
                         },
                     @{
                         @"title":@"情報提供元",
                         @"link":@"http://www.yoheim.net/blog.php?q=20111027",
                         }
                     
                     ];
    [self setButtons];
}

- (void)setImageView{
    self.mainImageView = [UIImageView new];
    self.mainImageView.frame = CGRectMake(0, 0, 100, 100);
    self.mainImageView.center = self.view.center;
    self.mainImageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.mainImageView];
}

- (void)setImageUserInteractionEnabledYES {
    _mainImageView.userInteractionEnabled = YES;
    NSLog(@"userInteractionEnabledを YES にする。");
}

- (void)setImageUserInteractionEnabledNO {
    _mainImageView.userInteractionEnabled = NO;
    NSLog(@"userInteractionEnabledを NO にする。");
}

- (void)setImageTapGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [_mainImageView addGestureRecognizer:tap];
}

- (void)tapAction:(id)sender {
    NSLog(@"[%@]\nがタップされました。",sender);
}

@end
