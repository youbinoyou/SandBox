//
//  AlertViewController.m
//  SandBox
//
//  Created by YouOhshima on 2015/05/18.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "AlertViewController.h"
#import <QuartzCore/QuartzCore.h>

/**
 * Alertで使うUIButtonクラス
 */
@interface AlertButton : UIButton

@end

@implementation AlertButton

/**
 * UIButtonの初期化
 * @param NSCoder Object
 * @return id Object
 */
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.backgroundColor = [UIColor colorWithRed:1.0 green:0.4 blue:0 alpha:0.9];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:[UIFont buttonFontSize]];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.layer.cornerRadius = 8.0f;
        self.clipsToBounds = YES;
        
        UIButton *button = self;
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = CGRectMake(0, 0, 364, 44);
        gradientLayer.locations = [NSArray arrayWithObjects:
                                   [NSNumber numberWithFloat:0.0],
                                   [NSNumber numberWithFloat:0.3],
                                   [NSNumber numberWithFloat:0.5],
                                   [NSNumber numberWithFloat:1.0],
                                   nil];
        gradientLayer.colors =
        [NSArray arrayWithObjects:
         (id)[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8].CGColor,
         (id)[UIColor colorWithRed:0.8 green:0.5 blue:0.0 alpha:0.7].CGColor,
         (id)[UIColor colorWithRed:0.5 green:0.3 blue:0.0 alpha:0.5].CGColor,
         (id)[UIColor colorWithRed:0.3 green:0.0 blue:0.0 alpha:0.3].CGColor,
         nil];
        gradientLayer.cornerRadius  = 8.0f;
        [button.layer insertSublayer:gradientLayer atIndex:0];
    }
    return self;
}

@end

/**
 * Alertで使うMessageLabelクラス
 */
@interface AlertMessageLabel : UILabel

@end

@implementation AlertMessageLabel

/**
 * MessageLabelの初期化
 * @param NSCoder Object
 * @return id Object
 */
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.font = [UIFont systemFontOfSize:[UIFont buttonFontSize]];
        self.layer.borderColor = [UIColor blackColor].CGColor;  //ボーダー色（黒）
        self.layer.borderWidth = 1.0;  //ボーダー幅（２ピクセル）
        
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect
{
    UIEdgeInsets insets = {0, 10, 0, 10};
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end




/**
 * Alertで使うUIButtonクラス
 */
@interface Alert2Button : UIButton

@end

@implementation Alert2Button

/**
 * UIButtonの初期化
 * @param NSCoder Object
 * @return id Object
 */
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        UIButton *button = self;
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = CGRectMake(0, 0, 140, 44);
        gradientLayer.locations = [NSArray arrayWithObjects:
                                   [NSNumber numberWithFloat:0.0],
                                   [NSNumber numberWithFloat:0.3],
                                   [NSNumber numberWithFloat:0.5],
                                   [NSNumber numberWithFloat:1.0],
                                   nil];
        gradientLayer.colors =
        [NSArray arrayWithObjects:
         (id)[UIColor colorWithRed:1 green:1 blue:1 alpha:0.8].CGColor,
         (id)[UIColor colorWithRed:1 green:1 blue:1 alpha:0.7].CGColor,
         (id)[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5].CGColor,
         (id)[UIColor colorWithRed:0.8 green:0.8 blue:1 alpha:0.3].CGColor,
         nil];
        gradientLayer.cornerRadius = 20.0f;
        [button.layer addSublayer:gradientLayer];

        self.layer.cornerRadius = 20.0f;
        self.clipsToBounds = YES;
        // aViewは、UIView型のインスタンス
        // 領域外をマスクで切り取る設定をしない
        self.layer.masksToBounds = NO;
        // 影のかかる方向を指定する
        self.layer.shadowOffset = CGSizeMake(2.0f, 2.0f);
        // 影の透明度
        self.layer.shadowOpacity = 0.7f;
        // 影の色
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        // ぼかしの量
        self.layer.shadowRadius = 2.0f;
            }
    

    return self;
}

@end


@interface AlertViewController ()

@end

@implementation AlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.messageLabel.text = @"ほげほげほげほげほげ\nほげほげほげほげほげ\nほげほげほげほげほげ\nほげほげほげほげほげ";
    self.title = @"ほげほげ";
    //self.alertNavigationBar.layer.cornerRadius = 20.0f;
    self.alertView.layer.cornerRadius = 20.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setTitle:(NSString *)title {
    self.alertNavigationItem.title = title;
}
- (IBAction)buttonAction:(id)sender {
    NSLog(@"%@",@"ホゲホゲ");
    //[self dismissViewControllerAnimated:YES completion:^(void){}];
    [self closeAlertView:sender];
}

- (IBAction)button1Action:(id)sender {
    NSLog(@"%@",@"ホゲホゲ１");
    //[self dismissViewControllerAnimated:YES completion:^(void){}];
    [self closeAlertView:sender];
}
- (IBAction)button2Action:(id)sender {
    NSLog(@"%@",@"ホゲホゲ２");
    //[self dismissViewControllerAnimated:YES completion:^(void){}];
    [self closeAlertView:sender];
}

- (IBAction)closeButtonAction:(id)sender {
    [self closeAlertView:sender];
}

// 空の領域にある透明なボタンがタップされたときに呼び出されるメソッド
- (void)closeAlertView:(id)sender {
    // AlertViewを閉じるための処理を呼び出す
    if ([self.delegate respondsToSelector:@selector(closeAlertView:)]) {
        [self.delegate closeAlertView:self];
    } else {
        @throw [NSException exceptionWithName:@"Not Delegate Exception" reason:@"" userInfo:nil];
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


- (void)dealloc
{
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

@end
