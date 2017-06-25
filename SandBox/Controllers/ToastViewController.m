//
//  ToastViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/12/16.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import "ToastViewController.h"
#import "UtilsViewController.h"

@interface ToastViewController ()

@end

@implementation ToastViewController

- (id)init
{
    self = [super init];
    if (self) {
        // 遅延時間
        _duration = 0.5;
        _displayDuration = 2.0;
        _animationType = ToastViewControllerAnimationTypeTop;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 初回ポジション
    switch (_animationType) {
        case ToastViewControllerAnimationTypeTop:{
            [self toastTypeTopPosition];
        }
            break;
        case ToastViewControllerAnimationTypeCenter:{
            [self toastTypeCenterPosition];
        }
            break;
        case ToastViewControllerAnimationTypeBottom:{
            [self toastTypeBottomPosition];
            break;
        }
        default:
            break;
    }
    _labelMessage.text = _message;
    NSLog(@"ToastViewController start %@",_labelMessage.text);
    if (_startHandler) {
        _startHandler(self);
        [self.delegate toast:self openHandler:_startHandler];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // 始まりのアニメーション
    switch (_animationType) {
        case ToastViewControllerAnimationTypeTop : {
            [self openAnimationTypeTop];
            break;
        }
        case ToastViewControllerAnimationTypeCenter : {
            [self openAnimationTypeCenter];
            break;
        }
        case ToastViewControllerAnimationTypeBottom : {
            [self openAnimationTypeBottom];
            break;
        }
        default:
            break;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //タイマー停止
    [timer invalidate];
}

- (IBAction)clickToastView:(id)sender
{
    NSLog(@"強制クローズ");
    if (_doneHandler) {
        _doneHandler(self);
        [self.delegate toast:self stopHandler:_doneHandler];
    }
    //タイマー停止
    [timer invalidate];
    _duration = 0.5;
    //トースト閉じる
    [self toastClose:sender];
}


//トースト閉じる
- (void)toastClose:(id)sender
{
    NSLog(@"sender : %@",sender);
    // 終わりのアニメーション
    switch (_animationType) {
        case ToastViewControllerAnimationTypeTop : {
            [self closeAnimationTypeTop];
            break;
        }
        case ToastViewControllerAnimationTypeCenter : {
            [self closeAnimationTypeCenter];
            break;
        }
        case ToastViewControllerAnimationTypeBottom : {
            [self closeAnimationTypeBottom];
            break;
        }
        case ToastViewControllerAnimationTypeRandom : {
            _animationType = (arc4random_uniform(3) + 1);
            [self toastClose:sender];
            break;
        }
        default:
            break;
    }
}

- (void)dealloc
{
    NSLog(@"ToastViewController end%@",_labelMessage.text);
    if (_endHandler) {
        _endHandler(self);
        [self.delegate toast:self closeHandler:_endHandler];
    }
}

#pragma - mark アニメーションタイプ（トップ）

// アニメーショントップ
- (void)toastTypeTopPosition
{
    if (!_viewMessage) {
        _viewMessage = [UIView new];
        _viewMessage.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44);
        _viewMessage.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        [self.view addSubview:_viewMessage];
        CGRect rectViewMessage = _viewMessage.frame;
        rectViewMessage.origin.y = -_viewMessage.frame.size.height;
        _viewMessage.frame = rectViewMessage;
        UITapGestureRecognizer *tapGestureRecognizer = [UITapGestureRecognizer new];
        [tapGestureRecognizer addTarget:self action:@selector(clickToastView:)];
        [_viewMessage addGestureRecognizer:tapGestureRecognizer];
    }
    if (!_labelMessage) {
        _labelMessage = [UILabel new];
        _labelMessage.frame = _viewMessage.bounds;
        _labelMessage.textAlignment = NSTextAlignmentCenter;
        _labelMessage.font = [UIFont boldSystemFontOfSize:18.0];
        _labelMessage.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
        _labelMessage.backgroundColor = [UIColor clearColor];
        [_viewMessage addSubview:_labelMessage];
    }
    // Do any additional setup after loading the view.
    self.view.frame = CGRectMake(0,
                                 0,
                                 [UIScreen mainScreen].bounds.size.width,
                                 _viewMessage.frame.size.height);
    self.preferredContentSize = self.view.frame.size;
}

- (void)openAnimationTypeTop
{
    [UIView animateWithDuration:_duration animations:^{
        CGRect rectViewMessage = _viewMessage.frame;
        rectViewMessage.origin.y = 0;
        _viewMessage.frame = rectViewMessage;
        _viewMessage.alpha = 1.0;
    }completion:^(BOOL finished){
        if (finished) {
            //タイマー発動
            timer = [NSTimer scheduledTimerWithTimeInterval : _displayDuration
                                                     target : self
                                                   selector : @selector(toastClose:)
                                                   userInfo : nil
                                                    repeats : NO];
        }
    }];
}

- (void)closeAnimationTypeTop
{
    //アニメーション
    [UIView animateWithDuration:_duration animations:^{
        CGRect rectViewMessage = _viewMessage.frame;
        rectViewMessage.origin.y = -_viewMessage.frame.size.height;
        _viewMessage.frame = rectViewMessage;
    }completion:^(BOOL finished){
        if (finished) {
            //画面閉じる
            if (self.presentingViewController) {
                [self dismissViewControllerAnimated:YES completion:nil];
                _viewMessage.alpha = 0.0;
            } else {
                _viewMessage.alpha = 0.0;
                [UtilsViewController hideContentViewController:self];
            }
        }
    }];
}

#pragma - mark アニメーションタイプ（センター）

// アニメーションセンター
- (void)toastTypeCenterPosition
{
    if (!_viewMessage) {
        _viewMessage = [UIView new];
        //ボーダー
        _viewMessage.layer.borderWidth = 1;
        _viewMessage.layer.borderColor = [UIColor blackColor].CGColor;
        // 角丸
        _viewMessage.layer.cornerRadius = 6;
        
        _viewMessage.alpha = 0;
        _viewMessage.frame = CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 20, 30);
        _viewMessage.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        [self.view addSubview:_viewMessage];
        
        //_viewMessage.center = self.view.center;
        
        UITapGestureRecognizer *tapGestureRecognizer = [UITapGestureRecognizer new];
        [tapGestureRecognizer addTarget:self action:@selector(clickToastView:)];
        [_viewMessage addGestureRecognizer:tapGestureRecognizer];
    }
    if (!_labelMessage) {
        _labelMessage = [UILabel new];
        _labelMessage.frame = _viewMessage.bounds;
        _labelMessage.textAlignment = NSTextAlignmentCenter;
        _labelMessage.font = [UIFont boldSystemFontOfSize:14.0];
        _labelMessage.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
        _labelMessage.backgroundColor = [UIColor clearColor];
        [_viewMessage addSubview:_labelMessage];
    }
    // Do any additional setup after loading the view.
    self.view.frame = CGRectMake(0,
                                 0,
                                 [UIScreen mainScreen].bounds.size.width,
                                 _viewMessage.frame.size.height);
    self.view.center = self.parentViewController.view.center;
    self.preferredContentSize = self.view.frame.size;
}

- (void)openAnimationTypeCenter
{
    [UIView animateWithDuration:_duration animations:^{
        //CGRect rectViewMessage = _viewMessage.frame;
        //rectViewMessage.origin.y = 0;
        //_viewMessage.frame = rectViewMessage;
        _viewMessage.alpha = 1.0;
    }completion:^(BOOL finished){
        if (finished) {
            _viewMessage.alpha = 1.0;
            //タイマー発動
            timer = [NSTimer scheduledTimerWithTimeInterval : _displayDuration
                                                     target : self
                                                   selector : @selector(toastClose:)
                                                   userInfo : nil
                                                    repeats : NO];
        }
    }];
}

- (void)closeAnimationTypeCenter
{
    //アニメーション
    [UIView animateWithDuration:_duration animations:^{
//        CGRect rectViewMessage = _viewMessage.frame;
//        rectViewMessage.origin.y = -_viewMessage.frame.size.height;
        //        _viewMessage.frame = rectViewMessage;
        _viewMessage.alpha = 0.0;
    }completion:^(BOOL finished){
        if (finished) {
            //画面閉じる
            if (self.presentingViewController) {
                [self dismissViewControllerAnimated:YES completion:nil];
                _viewMessage.alpha = 0.0;
            } else {
                _viewMessage.alpha = 0.0;
                [UtilsViewController hideContentViewController:self];
            }
        }
    }];
    
}

#pragma - mark アニメーションタイプ（ボトム）

// アニメーショントップ
- (void)toastTypeBottomPosition
{
    if (!_viewMessage) {
        _viewMessage = [UIView new];
        _viewMessage.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44);
        _viewMessage.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        [self.view addSubview:_viewMessage];
        CGRect rectViewMessage = _viewMessage.frame;
        rectViewMessage.origin.y = _viewMessage.frame.size.height;
        _viewMessage.frame = rectViewMessage;
        UITapGestureRecognizer *tapGestureRecognizer = [UITapGestureRecognizer new];
        [tapGestureRecognizer addTarget:self action:@selector(clickToastView:)];
        [_viewMessage addGestureRecognizer:tapGestureRecognizer];
    }
    if (!_labelMessage) {
        _labelMessage = [UILabel new];
        _labelMessage.frame = _viewMessage.bounds;
        _labelMessage.textAlignment = NSTextAlignmentCenter;
        _labelMessage.font = [UIFont boldSystemFontOfSize:18.0];
        _labelMessage.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
        _labelMessage.backgroundColor = [UIColor clearColor];
        [_viewMessage addSubview:_labelMessage];
    }
    // Do any additional setup after loading the view.
    self.view.frame = CGRectMake(0,
                                 [UIScreen mainScreen].bounds.size.height - _viewMessage.frame.size.height,
                                 [UIScreen mainScreen].bounds.size.width,
                                 _viewMessage.frame.size.height);
    self.preferredContentSize = self.view.frame.size;
}

