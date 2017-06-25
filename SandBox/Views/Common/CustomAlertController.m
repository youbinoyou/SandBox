//
//  CustomAlertController.m
//  sandbox-iOS
//
//  Created by You Ohshima on 2015/04/20.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "CustomAlertController.h"
#import <objc/runtime.h>

@interface CustomAlertAction ()

@property (nonatomic, strong) CustomAlertActionHandler customAlertActionHandler;
@property (nonatomic) NSString *title;
@property (nonatomic) CustomAlertActionStyle style;

@end

@implementation CustomAlertAction

/**
 * ボタンアクションの準備
 * @param title ボタンのタイトル
 * @param style ボタンの表示タイプ
 * @return カスタムアラートアクションクラス
 */
+ (instancetype)actionWithTitle:(NSString *)title style:(CustomAlertActionStyle)style handler:(CustomAlertActionHandler)handler {
    
    CustomAlertAction *action = [[super alloc] init];
    if (action) {
        action.title = title;
        action.style = style;
        action.customAlertActionHandler = handler;
    }
    
    return action;
}

@end

static const char kAssocKey_Window;

@interface CustomAlertController ()

/**
 * アラートのビューを用意
 */
@property (nonatomic) UIView *backgroundView;
@property (nonatomic) UIView *alertView;
@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) UILabel *messageLabel;
@property (nonatomic) NSArray *actions;
@property (nonatomic) NSArray *textFields;

/**
 * アラート表示スタイル
 */
@property (nonatomic) CustomAlertControllerStyle preferredStyle;

@end

@interface CustomWindow : UIWindow

@end

@implementation CustomWindow

- (void)dealloc
{
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));

}

@end


@implementation CustomAlertController

static CustomAlertController *customAlertController;

/**
 * アラートの準備
 * @param title アラートのタイトル
 * @param message アラートのメッセージ
 * @param preferredStyle アラート表示スタイル
 * @return カスタムアラートコントローラクラス
 */
+ (instancetype)customAlertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(CustomAlertControllerStyle)preferredStyle {
    customAlertController = [[super alloc] init];
    customAlertController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    customAlertController.modalPresentationStyle = UIModalPresentationCustom;
    customAlertController.title = title;
    customAlertController.message = message;
    customAlertController.preferredStyle = preferredStyle;
    //customAlertController.backgroundView = [[UIView alloc] init];
    customAlertController.alertView = [[UIView alloc] init];
    customAlertController.actions = [[NSArray alloc] init];
    
    return customAlertController;
}

- (id)init {
    self = [super init];
    self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    self.modalPresentationStyle = UIModalPresentationCustom;
    self.title = @"CustomAlert";
    self.message = @"customAlert Message";
    customAlertController.preferredStyle = CustomAlertControllerStyleAlert;
    
    customAlertController = self;
    
    UIWindow *window = [[CustomWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.alpha = 0.0;
    window.transform = CGAffineTransformMakeScale(1.1, 1.1);
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"CustomAlert" bundle:nil];
    window.rootViewController = [storyboard instantiateInitialViewController];
    window.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    window.windowLevel = UIWindowLevelAlert;
    
    [window makeKeyAndVisible];
    
    // ウィンドウのオーナーとしてアプリ自身に括りつけとく
    objc_setAssociatedObject([UIApplication sharedApplication], &kAssocKey_Window, window, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [UIView transitionWithView:window duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve|UIViewAnimationOptionCurveEaseInOut animations:^{
        window.alpha = 1.0;
        window.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self openAction];
        
        
        switch (customAlertController.preferredStyle) {
                /* オリジナルアクションシート */
            case CustomAlertControllerStyleActionSheet: {
                customAlertController.alertView.transform = CGAffineTransformMakeTranslation(0, +[[UIScreen mainScreen] bounds].size.height);
                
                [UIView animateWithDuration:0.2 animations:^(void){
                    
                    customAlertController.alertView.transform = CGAffineTransformIdentity;
                }completion:^(BOOL finished){
                    
                }];
                
                break;
            }
                
                /* オリジナルアラート */
            case CustomAlertControllerStyleAlert: {
                customAlertController.alertView.transform = CGAffineTransformMakeScale(1.2, 1.2);

                [UIView animateWithDuration:0.2 animations:^(void){
                    
                    customAlertController.alertView.transform = CGAffineTransformIdentity;
                }completion:^(BOOL finished){
                    
                }];
                
                break;
            }
                
            default:
                break;
        }

    }];

        return customAlertController;
    
    
}

- (void)addAction:(CustomAlertAction *)action {
    NSMutableArray *mActions = [customAlertController.actions mutableCopy];
    [mActions addObject:action];
    customAlertController.actions = mActions;
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

/**
 * アラート以外の部分のタッチの処理
 */
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self closeAction:nil];
}

