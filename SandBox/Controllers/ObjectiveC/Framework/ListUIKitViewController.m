//
//  ListUIKitViewController.m
//  SandBox
//
//  Created by 大島 曜 on 2015/05/08.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "ListUIKitViewController.h"

@interface ListUIKitViewController ()

@end

@implementation ListUIKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setListButtons];
}

- (void)setListButtons {
    self.buttons = @[
                     @{
                         @"title":@"サイズ指定"
                         },
                     @{
                         @"title":@"UIColor"
                         },
                     @{
                         @"title":@"UIFont"
                         },
                     @{
                         keyTitle : @"UIImage",
                         keyListViewController : @"ListUIImageObjectViewController"
                         },
                     @{
                         @"title":@"UIScreen"
                         },
                     @{
                         @"title":@"UIDevice"
                         },
                     @{
                         @"title":@"UINavigationItem"
                         },
                     @{
                         @"title":@"UIAccelerometer"
                         },
                     @{
                         @"title":@"UIResponder"
                         },
                     @{
                         @"title":@"UIApplication"
                         },
                     @{
                         keyTitle : @"UIViewController",
                         keyListViewController : @"ListUIViewControllerObjectViewController"
                         },
                     @{
                         keyTitle : @"UICollectionViewController",
                         keyListViewController : @"ListUICollectionViewControllerObjectViewController"
                         },
                     @{
                         keyTitle : @"UICollectionView",
                         keyListViewController : @"ListUICollectionViewObjectViewController"
                         },
                     @{
                         keyTitle : @"UICollectionViewCell",
                         keyListViewController : @"ListUICollectionViewCellObjectViewController"
                         },
                     @{
                         @"title":@"UINavigationController"
                         },
                     @{
                         @"title":@"UITabBarController"
                         },
                     @{
                         @"title":@"UIImagePickerController"
                         },
                     @{
                         @"title":@"UIView"
                         },
                     @{
                         @"title":@"UIWindow"
                         },
                     @{
                         @"title":@"UILabel"
                         },
                     @{
                         @"title":@"UIProgressView"
                         },
                     @{
                         @"title":@"UITableViewCell"
                         },
                     @{
                         @"title":@"UIAlertView"
                         },
                     @{
                         @"title":@"UIActionSheet"
                         },
                     @{
                         keyTitle : @"UIImageView",
                         keyListViewController : @"ListUIImageViewObjectViewController"
                         },
                     @{
                         @"title":@"UIWebView"
                         },
                     @{
                         @"title":@"UIActivityIndicatorView"
                         },
                     @{
                         @"title":@"UIPickerView"
                         },
                     @{
                         @"title":@"UISearchBar"
                         },
                     @{
                         @"title":@"UINavigationBar"
                         },
                     @{
                         @"title":@"UIToolbar"
                         },
                     @{
                         @"title":@"UIBarButtonItem"
                         },
                     @{
                         @"title":@"UIControl"
                         },
                     @{
                         @"title":@"UIButton"
                         },
                     @{
                         @"title":@"UITextField"
                         },
                     @{
                         @"title":@"UISwitch"
                         },
                     @{
                         @"title":@"UISegmentedControl"
                         },
                     @{
                         @"title":@"UISlider"
                         },
                     @{
                         @"title":@"UIDatePicker"
                         },
                     @{
                         @"title":@"UIPageControl"
                         },
                     @{
                         keyTitle : @"UIScrollView",
                         keyListViewController : @"ListUIScrollViewObjectViewController",
                         },
                     @{
                         keyTitle : @"UITableView",
                         keyListViewController : @"ListUITableViewObjectViewController",
                         },
                     @{
                         @"title":@"UITextView"
                         },
                     ];
    [self setButtons];
}

@end
