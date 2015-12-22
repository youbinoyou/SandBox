//
//  CustomSecurityNumberKeyboardViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/12/17.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import "CustomSecurityNumberKeyboardViewController.h"
#import "UtilsViewController.h"

@interface CustomSecurityNumberKeyboardViewController () {
    NSTimer *timer;
    NSString *setNumber;
    NSString *password;
    NSDictionary *memory;
}

@property (weak, nonatomic) IBOutlet UIButton *okButton;
@property (weak, nonatomic) IBOutlet UIButton *ngButton;
@property (weak, nonatomic) IBOutlet UIButton *unlockButton;
@property (weak, nonatomic) IBOutlet UIButton *errorButton;
@property (weak, nonatomic) IBOutlet UIButton *setAlert;
@property (weak, nonatomic) IBOutlet UIButton *lockAlert;
@property (weak, nonatomic) IBOutlet UIButton *cleckAlert;
@property (weak, nonatomic) IBOutlet UIButton *roundAlert;

@end

@implementation CustomSecurityNumberKeyboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    memory = @{
               @"password":@"1234",
               @"setAlert":@(NO),
               @"lockAlert":@(YES),
               @"cleckAlert":@(NO),
               @"roundAlert":@(NO),
               };

    setNumber = @"";
    password = memory[@"password"];
    // Do any additional setup after loading the view.
    [self buttonClear];
}

- (void)setOnButton:(UIButton *)sendButton {
    [sendButton setTitleColor:[UIColor colorWithRed:162.0/255.0 green:255.0/255.0 blue:58.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [sendButton setTitleShadowColor:[UIColor colorWithRed:255.0/255.0 green:232.0/255.0 blue:31.0/255.0 alpha:1.0] forState:UIControlStateNormal];
}

- (void)setOffButton:(UIButton *)sendButton {
    [sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sendButton setTitleShadowColor:[UIColor clearColor] forState:UIControlStateNormal];
}

- (void)setErrorButton:(UIButton *)sendButton {
    [sendButton setTitleColor:[UIColor colorWithRed:230.0/255.0 green:0.0/255.0 blue:79.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [sendButton setTitleShadowColor:[UIColor colorWithRed:230.0/255.0 green:0.0/255.0 blue:79.0/255.0 alpha:1.0] forState:UIControlStateNormal];
}

- (void)buttonClear {
    //タイマー停止
    [timer invalidate];
    [self setOffButton:self.okButton];
    [self setOffButton:self.ngButton];
    [self setOffButton:self.unlockButton];
    [self setOffButton:self.errorButton];
    [self setOffButton:self.setAlert];
    [self setOffButton:self.lockAlert];
    [self setOffButton:self.cleckAlert];
    [self setOffButton:self.roundAlert];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)numberAction:(UIButton *)sender {
    setNumber = [setNumber stringByAppendingFormat:@"%ld",sender.tag];
    NSLog(@"%@",setNumber);
}

- (IBAction)numberClearAction:(id)sender {
    setNumber = @"";
}

- (IBAction)enterAction:(id)sender {
    if ([password isEqualToString:setNumber]) {
        [self unlock];
    } else {
        [self lock];
    }
}

- (void)lock {
    NSLog(@"エラー");
    [UtilsViewController showToastOnViewController:self message:@"エラー"];
    [self setErrorButton:self.ngButton];
    //タイマー発動
    timer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(buttonClear) userInfo:nil repeats:NO];
    [self numberClearAction:nil];
}

- (void)unlock {
    NSLog(@"ロック解除");
    [self setOnButton:self.okButton];
    
    [self closeViewController];
}

- (void)closeViewController {
    //タイマー発動
    timer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(buttonClear) userInfo:nil repeats:NO];
    [self numberClearAction:nil];

    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)dealloc {
    [timer invalidate];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
