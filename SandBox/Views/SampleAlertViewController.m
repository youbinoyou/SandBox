//
//  SampleAlertViewController.m
//  SandBox
//
//  Created by YouOhshima on 2015/05/19.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "SampleAlertViewController.h"


/**
 * SapleAlertで使うUIViewクラス
 */
@interface SampleAlertView : UIView

@property (weak, nonatomic) IBOutlet UINavigationBar *sampleAlertNavigationBar;
@property (weak, nonatomic) IBOutlet UIView *sampleMessageView;
@property (weak, nonatomic) IBOutlet UILabel *sampleMessageLabel;
@property (weak, nonatomic) IBOutlet UIButton *sampleAlertButton;

@end

@implementation SampleAlertView

/**
 * UIButtonの初期化
 * @param NSCoder Object
 * @return id Object
 */
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
    }
    return self;
}

@end

@interface SampleAlertViewController ()

@property (nonatomic,retain) UIWindow *mainWindow;

@end

@implementation SampleAlertViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

+ (id)loadFromNib
{
    NSString *nibName = @"SampleAlertView";
    UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
    NSLog(@"%@",nib);
    return [nib instantiateWithOwner:nil options:nil][0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // AlertViewをサブビューとして表示する
    // 表示するときはアニメーションをつけて下から上にゆっくり表示させる
    
    // アニメーション完了時のPickerViewの位置を計算
    UIView *alertView = self.view;
    CGPoint middleCenter = alertView.center;
    
    // アニメーション開始時のPickerViewの位置を計算
    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
    //mainWindow.windowLevel = UIWindowLevelAlert;
    [mainWindow addSubview:alertView];
    UIView *setView = [SampleAlertViewController loadFromNib];
    [alertView addSubview:setView];
    setView.center = alertView.center;
    alertView.alpha = 0.0f;
    
    // アニメーションを使ってPickerViewをアニメーション完了時の位置に表示されるようにする
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    alertView.alpha = 1.0f;
    alertView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    alertView.center = middleCenter;
    [UIView commitAnimations];
    

    return;
    // Do any additional setup after loading the view.

//    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    window.alpha = 0.0;
//    window.transform = CGAffineTransformMakeScale(1.1, 1.1);
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SampleAlert" bundle:nil];
//    window.rootViewController = [storyboard instantiateInitialViewController];
//    window.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
//    window.windowLevel = UIWindowLevelAlert;
//    
//    [window makeKeyAndVisible];
//    
////    // ウィンドウのオーナーとしてアプリ自身に括りつけとく
//    
//    [UIView transitionWithView:window duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve|UIViewAnimationOptionCurveEaseInOut animations:^{
//        window.alpha = 1.0;
//        window.transform = CGAffineTransformIdentity;
//    } completion:^(BOOL finished) {
//    }];
    
    
    // PickerViewをサブビューとして表示する
    // 表示するときはアニメーションをつけて下から上にゆっくり表示させる
    
    // アニメーション完了時のPickerViewの位置を計算
    //UIView *pickerView = self.view;
    //CGPoint middleCenter = pickerView.center;
    
    // アニメーション開始時のPickerViewの位置を計算
    //self.mainWindow = [[UIApplication sharedApplication] keyWindow];
    //UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SampleAlert" bundle:nil];
    //self.mainWindow.rootViewController = [storyboard instantiateInitialViewController];
    //self.mainWindow.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
//    CGSize offSize = [UIScreen mainScreen].bounds.size;
//    CGPoint offScreenCenter = CGPointMake(offSize.width / 2.0, offSize.height * 1.5);
//    pickerView.center = offScreenCenter;
    //self.mainWindow.windowLevel = UIWindowLevelAlert;
    //[self.mainWindow makeKeyAndVisible];
    //[self.mainWindow addSubview:pickerView];
    
    // アニメーションを使ってPickerViewをアニメーション完了時の位置に表示されるようにする
    //[UIView beginAnimations:nil context:nil];
    //[UIView setAnimationDuration:0.5];
    //pickerView.center = middleCenter;
    //[UIView commitAnimations];
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


/**
 * アラート以外の部分のタッチの処理
 */
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self closeAction:nil];
}

/**
 * アラートを閉じる
 */
- (void)closeAction:(id)sender {
    [self.delegate closeAlertView:self];
    return;
//    // PickerViewをアニメーションを使ってゆっくり非表示にする
//    UIView *pickerView = self.view;
//    
//    // アニメーション完了時のPickerViewの位置を計算
//    CGSize offSize = [UIScreen mainScreen].bounds.size;
//    CGPoint offScreenCenter = CGPointMake(offSize.width / 2.0, offSize.height * 1.5);
//    
//    [UIView beginAnimations:nil context:(void *)pickerView];
//    [UIView setAnimationDuration:0.3];
//    [UIView setAnimationDelegate:self];
//    // アニメーション終了時に呼び出す処理を設定
//    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
//    pickerView.center = offScreenCenter;
//    [UIView commitAnimations];
    
}
// 単位のPickerViewを閉じるアニメーションが終了したときに呼び出されるメソッド
- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    // PickerViewをサブビューから削除
    UIView *pickerView = (__bridge UIView *)context;
    [pickerView removeFromSuperview];
    [self dismissViewControllerAnimated:YES completion:^(void){
//        NSLog(@"%@",[UIApplication sharedApplication].windows);
        //UIWindow* mainWindow = [UIApplication sharedApplication].windows.lastObject;
//        
//        NSLog(@"%@",[UIApplication sharedApplication].windows);
        //[[[UIApplication sharedApplication] keyWindow] makeKeyAndVisible];
        //[mainWindow.rootViewController.view removeFromSuperview];
//        mainWindow.rootViewController = nil;
//        self.mainWindow.frame = CGRectZero;
//        self.mainWindow = nil;
    }];
    
}

- (void)dealloc
{
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

@end
