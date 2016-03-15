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
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (!_viewMessage) {
        _viewMessage = [UIView new];
        _viewMessage.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44);
        _viewMessage.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        [self.view addSubview:_viewMessage];
        UITapGestureRecognizer *tapGestureRecognizer = [UITapGestureRecognizer new];
        [tapGestureRecognizer addTarget:self action:@selector(clickView:)];
        [_viewMessage addGestureRecognizer:tapGestureRecognizer];
    }
    if (!_labelMessage) {
        _labelMessage = [UILabel new];
        _labelMessage.frame = _viewMessage.frame;
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
    CGRect rectViewMessage = _viewMessage.frame;
    rectViewMessage.origin.y = -_viewMessage.frame.size.height;
    _viewMessage.frame = rectViewMessage;
}

- (void)viewDidAppear:(BOOL)animated
{
    //アニメーション
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
                                                   selector : @selector(toastClose)
                                                   userInfo : nil
                                                    repeats : NO];
        }
    }];
}

- (void)viewWillDisappear:(BOOL)animated
{
    //タイマー停止
    [timer invalidate];
}

- (IBAction)clickView:(id)sender
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
    [self toastClose];
}


//トースト閉じる
- (void)toastClose
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

- (void)dealloc
{
    NSLog(@"ToastViewController end%@",_labelMessage.text);
    if (_endHandler) {
        _endHandler(self);
        [self.delegate toast:self closeHandler:_endHandler];
    }
}

@end
