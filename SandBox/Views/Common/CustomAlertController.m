//
//  CustomAlertController.m
//  SandBox
//
//  Created by 大島 曜 on 2015/04/22.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "CustomAlertController.h"


@interface CustomAlertView : UIView

@end

@implementation CustomAlertView

- (id)init{
    if (self) {
        self = [super init];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    
}

@end

@interface CustomAlertBackgroundView : UIView

@end

@implementation CustomAlertBackgroundView

- (id)init{
    if (self) {
        self = [super init];
        self.frame = [[UIScreen mainScreen] bounds];
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    
}

@end


@interface CustomAlertController ()<UIActionSheetDelegate>

@property UIButton *actionButton;
@property (nonatomic) NSArray *buttons;

@property (nonatomic,strong) CustomAlertBackgroundView *customAlertBackgroundView;
@property (nonatomic,strong) CustomAlertView *customAlertView;

@end

@implementation CustomAlertController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.modalPresentationStyle = 4;
    self.modalTransitionStyle = 0;
    [self preferredStatusBarUpdateAnimation];

    UIViewController *nextViewController = self.presentingViewController;
    if ([nextViewController isKindOfClass:[UINavigationController class]]) {
        nextViewController = self.presentingViewController.childViewControllers.lastObject;
    }
    self.customAlertView = [CustomAlertView new];
    self.customAlertBackgroundView = [CustomAlertBackgroundView new];

    NSLog(@"nextViewController : %@",nextViewController);
    NSLog(@"presentingViewController : %@",self.presentingViewController);
    NSLog(@"presentedViewController : %@",self.presentedViewController);
    NSLog(@"parentViewController : %@",self.parentViewController);
    self.view.backgroundColor = nextViewController.view.backgroundColor;

    
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
    self.title = NSStringFromClass(self.class);
    
    self.buttons = @[
                     @{@"title":@"押しボタン（アクション）",@"action":@"pressActionButton:"},
                     @{@"title":@"アニメーション",@"action":@"setAnimation:"},
                     ];
    
    CGRect rectButton = CGRectZero;
    for (NSDictionary *item in self.buttons) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        const CGFloat r = arc4random_uniform(255) / 255.0;
        const CGFloat g = arc4random_uniform(255) / 255.0;
        const CGFloat b = arc4random_uniform(255) / 255.0;
        
        button.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:0.5];
        [button setTitle:item[@"title"] forState:UIControlStateNormal];
        [button sizeToFit];
        button.tag = [self.buttons indexOfObject:item];
        rectButton.origin.x = 20;
        rectButton.size.width  = [UIScreen mainScreen].applicationFrame.size.width - 40;
        rectButton.size.height = [UIScreen mainScreen].applicationFrame.size.height / (self.buttons.count + 2);
        rectButton.origin.y += rectButton.size.height + 1;
        button.frame = rectButton;
        if (item[@"action"]) {
            SEL action = NSSelectorFromString(item[@"action"]);
            if ([self respondsToSelector:action]) {
                [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
            }
        }
        if (item[@"listViewController:"]) {
            SEL action = NSSelectorFromString(@"listViewController:event:");
            if ([self respondsToSelector:action]) {
                [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
            }
        }
        
        [self.customAlertBackgroundView addSubview:button];
    }
    
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    
    [self animation:self.view];

}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    UIViewController *nextViewController = self.presentingViewController;
    if ([nextViewController isKindOfClass:[UINavigationController class]]) {
        nextViewController = self.presentingViewController.childViewControllers.lastObject;
    }
    NSLog(@"nextViewController : %@",nextViewController);
    NSLog(@"presentingViewController : %@",self.presentingViewController);
    NSLog(@"presentedViewController : %@",self.presentedViewController);
    NSLog(@"parentViewController : %@",self.parentViewController);
    for (UIView *view in nextViewController.view.subviews) {
        [self.view insertSubview:view atIndex:[nextViewController.view.subviews indexOfObject:view]];
    }
    self.view.backgroundColor = nextViewController.view.backgroundColor;
    [self.view insertSubview:nextViewController.navigationController.navigationBar atIndex:0];
    
    self.customAlertBackgroundView.transform = CGAffineTransformMakeTranslation(0, 0);
    //self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [self.view addSubview:self.customAlertView];
    [self.view addSubview:self.customAlertBackgroundView];
    self.customAlertBackgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
    
    [UIView animateWithDuration:0.3 animations:^(void){
        self.customAlertBackgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        self.customAlertBackgroundView.transform = CGAffineTransformIdentity;
    }completion:^(BOOL finished){
        
    }];

}

- (void)setAnimation:(id)sender {
    [self animation:self.view];
}

