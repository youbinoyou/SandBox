//
//  ListUIScrollViewObjectViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/11/17.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import "ListUIScrollViewObjectViewController.h"

@interface ListUIScrollViewObjectViewController ()

@end

@implementation ListUIScrollViewObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setListButtons];
}

- (void)setListButtons {
    self.buttons = @[
                     @{
                         @"title":@"スクロールビュー",
                         @"action":@"newUIWindow:",
                       },
                     @{
                         @"title":@"カスタムスクロールビュー",
                         @"action":@"customWindow:"},
                     ];
    
    [self setButtons];
}

@end
