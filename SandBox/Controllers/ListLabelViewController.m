//
//  ListLabelViewController.m
//  SandBox
//
//  Created by 大島 曜 on 2015/04/24.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "ListLabelViewController.h"
#import "CustomLabel.h"

@interface ListLabelViewController ()

@property (nonatomic) NSArray *buttons;
@property (nonatomic) CustomLabel *label1;
@property (nonatomic) CustomLabel *label2;
@property (nonatomic) CustomLabel *label3;
@property (nonatomic) CustomLabel *label4;
@property (nonatomic) CustomLabel *label5;

@end

@implementation ListLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.buttons = @[
                     @{@"title":@"ラベル"},
                     @{@"title":@"ラベル（カスタム）"},
                     @{@"title":@"カスタムラベル",@"action":@"newCustomLabel:"},
                     ];
    
    CGRect rectButton = CGRectZero;
    for (NSDictionary *item in self.buttons) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        const CGFloat r = arc4random_uniform(255) / 255.0;
        const CGFloat g = arc4random_uniform(255) / 255.0;
        const CGFloat b = arc4random_uniform(255) / 255.0;
        
        button.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:0.5];
        [button setTitle:item[@"title"] forState:UIControlStateNormal];
        [button sizeToFit];
        button.tag = [self.buttons indexOfObject:item];
        rectButton.origin.x = 20;
        rectButton.size.width  = [UIScreen mainScreen].applicationFrame.size.width - 40;
        rectButton.size.height = [UIScreen mainScreen].applicationFrame.size.height / (self.buttons.count + 2);
        rectButton.origin.y += rectButton.size.height + 1;
        button.frame = rectButton;
        if (item[@"action"]) {
            SEL action = NSSelectorFromString(item[@"action"]);
            if ([self respondsToSelector:action]) {
                [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
            }
        }
        [self.view addSubview:button];
    }
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

- (void)newCustomLabel:(id)sender {
    CGRect customLabelRect = CGRectZero;
    customLabelRect = self.view.frame;
    
    if (!self.label1) {
        self.label1 = [[CustomLabel alloc] init];
        [self.view addSubview:self.label1];
        self.label1.text = @"demonstrate shadow";
        self.label1.textColor = [UIColor whiteColor];
        self.label1.backgroundColor = [UIColor clearColor];
        self.label1.textAlignment = NSTextAlignmentCenter;
        [self.label1 sizeToFit];
        customLabelRect.origin.x = 30;
        customLabelRect.origin.y = 100;
        customLabelRect.size.height = self.label1.frame.size.height*2;
        customLabelRect.size.width = [[UIScreen mainScreen] applicationFrame].size.width - 60;
        self.label1.frame = customLabelRect;
    }
    if (!self.label2) {
        self.label2 = [[CustomLabel alloc] init];
        [self.view addSubview:self.label2];
        self.label2.text = @"demonstrate inner shadow";
        self.label2.textAlignment = NSTextAlignmentCenter;
        self.label2.textColor = [UIColor whiteColor];
        self.label2.backgroundColor = [UIColor clearColor];
        [self.label2 sizeToFit];
        customLabelRect.origin.x = 30;
        customLabelRect.origin.y = 150;
        customLabelRect.size.height = self.label2.frame.size.height*2;
        customLabelRect.size.width = [[UIScreen mainScreen] applicationFrame].size.width - 60;
        self.label2.frame = customLabelRect;
    }
    if (!self.label3) {
        self.label3 = [[CustomLabel alloc] init];
        [self.view addSubview:self.label3];
        self.label3.text = @"demonstrate gradient fill";
        self.label3.textAlignment = NSTextAlignmentCenter;
        self.label3.textColor = [UIColor whiteColor];
        self.label3.backgroundColor = [UIColor clearColor];
        [self.label3 sizeToFit];
        customLabelRect.origin.x = 30;
        customLabelRect.origin.y = 200;
        customLabelRect.size.height = self.label3.frame.size.height*2;
        customLabelRect.size.width = [[UIScreen mainScreen] applicationFrame].size.width - 60;
        self.label3.frame = customLabelRect;
    }
    if (!self.label4) {
        self.label4 = [[CustomLabel alloc] init];
        [self.view addSubview:self.label4];
        self.label4.text = @"demonstrate multi-part gradient";
        self.label4.textAlignment = NSTextAlignmentCenter;
        self.label4.textColor = [UIColor whiteColor];
        self.label4.backgroundColor = [UIColor clearColor];
        [self.label4 sizeToFit];
        customLabelRect.origin.x = 30;
        customLabelRect.origin.y = 250;
        customLabelRect.size.height = self.label4.frame.size.height*2;
        customLabelRect.size.width = [[UIScreen mainScreen] applicationFrame].size.width - 60;
        self.label4.frame = customLabelRect;
    }
    if (!self.label5) {
        self.label5 = [[CustomLabel alloc] init];
        [self.view addSubview:self.label5];
        self.label5.text = @"everything";
        self.label5.textColor = [UIColor whiteColor];
        self.label5.backgroundColor = [UIColor clearColor];
        self.label5.textAlignment = NSTextAlignmentCenter;
        [self.label5 sizeToFit];
        customLabelRect.origin.x = 30;
        customLabelRect.origin.y = 300;
        customLabelRect.size.height = self.label5.frame.size.height*2;
        customLabelRect.size.width = [[UIScreen mainScreen] applicationFrame].size.width - 60;
        self.label5.frame = customLabelRect;
    }
    
    //demonstrate shadow
    self.label1.shadowColor = nil;
    self.label1.shadowOffset = CGSizeMake(0.0f, 2.0f);
    self.label1.shadowColor = [UIColor colorWithWhite:0.0f alpha:0.75f];
    self.label1.shadowBlur = 5.0f;
    
    //demonstrate inner shadow
    self.label2.shadowColor = [UIColor colorWithWhite:1.0f alpha:0.8f];
    self.label2.shadowOffset = CGSizeMake(1.0f, 1.0f);
    self.label2.shadowBlur = 1.0f;
    self.label2.innerShadowBlur = 2.0f;
    self.label2.innerShadowColor = [UIColor colorWithWhite:0.0f alpha:0.8f];
    self.label2.innerShadowOffset = CGSizeMake(1.0f, 1.0f);
    
    //demonstrate gradient fill
    self.label3.gradientStartColor = [UIColor redColor];
    self.label3.gradientEndColor = [UIColor blueColor];

    
    //demonstrate multi-part gradient
    self.label4.gradientStartPoint = CGPointMake(0.0f, 0.0f);
    self.label4.gradientEndPoint = CGPointMake(1.0f, 1.0f);
    self.label4.gradientColors = @[[UIColor redColor],
                                   [UIColor yellowColor],
                                   [UIColor greenColor],
                                   [UIColor cyanColor],
                                   [UIColor blueColor],
                                   [UIColor purpleColor],
                                   [UIColor redColor]];
    
    //everything
    self.label5.shadowColor = [UIColor blackColor];
    self.label5.shadowOffset = CGSizeZero;
    self.label5.shadowBlur = 20.0f;
    self.label5.innerShadowBlur = 2.0f;
    self.label5.innerShadowColor = [UIColor yellowColor];
    self.label5.innerShadowOffset = CGSizeMake(1.0f, 1.0f);
    self.label5.gradientStartColor = [UIColor redColor];
    self.label5.gradientEndColor = [UIColor yellowColor];
    self.label5.gradientStartPoint = CGPointMake(0.0f, 0.5f);
    self.label5.gradientEndPoint = CGPointMake(1.0f, 0.5f);
    self.label5.oversampling = 2;

}

@end