- (void)openAnimationTypeBottom
{
    [UIView animateWithDuration:_duration animations : ^(void) {
        CGRect rectViewMessage = _viewMessage.frame;
        rectViewMessage.origin.y = 0;
        _viewMessage.frame = rectViewMessage;
        _viewMessage.alpha = 1.0;
    } completion : ^(BOOL finished) {
        if (finished) {
            //タイマー発動
            timer = [NSTimer scheduledTimerWithTimeInterval : _displayDuration
                                                     target : self
                                                   selector : @selector(toastClose:)
                                                   userInfo : nil
                                                    repeats : NO];
        }
    }];
}

- (void)closeAnimationTypeBottom
{
    //アニメーション
    [UIView animateWithDuration : _duration animations : ^(void) {
        CGRect rectViewMessage = _viewMessage.frame;
        rectViewMessage.origin.y = _viewMessage.frame.size.height;
        _viewMessage.frame = rectViewMessage;
    } completion : ^(BOOL finished){
        if (finished) {
            //画面閉じる
            if (self.presentingViewController) {
                [self dismissViewControllerAnimated:YES completion:nil];
                _viewMessage.alpha = 0.0;
            } else {
                _viewMessage.alpha = 0.0;
                [UtilsViewController hideContentViewController:self];
            }
        }
    }];

}

@end
