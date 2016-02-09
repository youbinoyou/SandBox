//
//  WordWorfGameViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2016/01/11.
//  Copyright © 2016年 大島 曜. All rights reserved.
//

#import "WordWorfGameViewController.h"

@interface WordWorfGameViewController () {
    NSDictionary *_data;
}
@end

@implementation WordWorfGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _data = @{
                      @"プレイ人数":@"6",
                      @"少数派の人数":@"1",
                      @"多数派の人数":@"5",
                      @"お題の内容":@"5",
                      @"子供向け":@[
                          @[@"アンパンマン",@"ドラえもん"],
                          ],
                      @"大人向け":@[
                              @[@"アンパンマン",@"ドラえもん"],
                              ],
                      @"名前変更":@"",
                      @"スタート":@[
                              @"今から各プレイヤーにお題を伝えます。\n準備ができたら「OKボタン」を押してください。"
                              ],
                      };
}

- (void)viewWillAppear:(BOOL)animated {
    
    [self start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)start {
    NSArray *messages = _data[@"スタート"];
    UIAlertController *startAlertController =
    [UIAlertController alertControllerWithTitle:@"スタート"
                                        message:messages[0]
                                 preferredStyle:UIAlertControllerStyleAlert];
    [startAlertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * /*_Nonnull*/ action) {
                                                               NSLog(@"OK");
                                                             }]];
    [self presentViewController:startAlertController
                       animated:YES
                     completion:^(void){
                         
                     }
     ];
}

- (void)conveyToMember:(int)m {
    NSArray *members = _data[@"membar"];
    UIAlertController *conveyToMemberAlertController =
    [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"%@ さん",members[m]]
                                        message:@"にお題を伝えます。\n「OKボタン」を押してください。"
                                 preferredStyle:UIAlertControllerStyleAlert];
    [conveyToMemberAlertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * /*_Nonnull*/ action) {
                                                               NSLog(@"OK");
                                                               [self membarToMessages:m];
                                                           }]];
    [self presentViewController:conveyToMemberAlertController
                       animated:YES
                     completion:^(void){
                         
                     }
     ];
}

- (void)membarToMessages:(int)m {
    NSArray *members = _data[@"membar"];
    NSArray *messages = _data[@"messages"];
    UIAlertController *membarToMessageAlertController =
    [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"%@ さんのお題は",members[m]]
                                        message:[NSString stringWithFormat:@"\n\n「%@」\n\nです。確認したら「OKボタン」を押してください。",messages[m]]
                                 preferredStyle:UIAlertControllerStyleAlert];
    [membarToMessageAlertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                                      style:UIAlertActionStyleDefault
                                                                    handler:^(UIAlertAction * /*_Nonnull*/ action) {
                                                                        NSLog(@"OK");
                                                                        [self conveyToMember:m+1];
                                                                    }]];
    [self presentViewController:membarToMessageAlertController
                       animated:YES
                     completion:^(void){
                         
                     }
     ];
}

- (void)startDiscussion {
    UIAlertController *membarToMessageAlertController =
    [UIAlertController alertControllerWithTitle:nil
                                        message:@"それぞれの「お題」について話し合いの開始です。"
                                 preferredStyle:UIAlertControllerStyleAlert];
    [membarToMessageAlertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                                       style:UIAlertActionStyleDefault
                                                                     handler:^(UIAlertAction * /*_Nonnull*/ action) {
                                                                         NSLog(@"OK");
                                                                        
                                                                     }]];
    [self presentViewController:membarToMessageAlertController
                       animated:YES
                     completion:^(void){
                         
                     }
     ];
}

- (void)timerStart{
    
}

- (void)checkAnswer {
    
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
