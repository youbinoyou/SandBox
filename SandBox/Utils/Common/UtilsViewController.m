//
//  UtilsViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/12/16.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import "UtilsViewController.h"
#import "ToastViewController.h"

@interface UtilsViewController ()

@end

@implementation UtilsViewController

/**
 * Modal用の画面遷移コントローラー取得
 *
 * @param stortboardName StoryBoardのファイル名
 * @param stortboardIdentifier StoryBoardのID
 * @return UIViewControllerのオブジェクト
 */
+ (id)getTransitionModalViewController:(NSString *)stortboardName
              withStortboardIdentifier:(NSString *)stortboardIdentifier
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:stortboardName bundle:nil];
    if (!stortboardIdentifier) {
        return [storyboard instantiateInitialViewController];
    }
    id viewController = [storyboard instantiateViewControllerWithIdentifier:stortboardIdentifier];
    return viewController;
}

#pragma mark - UIViewControllerの画面遷移処理

// 指定したViewControllerを追加
+ (void)displayContentViewController:(UIViewController *)contentViewController
                parentViewController:(UIViewController *)parentViewController
{
    // 自身のビューコントローラ階層に追加
    // 自動的に子ViewControllerの`willMoveToParentViewController:`メソッドが呼ばれる
    [parentViewController addChildViewController:contentViewController];
    
    // 子ViewControllerのviewを、自身のview階層に追加
    [parentViewController.view addSubview:contentViewController.view];
    
    // 子ViewControllerに追加されたことを通知
    [contentViewController didMoveToParentViewController:parentViewController];
}

// 指定したViewControllerを削除
+ (void)hideContentViewController:(UIViewController *)contentViewController
{
    // これから取り除かれようとしていることを通知する
    [contentViewController willMoveToParentViewController:nil];
    
    // 子ViewControllerの`view`を取り除く
    [contentViewController.view removeFromSuperview];
    
    // 子ViewControllerを取り除く
    // 自動的に`didMoveToParentViewController:`が呼ばれる
    [contentViewController removeFromParentViewController];
}

#pragma mark - UIViewControllerのA画面toB画面遷移処理

/**
 * 画面遷移用
 * @param nowViewController 今表示しているビューコントローラ
 * @param nowDisplayDuration 今表示しているビューコントローラの表示時間
 * @param nextViewController 次表示するビューコントローラ
 * @param nextDisplayDuration 次表示するビューコントローラのまでの遅延時間
 */
+ (void)transformNextViewControllerToNowViewController : (UIViewController *)nowViewController
                                    nowDisplayDuration : (NSTimeInterval )nowDisplayDuration
                                    nextViewController : (UIViewController *)nextViewController
                                   nextDisplayDuration : (NSTimeInterval )nextDisplayDuration
                                           actionStart : (void (^)())actionStart
                                          actionMiddle : (void (^)())actionMiddle
                                          actionFinish : (void (^)())actionFinish
{
    // 自身のビューコントローラ階層に追加
    // 自動的に子ViewControllerの`willMoveToParentViewController:`メソッドが呼ばれる
    [nowViewController addChildViewController:nextViewController];
    nextViewController.view.alpha = 0.0;
    actionStart();
    [UIView animateWithDuration:nowDisplayDuration animations:^(void){
        for (UIView *view in nowViewController.view.subviews) {
            view.alpha = 0.0;
        }
    } completion:^(BOOL finished) {
        actionMiddle();
        [UIView animateWithDuration:nextDisplayDuration animations:^(void){
            // 子ViewControllerのviewを、自身のview階層に追加
            [nowViewController.view addSubview:nextViewController.view];
            nextViewController.view.alpha = 1.0;
        } completion:^(BOOL finished) {
            // 子ViewControllerに追加されたことを通知
            [nextViewController didMoveToParentViewController:nowViewController];
            actionFinish();
        }];
    }];
    
}

//non action
+ (void)transformNextViewControllerToNowViewController : (UIViewController *)nowViewController
                                    nowDisplayDuration : (NSTimeInterval )nowDisplayDuration
                                    nextViewController : (UIViewController *)nextViewController
                                   nextDisplayDuration : (NSTimeInterval )nextDisplayDuration {
    [self transformNextViewControllerToNowViewController : nowViewController
                                      nowDisplayDuration : nowDisplayDuration
                                      nextViewController : nextViewController
                                     nextDisplayDuration : nextDisplayDuration
                                             actionStart : nil
                                            actionMiddle : nil
                                            actionFinish : nil];
}

//start end action
+ (void)transformNextViewControllerToNowViewController : (UIViewController *)nowViewController
                                    nowDisplayDuration : (NSTimeInterval )nowDisplayDuration
                                    nextViewController : (UIViewController *)nextViewController
                                   nextDisplayDuration : (NSTimeInterval )nextDisplayDuration
                                           actionStart : (void (^)())actionStart
                                          actionFinish : (void (^)())actionFinish {
    [self transformNextViewControllerToNowViewController : nowViewController
                                      nowDisplayDuration : nowDisplayDuration
                                      nextViewController : nextViewController
                                     nextDisplayDuration : nextDisplayDuration
                                             actionStart : actionStart
                                            actionMiddle : nil
                                            actionFinish : actionFinish];
}

