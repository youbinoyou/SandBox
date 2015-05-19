//
//  SliderListViewController.m
//  SandBox
//
//  Created by YouOhshima on 2015/05/19.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "SliderListViewController.h"

@interface SliderListViewController ()

@property (nonatomic,retain) NSArray *buttons;

@end

@implementation SliderListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.buttons = @[
                     @{@"title":@"スライダー",@"action":@"newUISlider:",
                       @"UISlider":@{
                               }
                       },
                     @{@"title":@"カスタムカラースライダー",@"action":@"setCustomColorSlider:"},
                     @{@"title":@"カスタムイラストスライダー",@"action":@"setCustomImageSlider:"},
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
        if (item[@"listViewController:"]) {
            SEL action = NSSelectorFromString(@"listViewController:event:");
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

- (void)setCustomColorSlider:(id)sender
{
    //スライダー初期化
    UISlider *slider = [[UISlider alloc] init];
    slider.frame = CGRectMake(0, 0, 250, 50);
    slider.minimumValue = 0.0;
    slider.maximumValue = 1.0;
    slider.value = 0.5;
    slider.center = self.view.center;
    //slider.backgroundColor = [UIColor orangeColor];
    //スライダーのカラーをカスタマイズ
    slider.thumbTintColor = [UIColor clearColor];
    slider.maximumTrackTintColor = [UIColor lightGrayColor];
    slider.minimumTrackTintColor = [UIColor orangeColor];
    slider.transform = CGAffineTransformMakeScale(1.0f, 10.0f);
    
    //スライダーを画面に追加
    [self.view addSubview:slider];
    
    
    
    slider.layer.cornerRadius = 20.0f;
    slider.clipsToBounds = YES;
    // aViewは、UIView型のインスタンス
    // 領域外をマスクで切り取る設定をしない
    slider.layer.masksToBounds = YES;
    // 影のかかる方向を指定する
    slider.layer.shadowOffset = CGSizeMake(-2.0f, 2.0f);
    // 影の透明度
    slider.layer.shadowOpacity = 0.7f;
    // 影の色
    slider.layer.shadowColor = [UIColor blackColor].CGColor;
    // ぼかしの量
    slider.layer.shadowRadius = 1.0f;
}

- (void)setCustomImageSlider:(id)sender
{
    //スライダー初期化
    UISlider *slider = [[UISlider alloc] init];
    slider.frame = CGRectMake(0, 0, 250, 50);
    slider.minimumValue = 0.0;
    slider.maximumValue = 1.0;
    slider.value = 0.5;
    slider.center = self.view.center;

    //スライダーのデザインをカスタマイズ
    UIImage *imageForThumb = [UIImage imageNamed:@"slider_thumb.png"];
    UIImage *imageMinBase = [UIImage imageNamed:@"slider_left.png"];
    UIImage *imageForMin = [imageMinBase stretchableImageWithLeftCapWidth:4 topCapHeight:0];
    UIImage *imageMaxBase = [UIImage imageNamed:@"slider_right.png"];
    UIImage *imageForMax = [imageMaxBase stretchableImageWithLeftCapWidth:4 topCapHeight:0];
    [slider setThumbImage:imageForThumb forState:UIControlStateNormal];
    [slider setThumbImage:imageForThumb forState:UIControlStateHighlighted];
    [slider setMinimumTrackImage:imageForMin forState:UIControlStateNormal];
    [slider setMaximumTrackImage:imageForMax forState:UIControlStateNormal];
    
    //スライダーを画面に追加
    [self.view addSubview:slider];
}


/**
 * 戻る処理
 */
- (void)dismissCloseButtonAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^(){
        NSLog(@"%@",sender);
    }];
}

- (void)dealloc
{
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
    
}


@end
