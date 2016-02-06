//
//  ListUIViewControllerObjectViewController.m
//  SandBox
//
//  Created by YouOhshima on 2015/04/24.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "ListUIViewControllerObjectViewController.h"

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 100000
#define __IPHONE_TARGET_IOS10 1
#else
#define __IPHONE_TARGET_IOS10 0
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_9_0
#define __IPHONE_TARGET_IOS9 1
#else
#define __IPHONE_TARGET_IOS9 0
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
#define __IPHONE_TARGET_IOS8 1
#else
#define __IPHONE_TARGET_IOS8 0
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_7_0
#define __IPHONE_TARGET_IOS7 1
#else
#define __IPHONE_TARGET_IOS7 0
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_6_0
#define __IPHONE_TARGET_IOS6 1
#else
#define __IPHONE_TARGET_IOS6 0
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_5_0
#define __IPHONE_TARGET_IOS5 1
#else
#define __IPHONE_TARGET_IOS5 0
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_4_0
#define __IPHONE_TARGET_IOS4 1
#else
#define __IPHONE_TARGET_IOS4 0
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_3_0
#define __IPHONE_TARGET_IOS3 1
#else
#define __IPHONE_TARGET_IOS3 0
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_2_0
#define __IPHONE_TARGET_IOS2 1
#else
#define __IPHONE_TARGET_IOS2 0
#endif

@interface ListUIViewControllerObjectViewController ()

@end

@implementation ListUIViewControllerObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setListButtons];
}

- (void)setListButtons {
    self.buttons = @[
                     @{@"title":@"端末の向き",@"action":@"viewSize:"},
                     ];
    [self setButtons];
}

- (void)viewSize:(id)sender{
    NSLog(@"bounds: width = %f, height = %f",
          [UIScreen mainScreen].bounds.size.width,
          [UIScreen mainScreen].bounds.size.height);
    NSLog(@"applicationFrame: width = %f, height = %f",
          [UIScreen mainScreen].applicationFrame.size.width,
          [UIScreen mainScreen].applicationFrame.size.height);
    
}

#if __IPHONE_TARGET_IOS8

- (void)viewWillTransitionToSize:(CGSize)size
       withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    if (size.width <= size.height) {
        // 画面回転後、縦向きになった
        NSLog(@"%@",@"iOS8 画面回転後、縦向きになった");
        [self viewSize:self];
    } else {
        // 画面回転後、横向きになった
        NSLog(@"%@",@"iOS8 画面回転後、横向きになった");
        [self viewSize:self];
    }
}

#else

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                duration:(NSTimeInterval)duration {
    // 画面回転後、縦向きになった
    NSLog(@"%@",@"iOS8 画面回転後、縦向きになった");
    [self viewSize:self];
    // 画面回転前
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    // 画面回転後、横向きになった
    NSLog(@"%@",@"iOS8 画面回転後、横向きになった");
    // 画面回転後
    [self viewSize:self];
}

#endif

@end
