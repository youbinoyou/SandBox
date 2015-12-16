//
//  AdScreenViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/12/16.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import "AdScreenViewController.h"
#import "UtilsViewController.h"
#import "ViewController.h"

@interface AdScreenViewController ()

@property (nonatomic,assign) NSTimeInterval delayTimeInterval;
@property (nonatomic,assign) NSTimeInterval adTimeInterval;
@property (nonatomic,assign) NSTimeInterval delayAnimation;

@end

@implementation AdScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _delayTimeInterval = 3.0;
    _adTimeInterval = 3.0;
    _delayAnimation = 1.5;
    // Do any additional setup after loading the view.
    [self performSelector:@selector(nextViewController) withObject:nil afterDelay:_delayTimeInterval];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)nextViewController {
    UIViewController *nextViewController = [UtilsViewController getTransitionModalViewController:@"Main"
                                                                        withStortboardIdentifier:@"ViewController"];

    UIViewController *nowViewController = self.parentViewController;
    if (!nowViewController) {
        nowViewController = self;
        NSLog(@"next : %@",nextViewController);
        NSLog(@"parent : %@",nowViewController);
    }
    [UtilsViewController transformNextViewControllerToNowViewController : nowViewController
                                                     nowDisplayDuration : _adTimeInterval
                                                     nextViewController : nextViewController
                                                    nextDisplayDuration : _delayTimeInterval
                                                            actionStart : ^(void){
                                                                //[UtilsViewController showToastMessage:@"開始"];
                                                            }
                                                           actionMiddle : ^(void){
                                                               //[UtilsViewController showToastMessage:@"中間処理"];
                                                           }
                                                           actionFinish : ^(void){
                                                               //[UtilsViewController showToastMessage:@"終了"];
                                                           }];
}

@end
