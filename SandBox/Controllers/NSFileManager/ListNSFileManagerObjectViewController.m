//
//  ListNSFileManagerObjectViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/12/09.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import "ListNSFileManagerObjectViewController.h"

@interface ListNSFileManagerObjectViewController ()

@end

@implementation ListNSFileManagerObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setListButtons];
}

- (void)setListButtons {
    self.buttons = @[
                     @{@"title":@"ファイルマネージャー",
                       },
                     @{@"title":@"NSHomeDirectory",@"action":@"showHomeDirectory"},
                     ];
    
    [self setButtons];
}

- (void)showHomeDirectory {
    NSLog(@"%@",NSHomeDirectory());
    
    // file://localhost/Users/idevris/Library/Application Support/iPhone Simulator/6.1/Documents/
    for (NSSearchPathDirectory i = 0; i < 102; i++) {
        NSFileManager *fm = [NSFileManager defaultManager];
        NSArray *urls = [fm URLsForDirectory:i inDomains:NSUserDomainMask];
        NSURL *url = urls.lastObject;
        NSLog(@"%@",url);
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
            break;
        }
    }
    
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
