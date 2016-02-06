//
//  NumberFormatterListViewController.m
//  SandBox
//
//  Created by YouOhshima on 2015/05/20.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "NumberFormatterListViewController.h"

@interface NumberFormatterListViewController ()

@end

@implementation NumberFormatterListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setListButtons];
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

- (void)setListButtons {
    self.buttons = @[
                     @{@"title":@"文字列を数値に、数値を文字列に変換する",@"action":@"newValue:"},
                     @{@"title":@"数値を３桁ごとカンマ区切り形式で\n文字列に変換する",@"action":@"newNSNumberFormatter:"},
                     @{@"title":@"円周率を取得する",@"action":@"newPI:"},
                     @{@"title":@"ベキ乗を計算する",@"action":@"newPow:"},
                     @{@"title":@"平方根や立方根を計算する",@"action":@"newSqrt:"},
                     @{@"title":@"対数（自然対数・常用対数）を計算する",@"action":@"newExp:"},
                     @{@"title":@"三角関数を計算する",@"action":@"newAngle:"},
                     @{@"title":@"逆三角関数を計算する",@"action":@"newArc:"},
                     @{@"title":@"乱数を発生させる",@"action":@"newRandom:"},
                     @{@"title":@"関連",@"action":@"dismissCloseButtonAction:"},
                     ];
    [self setButtons];
}

- (void)newValue:(id)sender
{
    NSString *str = @"3.141593";
    
    // 文字列をNSIntegerに変換
    NSInteger i = str.integerValue;
    NSLog(@"文字列→NSInteger：%ld", i);
    
    // 文字列をfloatに変換
    float f = str.floatValue;
    NSLog(@"文字列→float：%f", f);
    
    // 文字列をdoubleに変換
    double d = str.doubleValue;
    NSLog(@"文字列→double：%f", d);
    
    
    // NSIntegerを文字列に変換
    NSString *str1 = [NSString stringWithFormat:@"%ld", i];
    NSLog(@"NSInteger→文字列：%@", str1);
    
    // floatを文字列に変換
    NSString *str2 = [NSString stringWithFormat:@"%f", f];
    NSLog(@"float→文字列：%@", str2);
    
    // doubleを文字列に変換
    NSString *str3 = [NSString stringWithFormat:@"%f", d];
    NSLog(@"double→文字列：%@", str3);
}

- (void)newNSNumberFormatter:(id)sender
{
    NSInteger iPadPrice = 40800;
    
    // まずはNSNumberに変換
    NSNumber *priceNumber = [[NSNumber alloc] initWithInteger:iPadPrice];
    
    // 数値を3桁ごとカンマ区切りにするように設定
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setGroupingSeparator:@","];
    [formatter setGroupingSize:3];
    
    // 数値を3桁ごとカンマ区切り形式で文字列に変換する
    NSString *result = [formatter stringFromNumber:priceNumber];
    NSLog(@"%@", result);
}

- (void)newPI:(id)sender
{
    
    double mPI = M_PI; //円周率（π）を求める
    NSLog(@"%.3f 円周率（π）を求める",mPI);
    
    double mPI2 = M_PI_2;	//π / 2 を求める
    NSLog(@"%.3f π / 2 を求める",mPI2);

    double mPI4 = M_PI_4;	//π / 4 を求める
    NSLog(@"%.3f π / 4 を求める",mPI4);
    
    double m1PI = M_1_PI;	//1 / π を求める
    NSLog(@"%.3f 1 / π を求める",m1PI);

    double m2PI = M_2_PI;	//2 / π を求める
    NSLog(@"%.3f 2 / π を求める",m2PI);

    double m2SQRTPI = M_2_SQRTPI;	//2 / sqrt(π) を求める
    NSLog(@"%.3f 2 / sqrt(π) を求める",m2SQRTPI);
    
    //タンジェントを取得する
    double x = tan(M_PI_4);
    
    // 結果の表示
    NSLog(@"tan(π / 4) = %.5f", x);
}

- (void)newPow:(id)sender
{
    
    // 2の8乗を計算する
    double result = pow(2, 8);
    
    // 結果の表示
    NSLog(@"%.1f", result);
}

- (void)newSqrt:(id)sender
{
    // 平方根を計算する
    double result1 = sqrt(2.0);
    NSLog(@"%.40f", result1);
    
    // 立方根を計算する
    double result2 = cbrt(5.0 * 5.0 * 5.0);
    NSLog(@"%.40f", result2);
}

- (void)newExp:(id)sender
{
    // 指数関数を計算する
    double result = exp(1.0);
    NSLog(@"%1.40f", result);
    
    // ネイピア数を取得する
    NSLog(@"%1.40f", M_E);
}

- (void)newAngle:(id)sender
{
    
    /* サイン (正弦) を取得する */
    double result1 = sin(M_PI / 2.0);
    NSLog(@"sin(π / 2.0) = %.1f", result1);
    
    /* コサイン（余弦）を取得する */
    double result2 = cos(0.0);
    NSLog(@"cos(0.0) = %.1f\n", result2);
    
    /* タンジェント（正接）を取得する */
    double result3 = tan(M_PI / 4.0);
    NSLog(@"tan(π / 4.0) = %.1f\n", result3);
}

- (double)toDegree:(double)rad
{
    return rad * 180.0f / M_PI;
}
- (void)newArc:(id)sender
{
    /* アークサイン (逆正弦) を取得する */
    double rad1 = asin(0.5);
    
    // 度数法に変換する
    double deg1 = [self toDegree:rad1];
    NSLog(@"asin(%.1f) = %.2f度", 0.5, deg1);
    
    /* アークコサイン（逆余弦）を取得する */
    double rad2 = acos(0.5);
    
    // 度数法に変換する
    double deg2 = [self toDegree:rad2];
    NSLog(@"acos(%.1f) = %.2f度\n", 0.5, deg2);
    
    /* アークタンジェント（逆正接）を取得する */
    double rad3 = atan(1.0);
    
    // 度数法に変換する
    double deg3 = [self toDegree:rad3];
    NSLog(@"atan(%.1f) = %.2f度\n", 1.0, deg3);
    
}

- (void)newRandom:(id)sender
{
    int i, n;
    
    /* rand()を使う場合 */
    
    // 乱数のシードを与える
    srand((unsigned)time(NULL));
    for ( i = 0; i <= 4; i++ ) {
        // 1から100までの乱数を発生させる */
        n = random() % 100 + 1;
        NSLog(@"%2d回目 = %2d", i + 1, n);
    }
    
    NSLog(@"\n");
    
    /* arc4random()を使う場合 */
    for ( i = 0; i <= 4; i++ ) {
        // 1から100までの乱数を発生させる */
        n = arc4random() % 100 + 1;
        NSLog(@"%2d回目 = %2d", i + 1, n);
    }

    /* arc4random_uniformを使う場合 */
    for ( i = 0; i <= 4; i++ ) {
        // 1から100までの乱数を発生させる */
        n = arc4random_uniform(100) + 1;
        NSLog(@"%2d回目 = %2d", i + 1, n);
    }

}
@end
