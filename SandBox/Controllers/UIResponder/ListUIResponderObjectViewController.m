//
//  ListUIResponderObjectViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/11/11.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "ListUIResponderObjectViewController.h"

@interface ListUIResponderObjectViewController ()

@end

@implementation ListUIResponderObjectViewController

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
                     @{keyTitle : @"iPhoneタッチイベントに反応する設定"},
                     @{
                         keyTitle : @"タッチイベントが始まったときに呼び出されるメソッド",
                         keyAction : @"touchesBegan:withEvent:",
                         },
                     @{
                         keyTitle : @"ドラッグされ手いるときに呼び出されるメソッド",
                         keyAction : @"touchesMoved:withEvent:",
                         },
                     @{
                         keyTitle : @"タッチが終了したときに呼び出されるメソッド",
                         keyAction : @"touchesEnded:withEvent:",
                         },
                     @{
                         keyTitle : @"情報提供元",
                         keyLink : @"http://www.yoheim.net/blog.php?q=20111121",
                         }
                     
                     ];
    [self setButtons];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![touches isKindOfClass:[NSSet class]]) {
        NSLog(@"%@",@"touchesBegan:withEvent:");
        UIView *view = (UIView *)touches;
        NSLog(@"タップ開始 %f, %f  タップ数：%ld", view.frame.origin.x, view.frame.origin.y, (long)view.tag);
        return;
    }
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    NSInteger taps = [touch tapCount];
    
    [super touchesBegan:touches withEvent:event];
    
    NSLog(@"タップ開始 %f, %f  タップ数：%ld", location.x, location.y, (long)taps);
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![touches isKindOfClass:[NSSet class]]) {
        NSLog(@"%@",@"touchesMoved:withEvent:");
        UIView *view = (UIView *)touches;
        NSLog(@"指の動き：%f , %f から %f, %f", view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
        return;
    }
    UITouch *touch = [touches anyObject];
    CGPoint oldLocation = [touch previousLocationInView:self.view];
    CGPoint newLocation = [touch locationInView:self.view];
    
    [super touchesMoved:touches withEvent:event];
    
    NSLog(@"指の動き：%f , %f から %f, %f", oldLocation.x, oldLocation.y, newLocation.x, newLocation.y);
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![touches isKindOfClass:[NSSet class]]) {
        NSLog(@"%@",@"touchesEnded:withEvent:");
        UIView *view = (UIView *)touches;
        NSLog(@"タップ終了 %f, %f  タップ数：%ld", view.frame.origin.x, view.frame.origin.y, (long)view.tag);
        return;
    }
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    
    [super touchesEnded:touches withEvent:event];
    
    NSLog(@"タップ終了 %f, %f", location.x, location.y);
}

@end
