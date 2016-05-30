//
//  UtilsViewController.h
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/12/16.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToastViewController.h"

@interface UtilsViewController : UIViewController

+ (id)getTransitionModalViewController:(NSString *)stortboardName
              withStortboardIdentifier:(NSString *)stortboardIdentifier;


+ (void)displayContentViewController:(UIViewController *)contentViewController
                parentViewController:(UIViewController *)parentViewController;

+ (void)hideContentViewController:(UIViewController *)contentViewController;

+ (void)transformNextViewControllerToNowViewController : (UIViewController *)nowViewController
                                    nowDisplayDuration : (NSTimeInterval )nowDisplayDuration
                                    nextViewController : (UIViewController *)nextViewController
                                   nextDisplayDuration : (NSTimeInterval )nextDisplayDuration;

//start middle end action
+ (void)transformNextViewControllerToNowViewController : (UIViewController *)nowViewController
                                    nowDisplayDuration : (NSTimeInterval )nowDisplayDuration
                                    nextViewController : (UIViewController *)nextViewController
                                   nextDisplayDuration : (NSTimeInterval )nextDisplayDuration
                                           actionStart : (void (^)())actionStart
                                          actionMiddle : (void (^)())actionMiddle
                                          actionFinish : (void (^)())actionFinish;

//start end action
+ (void)transformNextViewControllerToNowViewController : (UIViewController *)nowViewController
                                    nowDisplayDuration : (NSTimeInterval )nowDisplayDuration
                                    nextViewController : (UIViewController *)nextViewController
                                   nextDisplayDuration : (NSTimeInterval )nextDisplayDuration
                                           actionStart : (void (^)())actionStart
                                          actionFinish : (void (^)())actionFinish;

//start action
+ (void)transformNextViewControllerToNowViewController : (UIViewController *)nowViewController
                                    nowDisplayDuration : (NSTimeInterval )nowDisplayDuration
                                    nextViewController : (UIViewController *)nextViewController
                                   nextDisplayDuration : (NSTimeInterval )nextDisplayDuration
                                           actionStart : (void (^)())actionStart;

//middle action
+ (void)transformNextViewControllerToNowViewController : (UIViewController *)nowViewController
                                    nowDisplayDuration : (NSTimeInterval )nowDisplayDuration
                                    nextViewController : (UIViewController *)nextViewController
                                   nextDisplayDuration : (NSTimeInterval )nextDisplayDuration
                                          actionMiddle : (void (^)())actionMiddle;

//end action
+ (void)transformNextViewControllerToNowViewController : (UIViewController *)nowViewController
                                    nowDisplayDuration : (NSTimeInterval )nowDisplayDuration
                                    nextViewController : (UIViewController *)nextViewController
                                   nextDisplayDuration : (NSTimeInterval )nextDisplayDuration
                                          actionFinish : (void (^)())actionFinish;

+ (void)transitionFromParentViewController:(UIViewController *)parentViewController
           nowViewController:(UIViewController *)nowViewController
          nextViewController:(UIViewController *)nextViewController;

+ (void)showToastMessage:(NSString*)message;

+ (void)showToastMessage:(NSString*)message
             actionStart:(void (^)())actionStart actionFinish:(void (^)())actionFinish;

+ (void)showToastMessage:(NSString*)message duration:(NSTimeInterval)duration
         displayDuration:(NSTimeInterval)displayDuration
             actionStart:(void (^)())actionStart actionFinish:(void (^)())actionFinish;

+ (void)showToastOnViewController:(UIViewController *)viewController
                          message:(NSString *)message;

+ (void)showToastOnViewController:(UIViewController *)viewController
                          message:(NSString *)message
                    animationType:(ToastViewControllerAnimationType)animationType;

+ (void)showToastOnViewController:(UIViewController *)viewController
                          message:(NSString *)message
                      actionStart:(void (^)())actionStart
                     actionFinish:(void (^)())actionFinish;

+ (void)showToastOnViewController:(UIViewController *)viewController
                          message:(NSString*)message
                         duration:(NSTimeInterval)duration
                  displayDuration:(NSTimeInterval)displayDuration
                      actionStart:(void (^)())actionStart
                     actionFinish:(void (^)())actionFinish;

+ (void)showToastOnViewController:(UIViewController *)viewController message:(NSString *)message
                    animationType:(ToastViewControllerAnimationType)animationType
                         duration:(NSTimeInterval)duration
                  displayDuration:(NSTimeInterval)displayDuration
                      actionStart:(void (^)())actionStart actionFinish:(void (^)())actionFinish;

@end
