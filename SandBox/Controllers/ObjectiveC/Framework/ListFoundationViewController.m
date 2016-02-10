//
//  ListFoundationViewController.m
//  SandBox
//
//  Created by 大島 曜 on 2015/05/08.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "ListFoundationViewController.h"

@interface ListFoundationViewController ()

@end

@implementation ListFoundationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setListButtons
{
    self.buttons = @[
                     @{
                         @"title":@"NSObject",
                         @"action":@""
                         },
                     
                     @{
                         @"title":@"NSNumber",
                         @"action":@""
                         },
                     @{
                         @"title":@"NSNumberFormatter",
                         @"listViewController:":@"NumberFormatterListViewController"
                         },
                     @{
                         @"title":@"NSString",
                         @"listViewController:":@"ListNSStringObjectViewController"
                         },
                     
                     @{
                         @"title":@"NSArray",
                         @"action":@""
                         },
                     
                     @{
                         @"title":@"NSSet",
                         @"action":@""
                         },
                     
                     @{
                         @"title":@"NSDictionary",
                         @"action":@""
                         },
                     
                     @{
                         @"title":@"NSData",
                         @"action":@""
                         },
                     
                     @{
                         @"title":@"NSURL",
                         @"action":@""
                         },
                     
                     @{
                         @"title":@"NSTimer",
                         @"action":@""
                         },
                     
                     @{
                         @"title":@"NSNotification",
                         @"action":@""
                         },
                     
                     @{
                         @"title":@"NSUserDefaults",
                         @"action":@""
                         },
                     @{
                         @"title":@"NSBundle",
                         @"action":@""
                         },
                     @{
                         @"title":@"NSValue",
                         @"action":@""
                         },
                     @{
                         @"title":@"NSLog",
                         @"action":@""
                         },
                     @{
                         @"title":@"NSFileManager",
                         @"listViewController:":@"ListNSFileManagerObjectViewController"
                         },
                     @{
                         @"title":@"NSURLConnection",
                         @"listViewController:":@"ListNSURLConnectionObjectViewController"
                         },
                     
                     @{@"title":@"関連",@"action":@"dismissCloseButtonAction:"},
                     
                     ];
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
