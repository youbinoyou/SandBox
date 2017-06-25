//
//  ListXCodeErrorViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/12/01.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import "ListXCodeErrorViewController.h"

@interface ListXCodeErrorViewController ()

@end

@implementation ListXCodeErrorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setListButtons];
}

- (void)setListButtons {
    
    self.buttons = @[
                     @{
                         keyTitle : @"Unused variable警告を抑制する",
                         keyLink : @"http://i.devris.info/unused-variable"
                         },
                     @{
                         keyTitle : @"Unused variable警告を抑制する",
                         keyLink : @"http://i.devris.info/unused-variable"
                         },
                     ];
    
    [self setButtons];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// Unused variable警告を抑制する
- (void)unusedVariable {
    // Objective-C
    BOOL success = [self isSomething];
    if (success) {
        __attribute__((unused)) BOOL unusedSuccess = [self isSomething];
    }
}

- (BOOL)isSomething {
    return YES;
}

@end
