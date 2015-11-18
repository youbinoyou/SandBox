//
//  ListUITableViewObjectViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/11/17.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import "ListUITableViewObjectViewController.h"

@interface ListUITableViewObjectViewController ()

@end

@implementation ListUITableViewObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setListButtons];
}

- (void)setListButtons {
    self.buttons = @[
                     @{
                         keyTitle : @"スクロールビュー",
                         keyAction : @"newUITableView:",
                         },
                     @{
                         keyTitle : @"カスタムスクロールビュー",
                         keyAction : @"customTableView:"
                         },
                     @{
                         keyTitle : @"UITableViewのスクロールをロックするには",
                         keyListViewController : @"NoScrollTableViewController",
                         },
                     @{
                         keyTitle:@"UITableViewのセルを選択した時にチェックマークをつけるには",
                         keyListViewController : @"CheckMarkTableViewController",
                         },
                     @{
                         keyTitle:@"UITableViewの複数選択モード時のチェックボックスの色を変更する方法",
                         keyListViewController : @"ColorCheckMarkTableViewController",
                         },
                     @{
                         keyTitle:@"UITableViewのセルを選択した時にチェックマークをつけるには",
                         keyListViewController : @"CheckMarkTableViewController",
                         },
                     ];
    [self setButtons];
}

//- (void)

@end