- (void)animation:(UIView *)animationView{
    CGPoint point = CGPointMake(self.view.frame.origin.x,self.view.center.y);
    //移動に関する設定
    CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnimation.fromValue = [NSValue valueWithCGPoint:animationView.layer.position];
    moveAnimation.toValue = [NSValue valueWithCGPoint:point];
    animationView.layer.position = point;
    moveAnimation.duration = 5;
    
    //回転に関する設定
    CABasicAnimation* rotertAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    rotertAnimation.duration = 2.5;
    rotertAnimation.repeatCount = 2;
    rotertAnimation.autoreverses = YES;
    CATransform3D transform = CATransform3DMakeRotation(M_PI, 0.0, 1.0, 0.0);
    rotertAnimation.toValue = [NSNumber valueWithCATransform3D:transform];
}

- (void)transitionFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL))completion{
    
}
/*
 UIAlertController と Alertの設定
 */
- (void)showAlert:(NSString*)text
{
    Class UIAlertControllerClass = NSClassFromString(@"UIAlertController");
    if(UIAlertControllerClass){
        // UIAlertControllerを使ってアラートを表示
        UIAlertController *alert = nil;
        alert = [UIAlertControllerClass alertControllerWithTitle:@"Title"
                                                    message:text
                                             preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK"
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction *action){
                                                    [self close];
                                                    [self dismissViewControllerAnimated:YES
                                                completion:^(void){
                                                    
                                                }
                                                     ];
                                                }
                          ]];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        // UIAlertViewを使ってアラートを表示
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title"
                                                        message:text
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
        [alert show];
    }
}
// action1ボタンが押された時の処理
- (void)action1
{
    [self showAlert:@"action 1"];
    
}

// action2ボタンが押された時の処理
- (void)action2
{
    [self showAlert:@"action 2"];
}

// action3ボタンが押された時の処理
- (void)action3
{
    [self showAlert:@"action 3"];
}

- (IBAction)showAlertButtonAction:(id)sender{
    [self showAlert:@"ボタンが押された"];
}

- (IBAction)pressActionButton:(id)sender {
    Class class = NSClassFromString(@"UIAlertController");
    if(class){
        // UIAlertControllerを使ってアクションシートを表示
        UIAlertController *actionSheet = nil;
        actionSheet = [UIAlertController alertControllerWithTitle:@"Title"
                                                          message:@"Message"
                                                   preferredStyle:UIAlertControllerStyleActionSheet];
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Action 1"
                                                        style:UIAlertActionStyleDestructive
                                                      handler:^(UIAlertAction *action){
                                                          [self action1];
                                                      }]];
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Action 2"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action){
                                                          [self action2];
                                                      }]];
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Action 3"
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction *action){
                                                          [self action3];
                                                      }]];
        
        // ユニバーサルアプリかiPadアプリの場合は、
        // UIPopoverPresentationControllerを使った以下のコードが無いと落ちてしまうので注意
        // （このコードがあっても、iPhoneでの実行時には何も変化なし）
        actionSheet.modalPresentationStyle = UIModalPresentationPopover;
        UIPopoverPresentationController *pop = actionSheet.popoverPresentationController;
        pop.sourceView = self.actionButton;
        pop.sourceRect = self.actionButton.bounds;
        pop.sourceView.backgroundColor = [UIColor redColor];
        
        [self presentViewController:actionSheet
                           animated:YES
                         completion:nil];
    }else{
        // UIActionSheetを使ってアクションシートを表示
        UIActionSheet *as = [[UIActionSheet alloc] init];
        as.delegate = self;
        as.title = @"Title";
        [as addButtonWithTitle:@"Action 1"];
        [as addButtonWithTitle:@"Action 2"];
        [as addButtonWithTitle:@"Action 3"];
        as.destructiveButtonIndex = 0;
        as.cancelButtonIndex = 2;
        [as showInView:self.view];
    }
}

// iOS 7でアクションシートのボタンが押された時の処理
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self action1];
            break;
        case 1:
            [self action2];
            break;
        case 2:
            [self action3];
            break;
            default:
            break;
    }
}
- (void)close{
    UIViewController *nextViewController = self.presentingViewController;
    if ([nextViewController isKindOfClass:[UINavigationController class]]) {
        nextViewController = self.presentingViewController.childViewControllers.lastObject;
    }
    NSLog(@"nextViewController : %@",nextViewController);
    NSLog(@"presentingViewController : %@",self.presentingViewController);
    NSLog(@"presentedViewController : %@",self.presentedViewController);
    NSLog(@"parentViewController : %@",self.parentViewController);
    for (UIView *view in self.view.subviews) {
        [nextViewController.view insertSubview:view atIndex:[self.view.subviews indexOfObject:view]];
    }
    nextViewController.view.backgroundColor = self.view.backgroundColor;
    [self.customAlertBackgroundView removeFromSuperview];

}


@end