/**
 * アラートのボタンの処理
 */
- (IBAction)customAlertButtonAction:(UIView *)sender {
    if (customAlertController.actions.count && sender) {
        CustomAlertAction *action = customAlertController.actions[((UIView *)sender).tag];
        action.customAlertActionHandler(action);
    }

    [self closeAction:sender];
}

/**
 * アラートを表示する
 */
- (void)openAction {
    switch (customAlertController.preferredStyle) {
            /* オリジナルアクションシート */
        case CustomAlertControllerStyleActionSheet: {
            
            UIWindow *window = objc_getAssociatedObject([UIApplication sharedApplication], &kAssocKey_Window);
            
            //backgroundView
            customAlertController.backgroundView.frame = [[UIScreen mainScreen] bounds];
            customAlertController.backgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
            
            CGRect cgRect = CGRectZero;
            
            //alertView
            cgRect.size.width = [[UIScreen mainScreen] applicationFrame].size.width - 20;
            customAlertController.alertView.frame = cgRect;
            customAlertController.alertView.backgroundColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:0.8];
            [window.rootViewController.view addSubview:customAlertController.alertView];
            
            
            CAGradientLayer *gradientLayer = [CAGradientLayer layer];
            gradientLayer.frame = self.view.bounds;
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
            
            [customAlertController.alertView.layer addSublayer:gradientLayer];
            
            customAlertController.alertView.layer.cornerRadius = 5;
            customAlertController.alertView.layer.masksToBounds = YES;
            customAlertController.alertView.layer.borderColor = [UIColor colorWithWhite:0.0 alpha:0.75].CGColor;
            customAlertController.alertView.layer.borderWidth = 1.0;
            
            customAlertController.titleLabel = [[UILabel alloc] init];
            customAlertController.titleLabel.text = customAlertController.title;
            customAlertController.titleLabel.textAlignment = NSTextAlignmentCenter;
//            customAlertController.titleLabel.font = [UIFont boldSystemFontOfSize:[UIFont labelFontSize]];
            [customAlertController.titleLabel sizeToFit];
            cgRect.size.height = customAlertController.titleLabel.frame.size.height;
            cgRect.size.width = [[UIScreen mainScreen] applicationFrame].size.width - 20;
            customAlertController.titleLabel.frame = cgRect;
            [customAlertController.alertView addSubview:customAlertController.titleLabel];
            cgRect.size.height += customAlertController.titleLabel.frame.size.height;
            customAlertController.alertView.frame = cgRect;
            
            customAlertController.messageLabel = [[UILabel alloc] init];
            customAlertController.messageLabel.text = customAlertController.message;
            customAlertController.messageLabel.textAlignment = NSTextAlignmentCenter;
            [customAlertController.messageLabel sizeToFit];
            cgRect.origin.y += customAlertController.titleLabel.frame.size.height;
            cgRect.size.height = customAlertController.messageLabel.frame.size.height;
            cgRect.size.width = [[UIScreen mainScreen] applicationFrame].size.width - 20;
            customAlertController.messageLabel.frame = cgRect;
            [customAlertController.alertView addSubview:customAlertController.messageLabel];
            cgRect = customAlertController.alertView.frame;
            customAlertController.alertView.frame = cgRect;
            UIButton *cancelButton = nil;
            CGRect buttonRect = CGRectZero;
            for (CustomAlertAction *action in customAlertController.actions) {
                buttonRect = cgRect;
                UIButton *actionButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                actionButton.tag = [customAlertController.actions indexOfObject:action];
                [actionButton setTitle:action.title forState:UIControlStateNormal];
                actionButton.titleLabel.textAlignment = NSTextAlignmentCenter;
                [actionButton addTarget:self action:@selector(customAlertButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                
                
                switch (action.style) {
                    case CustomAlertActionStyleCancel:{
                        if (!cancelButton) {
                            cancelButton = actionButton;
                            actionButton.titleLabel.font = [UIFont boldSystemFontOfSize:[UIFont buttonFontSize]];
                        } else {
                            @throw [NSException exceptionWithName:@"CancelButton" reason:@"" userInfo:nil];
                        }
                        break;
                    }
                    case CustomAlertActionStyleDefault:{
                        
                        break;
                    }
                    case CustomAlertActionStyleDestructive:{
                        [actionButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                        break;
                    }
                    default:
                        break;
                }
                
                if (CustomAlertActionStyleCancel != action.style) {
                    [actionButton sizeToFit];
                    
                    buttonRect.size.height = 44;
                    buttonRect.origin.y += 44;
                    buttonRect.size.width = [[UIScreen mainScreen] applicationFrame].size.width - 20;
                    actionButton.frame = buttonRect;
                    [customAlertController.alertView addSubview:actionButton];
                }
                cgRect = customAlertController.alertView.frame;
                cgRect.origin.y += actionButton.frame.size.height;
                cgRect.size.height += actionButton.frame.size.height;
                customAlertController.alertView.frame = cgRect;
            }
            if (cancelButton) {
                buttonRect.size.height = 44;
                buttonRect.origin.y += 44;
                buttonRect.size.width = [[UIScreen mainScreen] applicationFrame].size.width - 20;
                cancelButton.frame = buttonRect;
                [customAlertController.alertView addSubview:cancelButton];
                cgRect = customAlertController.alertView.frame;
                cgRect.origin.y += cancelButton.frame.size.height;
                cgRect.size.height += cancelButton.frame.size.height;
                customAlertController.alertView.frame = cgRect;
            }
            gradientLayer.frame = customAlertController.alertView.bounds;
            
            customAlertController.alertView.center = CGPointMake(self.view.center.x,[UIScreen mainScreen].bounds.size.height - customAlertController.alertView.frame.size.height / 2.0f);
            
            break;
        }
            
            /* オリジナルアラート */
        case CustomAlertControllerStyleAlert: {
            UIWindow *window = objc_getAssociatedObject([UIApplication sharedApplication], &kAssocKey_Window);
            
            //backgroundView
            customAlertController.backgroundView.frame = [[UIScreen mainScreen] bounds];
            customAlertController.backgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
            [customAlertController.view addSubview:customAlertController.backgroundView];
            
            CGRect cgRect = CGRectZero;
            
            //alertView
            cgRect.size.width = [[UIScreen mainScreen] applicationFrame].size.width - 20;
            customAlertController.alertView.frame = cgRect;
            customAlertController.alertView.backgroundColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:0.8];
            [window.rootViewController.view addSubview:customAlertController.alertView];
            
            
            CAGradientLayer *gradientLayer = [CAGradientLayer layer];
            gradientLayer.frame = self.view.bounds;
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
            
            [customAlertController.alertView.layer addSublayer:gradientLayer];
            
            customAlertController.alertView.layer.cornerRadius = 5;
            customAlertController.alertView.layer.masksToBounds = YES;
            customAlertController.alertView.layer.borderColor = [UIColor colorWithWhite:0.0 alpha:0.75].CGColor;
            customAlertController.alertView.layer.borderWidth = 1.0;
            
            customAlertController.titleLabel = [[UILabel alloc] init];
            customAlertController.titleLabel.text = customAlertController.title;
            customAlertController.titleLabel.textAlignment = NSTextAlignmentCenter;
            customAlertController.titleLabel.font = [UIFont boldSystemFontOfSize:[UIFont labelFontSize]];
            [customAlertController.titleLabel sizeToFit];
            cgRect.size.height = customAlertController.titleLabel.frame.size.height;
            cgRect.size.width = [[UIScreen mainScreen] applicationFrame].size.width - 20;
            customAlertController.titleLabel.frame = cgRect;
            [customAlertController.alertView addSubview:customAlertController.titleLabel];
            cgRect.size.height += customAlertController.titleLabel.frame.size.height;
            customAlertController.alertView.frame = cgRect;
            
            customAlertController.messageLabel = [[UILabel alloc] init];
            customAlertController.messageLabel.text = customAlertController.message;
            customAlertController.messageLabel.textAlignment = NSTextAlignmentCenter;
            [customAlertController.messageLabel sizeToFit];
            cgRect.origin.y += customAlertController.titleLabel.frame.size.height;
            cgRect.size.height = customAlertController.messageLabel.frame.size.height;
            cgRect.size.width = [[UIScreen mainScreen] applicationFrame].size.width - 20;
            customAlertController.messageLabel.frame = cgRect;
            [customAlertController.alertView addSubview:customAlertController.messageLabel];
            cgRect = customAlertController.alertView.frame;
            customAlertController.alertView.frame = cgRect;
            UIButton *cancelButton = nil;
            CGRect buttonRect = CGRectZero;
            for (CustomAlertAction *action in customAlertController.actions) {
                buttonRect = cgRect;
                UIButton *actionButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                actionButton.tag = [customAlertController.actions indexOfObject:action];
                [actionButton setTitle:action.title forState:UIControlStateNormal];
                actionButton.titleLabel.textAlignment = NSTextAlignmentCenter;
                [actionButton addTarget:self action:@selector(customAlertButtonAction:) forControlEvents:UIControlEventTouchUpInside];

                switch (action.style) {
                    case CustomAlertActionStyleCancel:{
                        if (!cancelButton) {
                            cancelButton = actionButton;
                            actionButton.titleLabel.font = [UIFont boldSystemFontOfSize:[UIFont buttonFontSize]];
                        } else {
                            @throw [NSException exceptionWithName:@"CancelButton" reason:@"" userInfo:nil];
                        }                        break;
                    }
                    case CustomAlertActionStyleDefault:{
                        
                        break;
                    }
                    case CustomAlertActionStyleDestructive:{
                        [actionButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                        break;
                    }
                    default:
                        break;
                }
                if (CustomAlertActionStyleCancel != action.style) {
                    [actionButton sizeToFit];
                    
                    buttonRect.size.height = 44;
                    buttonRect.origin.y += 44;
                    buttonRect.size.width = [[UIScreen mainScreen] applicationFrame].size.width - 20;
                    actionButton.frame = buttonRect;
                    [customAlertController.alertView addSubview:actionButton];
                }
                    cgRect = customAlertController.alertView.frame;
                    cgRect.origin.y += actionButton.frame.size.height;
                    cgRect.size.height += actionButton.frame.size.height;
                    customAlertController.alertView.frame = cgRect;
            }
            if (cancelButton) {
                buttonRect.size.height = 44;
                buttonRect.origin.y += 44;
                buttonRect.size.width = [[UIScreen mainScreen] applicationFrame].size.width - 20;
                cancelButton.frame = buttonRect;
                [customAlertController.alertView addSubview:cancelButton];
                cgRect = customAlertController.alertView.frame;
                cgRect.origin.y += cancelButton.frame.size.height;
                cgRect.size.height += cancelButton.frame.size.height;
                customAlertController.alertView.frame = cgRect;
            }
            gradientLayer.frame = customAlertController.alertView.bounds;
            customAlertController.alertView.center = self.view.center;
            
            break;
        }
            
        default:
            break;
    }
}

/**
 * アラートを閉じる
 */
- (void)closeAction:(id)sender {
    //NSLog(@"%@",@(customAlertController.preferredStyle));
    
    switch (customAlertController.preferredStyle) {
            /* オリジナルアクションシート */
        case CustomAlertControllerStyleActionSheet: {
            
            //customAlertController.alertView.transform = CGAffineTransformIdentity;
            
            [UIView animateWithDuration:0.2 animations:^(void){
                customAlertController.alertView.transform = CGAffineTransformMakeTranslation(0, +[[UIScreen mainScreen] bounds].size.height);
                
            }completion:^(BOOL finished){
                [customAlertController.alertView removeFromSuperview];
                
                
                
                UIWindow *window = objc_getAssociatedObject([UIApplication sharedApplication], &kAssocKey_Window);
                [UIView transitionWithView:window
                                  duration:0.3
                                   options:UIViewAnimationOptionTransitionCrossDissolve|UIViewAnimationOptionCurveEaseInOut
                                animations:^{
                                    UIView *view = window.rootViewController.view;
                                    for (UIView *v in view.subviews) {
                                        v.transform = CGAffineTransformMakeScale(0.8, 0.8);
                                    }
                                    window.alpha = 0;
                                }
                                completion:^(BOOL finished) {
                                    
                                    UIWindow *window = objc_getAssociatedObject([UIApplication sharedApplication], &kAssocKey_Window);
                                    
                                    [window.rootViewController.view removeFromSuperview];
                                    window.rootViewController = nil;
                                    
                                    // 上乗せしたウィンドウを破棄
                                    objc_setAssociatedObject([UIApplication sharedApplication], &kAssocKey_Window, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                                    
                                    // メインウィンドウをキーウィンドウにする
                                    UIWindow *nextWindow = [[UIApplication sharedApplication] delegate].window;
                                    [nextWindow makeKeyAndVisible];
                                    [nextWindow makeKeyWindow];
                                    
                                    [self dismissViewControllerAnimated:YES completion:^(void){
                                        window.frame = CGRectZero;
                                    }];
                                }];
            }];

            break;
        }
            /* オリジナルアラート */
        case CustomAlertControllerStyleAlert: {
            
            UIWindow *window = objc_getAssociatedObject([UIApplication sharedApplication], &kAssocKey_Window);
            [UIView transitionWithView:window
                              duration:0.3
                               options:UIViewAnimationOptionTransitionCrossDissolve|UIViewAnimationOptionCurveEaseInOut
                            animations:^{
                                UIView *view = window.rootViewController.view;
                                for (UIView *v in view.subviews) {
                                    v.transform = CGAffineTransformMakeScale(0.8, 0.8);
                                }
                                window.alpha = 0;
                            }
                            completion:^(BOOL finished) {
                                
                                UIWindow *window = objc_getAssociatedObject([UIApplication sharedApplication], &kAssocKey_Window);
                                
                                [window.rootViewController.view removeFromSuperview];
                                window.rootViewController = nil;
                                
                                // 上乗せしたウィンドウを破棄
                                objc_setAssociatedObject([UIApplication sharedApplication], &kAssocKey_Window, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                                
                                // メインウィンドウをキーウィンドウにする
                                UIWindow *nextWindow = [[UIApplication sharedApplication] delegate].window;
                                [nextWindow makeKeyAndVisible];
                                [nextWindow makeKeyWindow];
                                
                                [self dismissViewControllerAnimated:YES completion:^(void){
                                    window.frame = CGRectZero;
                                    
                                }];
                            }];

            break;
        }
            
        default:
            break;
    }
}

@end
