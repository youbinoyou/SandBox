//
//  ListTabBarViewController.m
//  SandBox
//
//  Created by YouOhshima on 2015/05/07.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "ListTabBarViewController.h"

@interface ListTabBarViewController ()

@property (nonatomic) NSArray *buttons;
@property (nonatomic) UITabBarController *tabBarController;

@end

@implementation ListTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.buttons = @[
                     @{@"title":@"タブバー",@"action":@"newUIAlertView:",
                       @"UIAlertView":@{
                               @"title":@"UIAlertView",
                               @"message":@"message",
                               @"delegate":self,
                               @"cancelButtonIndex":@1,
                               @"alertViewStyle":[NSNumber numberWithInteger:UIAlertViewStyleDefault],
                               @"buttonTitles":@[
                                       @"ボタンタイトル１",
                                       @"ボタンタイトル２（キャンセル）",
                                       @"ボタンタイトル３",
                                       ]
                               }
                       },
                     
                     @{@"title":@"タブバー（操作）Title",@"action":@"setCustomAlertTitle:"},
                     @{@"title":@"タブバー（操作）Message",@"action":@"setCustomAlertMessage:"},
                     @{@"title":@"タブバー（操作）Delegate",@"action":@"setCustomAlertDelegate:"},
                     @{@"title":@"タブバー（操作）CancelButtonIndex",@"action":@"selectCustomAlertCancelButtonIndex"},
                     @{@"title":@"タブバー（操作）ViewStyle",@"action":@"selectCustomAlertViewStyle"},
                     @{@"title":@"タブバー（操作）ButtonTitles",@"action":@"setCustomAlertButtonTitles:"},
                     @{@"title":@"タブバー（デフォルト）",@"action":@"defalutUIAlertButtonAction:"},
                     @{@"title":@"カスタムタブバー"},
                     @{@"title":@"UITabBarのテキストフォントとカラーを変更する",@"action":@"tabbarTextFontandColor:"},
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
            } else {
                NSLog(@"no action");
            }
        }
        if (item[@"listViewController:"]) {
            SEL action = NSSelectorFromString(@"listViewController:event:");
            if ([self respondsToSelector:action]) {
                [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
            } else {
                NSLog(@"no listViewController");
            }
        }
        [self.view addSubview:button];
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

- (void)tabbarTextFontandColor:(id)sender{
    
    NSMutableArray *viewControllers = [NSMutableArray new];
    
    for (int v = 0; v < 2; v++) {
        
        UIViewController *viewController = [UIViewController new];
        const CGFloat r = arc4random_uniform(255) / 255.0;
        const CGFloat g = arc4random_uniform(255) / 255.0;
        const CGFloat b = arc4random_uniform(255) / 255.0;
        viewController.view.backgroundColor = [UIColor colorWithRed:r
                                                              green:g
                                                               blue:b
                                                              alpha:0.5];
        
        //set the title for the tab
        viewController.title = [NSString stringWithFormat:@"%d Tab",v];
        //set the image icon for the tab
        viewController.tabBarItem.image = [UIImage imageNamed:@"first.png"];
        
        //just display some text so that we know what view we are in
        UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 300, 100)];
        myLabel.text = [NSString stringWithFormat:@"%d View Controller",v];
        myLabel.font = [UIFont boldSystemFontOfSize:24.0f];
        
        [viewController.view addSubview:myLabel];

        //create a button so that when the user taps it we will generate a new
        //tab programmatically
        UIButton *myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        myButton.frame = CGRectMake(85.0f, 100.0f, 150.0f, 37.0f);
        [myButton setTitle:@"Add another Tab"
                  forState:UIControlStateNormal];
        [myButton addTarget:self
                     action:@selector(checkButtonClick:)
           forControlEvents:UIControlEventTouchUpInside];
        [viewController.view addSubview:myButton];
        
        [viewControllers addObject: viewController];
    }
    
    self.tabBarController = [[UITabBarController alloc] init];
    [self.tabBarController setViewControllers:viewControllers];
    [self.view addSubview:self.tabBarController.view];
    
    
    //create a custom view for the tab bar
//    CGRect frame = CGRectMake(0.0, 0.0, self.view.bounds.size.width, 48);
//    UIView *v = [[UIView alloc] initWithFrame:frame];
//    [v setBackgroundColor:[UIColor blackColor]];
//    [v setAlpha:0.5];
//    [self.tabBarController.tabBar addSubview:v];
    
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0f];
    //タブ選択時のフォントとカラー
    NSDictionary *selectedAttributes = @{NSFontAttributeName : font,
                                         NSForegroundColorAttributeName : [UIColor redColor]};
    
    [[UITabBarItem appearance] setTitleTextAttributes:selectedAttributes
                                             forState:UIControlStateSelected];
    
    //通常時のフォントとカラー
    NSDictionary *attributesNormal = @{NSFontAttributeName : font,
                                       NSForegroundColorAttributeName : [UIColor blueColor]};
    
    [[UITabBarItem appearance] setTitleTextAttributes:attributesNormal
                                             forState:UIControlStateNormal];

}

- (void) checkButtonClick:(UIButton *)paramSender{
    
    UIButton *myButton = paramSender;
    
    //check which button was tapped
    if([myButton.currentTitle isEqualToString:@"Add another Tab"]){
        NSLog(@"Clicked on the button");
//        
//        //if the last view controller doesn't exists create it
//        if(self.lastViewController == nil){
//            LastViewController *lastView = [[LastViewController alloc] init];
//            self.lastViewController = lastView;
//            
//            //Get the current array of View Controllers
//            NSArray *currentControllers = self.tabBarController.viewControllers;
//            
//            //Create a mutable array out of this array
//            NSMutableArray *newControllers = [NSMutableArray arrayWithArray:currentControllers];
//            
//            //add another view controller to the mutable array
//            [newControllers addObject:lastViewController];
//            
//            //Assign the manipulated array to the tab bar Controller with animation
//            [self.tabBarController setViewControllers:newControllers
//                                             animated:YES];
//            //display the tab that was just added
//            [self.tabBarController setSelectedIndex:(newControllers.count -1)];
//            
//        }
//        
        
        
    }
}

- (void)listViewController:(id)sender event:(id)event{
    
    NSLog(@"%s",__PRETTY_FUNCTION__);
    NSLog(@"@param\n\nsender:\n%@\nevent:\n%@",sender,event);
    
    UIButton *sendButton = sender;
    Class listViewControllerClass = NSClassFromString(self.buttons[sendButton.tag][@"listViewController:"]);
    if (listViewControllerClass) {
        /**
         * 遷移するViewControllerの生成
         */
        UIViewController *listViewController = [[listViewControllerClass alloc] init];
        listViewController.view.backgroundColor = self.view.backgroundColor;
        listViewController.title = self.buttons[sendButton.tag][@"title"];
        listViewController.navigationItem.leftBarButtonItem =
        // TOPページに戻る処理
        [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(dismissCloseButtonAction:)];
        
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:listViewController];
        navigationController.modalTransitionStyle = arc4random_uniform(4);
        
        [self presentViewController:navigationController animated:YES completion:^(){
            NSLog(@"%@",self.buttons[sendButton.tag][@"title"]);
        }];
    } else {
        NSLog(@"No Class : %@",self.buttons[sendButton.tag][@"listViewController:"]);
    }
}

/**
 * 戻る処理
 */
- (void)dismissCloseButtonAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^(){
        NSLog(@"%@",sender);
    }];
}

- (void)dealloc
{
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
    
}


@end