//start action
+ (void)transformNextViewControllerToNowViewController : (UIViewController *)nowViewController
                                    nowDisplayDuration : (NSTimeInterval )nowDisplayDuration
                                    nextViewController : (UIViewController *)nextViewController
                                   nextDisplayDuration : (NSTimeInterval )nextDisplayDuration
                                           actionStart : (void (^)())actionStart {
    [self transformNextViewControllerToNowViewController : nowViewController
                                      nowDisplayDuration : nowDisplayDuration
                                      nextViewController : nextViewController
                                     nextDisplayDuration : nextDisplayDuration
                                             actionStart : actionStart
                                            actionFinish : nil];
}

//middle action
+ (void)transformNextViewControllerToNowViewController : (UIViewController *)nowViewController
                                    nowDisplayDuration : (NSTimeInterval )nowDisplayDuration
                                    nextViewController : (UIViewController *)nextViewController
                                   nextDisplayDuration : (NSTimeInterval )nextDisplayDuration
                                          actionMiddle : (void (^)())actionMiddle {
    [self transformNextViewControllerToNowViewController : nowViewController
                                      nowDisplayDuration : nowDisplayDuration
                                      nextViewController : nextViewController
                                     nextDisplayDuration : nextDisplayDuration
                                             actionStart : nil
                                            actionMiddle : actionMiddle
                                            actionFinish : nil];
}

//end action
+ (void)transformNextViewControllerToNowViewController : (UIViewController *)nowViewController
                                    nowDisplayDuration : (NSTimeInterval )nowDisplayDuration
                                    nextViewController : (UIViewController *)nextViewController
                                   nextDisplayDuration : (NSTimeInterval )nextDisplayDuration
                                          actionFinish : (void (^)())actionFinish {
    [self transformNextViewControllerToNowViewController : nowViewController
                                      nowDisplayDuration : nowDisplayDuration
                                      nextViewController : nextViewController
                                     nextDisplayDuration : nextDisplayDuration
                                             actionStart : nil
                                            actionFinish : actionFinish];
}

+ (void)transitionFromParentViewController:(UIViewController *)parentViewController
           nowViewController:(UIViewController *)nowViewController
          nextViewController:(UIViewController *)nextViewController
{
    [nowViewController willMoveToParentViewController:nil];
    
    [parentViewController addChildViewController:nextViewController];
    [parentViewController.view addSubview:nextViewController.view];
    
    nextViewController.view.alpha = 0.0f;
    
    [parentViewController transitionFromViewController:nowViewController
                                      toViewController:nextViewController
                                              duration:0.50
                                               options:0
                                            animations:^{
                                                nowViewController.view.alpha = 0.0f;
                                                nextViewController.view.alpha = 1.0f;
                                            }
                                            completion:^(BOOL finished) {
                                                [nowViewController.view removeFromSuperview];
                                                [nowViewController removeFromParentViewController];
                                                [nextViewController didMoveToParentViewController:parentViewController];
                                            }];
}

#pragma mark - トースト画面遷移処理

//トースト画面を表示する。
+ (void)showToastMessage:(NSString*)message {
    [self showToastMessage:message actionStart:nil actionFinish:nil];
}

+ (void)showToastMessage:(NSString*)message
             actionStart:(void (^)())actionStart actionFinish:(void (^)())actionFinish {
    [self showToastMessage:message duration:0.5 displayDuration:2.0
               actionStart:actionStart actionFinish:actionFinish];
}

+ (void)showToastMessage:(NSString*)message duration:(NSTimeInterval)duration
                  displayDuration:(NSTimeInterval)displayDuration
                      actionStart:(void (^)())actionStart actionFinish:(void (^)())actionFinish
{
    [self showToastOnViewController:nil message:message
                           duration:duration displayDuration:displayDuration
                        actionStart:actionStart actionFinish:actionFinish];
}

+ (void)showToastOnViewController:(UIViewController *)viewController
                          message:(NSString*)message
{
    [self showToastOnViewController:viewController message:message
                           duration:0.5 displayDuration:2.0 actionStart:nil actionFinish:nil];
}

+ (void)showToastOnViewController:(UIViewController *)viewController
                          message:(NSString*)message
                      actionStart:(void (^)())actionStart
                     actionFinish:(void (^)())actionFinish
{
    [self showToastOnViewController:viewController message:message
                           duration:0.5 displayDuration:2.0
                        actionStart:actionStart actionFinish:actionFinish];
}

+ (void)showToastOnViewController:(UIViewController *)viewController message:(NSString*)message
                         duration:(NSTimeInterval)duration
                  displayDuration:(NSTimeInterval)displayDuration
             actionStart:(void (^)())actionStart actionFinish:(void (^)())actionFinish {
    ToastViewController *toastViewController = [ToastViewController new];
    if (duration > 1.0) {
        duration = 1.0;
    }
    toastViewController.duration = duration;
    toastViewController.animationType = arc4random_uniform(3) + 1;
    toastViewController.displayDuration = displayDuration;
    toastViewController.message = message;
    toastViewController.startHandler = actionStart;
    toastViewController.endHandler = actionFinish;
    UIViewController *rootViewController;
    //コントローラーを取得
    if (viewController) {
        rootViewController = viewController;
    } else {
       rootViewController = (UIViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    }
    NSLog(@"%@",rootViewController);
    NSLog(@"%@",rootViewController.parentViewController);
    NSLog(@"%@",rootViewController.popoverPresentationController);
    NSLog(@"%@",rootViewController.presentationController);
    NSLog(@"%@",rootViewController.presentedViewController);
    NSLog(@"%@",rootViewController.presentingViewController);
    [UtilsViewController displayContentViewController:toastViewController parentViewController:rootViewController];
}

@end
