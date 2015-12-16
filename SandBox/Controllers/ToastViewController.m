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

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!_viewMessage) {
        _viewMessage = [UIView new];
        _viewMessage.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44);
        _viewMessage.backgroundColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.5];
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
    self.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, _viewMessage.frame.size.height);
    self.preferredContentSize = self.view.frame.size;
    _labelMessage.text = _message;
    NSLog(@"ToastViewController start %@",_labelMessage.text);
    self.startHandler();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    CGRect rectViewMessage = _viewMessage.frame;
    rectViewMessage.origin.y = -_viewMessage.frame.size.height;
    _viewMessage.frame = rectViewMessage;
}

- (void)viewDidAppear:(BOOL)animated {
    //アニメーション
    [UIView animateWithDuration:0.5f animations:^{
        CGRect rectViewMessage = _viewMessage.frame;
        rectViewMessage.origin.y = 0;
        _viewMessage.frame = rectViewMessage;
    }completion:^(BOOL finished){
        //タイマー発動
        timer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(actionClose) userInfo:nil repeats:NO];
    }];
}

- (void)dealloc {
    NSLog(@"ToastViewController end%@",_labelMessage.text);
    self.endHandler();
}

- (void)viewWillDisappear:(BOOL)animated {
    //タイマー停止
    [timer invalidate];
}

//トースト閉じる
- (void)actionClose {
    //アニメーション
    [UIView animateWithDuration:0.5f animations:^{
        CGRect rectViewMessage = _viewMessage.frame;
        rectViewMessage.origin.y = -_viewMessage.frame.size.height;
        _viewMessage.frame = rectViewMessage;
    }completion:^(BOOL finished){
        //画面閉じる
        if (self.presentingViewController) {
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            [UtilsViewController hideContentViewController:self];
        }
    }];
}

- (IBAction)clickView:(id)sender {
    //タイマー停止
    [timer invalidate];
    //トースト閉じる
    [self actionClose];
}


@end
