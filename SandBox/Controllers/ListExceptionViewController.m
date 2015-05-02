//
//  ListExceptionViewController.m
//  SandBox
//
//  Created by YouOhshima on 2015/04/30.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "ListExceptionViewController.h"

@interface ListExceptionViewController ()

@property (nonatomic) NSArray *buttons;

@end

@implementation ListExceptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.buttons = @[
                     @{@"title":@"例外処理",@"action":@"newNSException:",
                       @"UIWindow":@{
                               }
                       },
                     @{@"title":@"例外処理"},
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

- (void)newNSException:(id)sender{
    
    /** raiseで例外を投げる */
    @try {
        [NSException raise:@"TestException" format:@"テスト"];
    }
    @catch (NSException *exception) {
        NSLog(@"例外名：%@", exception.name);
        NSLog(@"理由：%@", exception.reason);
    }
    @finally {
        
    }
    
}

- (void)newException:(id)sender {
    /** @throwで例外を投げる */
    @try {
        // 文字列を例外として投げる
        @throw @"string exception";
    }
    @catch (NSString *exception) {
        // 文字列をキャッチ
        NSLog(@"%@", exception);
    }
    @catch (id exception) {
        // すべての例外をキャッチ
        NSLog(@"%@", exception);
        
        // このブロックでキャッチした例外を伝播
        @throw;
    }
    @finally {
        
    }
}

- (void)dealloc
{
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
    
}

@end
