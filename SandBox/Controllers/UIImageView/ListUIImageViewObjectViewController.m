//
//  ListUIImageViewObjectViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/11/11.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "ListUIImageViewObjectViewController.h"

@interface ListUIImageViewObjectViewController ()

@end

@implementation ListUIImageViewObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setListButtons];
    [self setImageView];
    
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

- (void)setListButtons {
    
    self.buttons = @[
                     @{keyTitle : @"UIImageViewでユーザー操作を扱う設定"},
                     @{
                         keyTitle : @"userInteractionEnabledを YES にする。",
                         keyAction : @"setImageUserInteractionEnabledYES",
                       },
                     @{
                         keyTitle : @"userInteractionEnabledを NO にする。",
                         keyAction : @"setImageUserInteractionEnabledNO",
                       },
                     @{
                         keyTitle : @"UIImageViewでユーザー操作を追加する",
                         keyAction : @"setImageTapGesture",
                         },
                     @{
                         keyTitle : @"UIImageViewでユーザー操作を削除する",
                         keyAction : @"removeImageTapGesture",
                         },
                     @{
                         keyTitle : @"情報提供元",
                         keyLink : @"http://www.yoheim.net/blog.php?q=20111027",
                         }
                     
                     ];
    [self setButtons];
}

- (void)setImageView{
    CGFloat width = 100;
    CGFloat height = 100;
    self.mainImageView = [UIImageView new];
    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t q_main   = dispatch_get_main_queue();
    dispatch_async(q_global, ^{
        NSURL *url = [NSURL URLWithString:@"https://avatars3.githubusercontent.com/u/6211673?v=3&s=460"];
        NSError *error = nil;
        NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];
        dispatch_async(q_main, ^{
            // メインスレッドでダウンロード完了時になにか処理を実行したいときや
            // 複数ダウンロードの途中経過をメインスレッドで通知したい時などはここに記述
            self.mainImageView.image = [UIImage imageWithData:data];
        });
    });
    self.mainImageView.frame = CGRectMake(
                                          ((CGRectGetMaxX(self.view.frame) - width)/ 2.0),
                                          CGRectGetMaxY(self.view.frame) - height,
                                          width,
                                          height
                                          );
    self.mainImageView.userInteractionEnabled = NO;
    self.mainImageView.backgroundColor = [UIColor blueColor];
    self.mainImageView.alpha = 0.3;
    [self.view addSubview:self.mainImageView];
}

- (void)setImageUserInteractionEnabledYES {
    _mainImageView.userInteractionEnabled = YES;
    NSLog(@"userInteractionEnabledを YES にする。");
    //画面上でわかりやすくするための処理
    self.mainImageView.backgroundColor = [UIColor redColor];
    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t q_main   = dispatch_get_main_queue();
    dispatch_async(q_global, ^{
        NSURL *url = [NSURL URLWithString:@"https://avatars2.githubusercontent.com/u/6211682?v=3&s=200"];
        NSError *error = nil;
        NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];
        dispatch_async(q_main, ^{
            // メインスレッドでダウンロード完了時になにか処理を実行したいときや
            // 複数ダウンロードの途中経過をメインスレッドで通知したい時などはここに記述
            self.mainImageView.image = [UIImage imageWithData:data];
        });
    });

}

- (void)setImageUserInteractionEnabledNO {
    _mainImageView.userInteractionEnabled = NO;
    NSLog(@"userInteractionEnabledを NO にする。");
    //画面上でわかりやすくするための処理
    self.mainImageView.backgroundColor = [UIColor blueColor];
    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t q_main   = dispatch_get_main_queue();
    dispatch_async(q_global, ^{
        NSURL *url = [NSURL URLWithString:@"https://avatars3.githubusercontent.com/u/6211673?v=3&s=460"];
        NSError *error = nil;
        NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];
        dispatch_async(q_main, ^{
            // メインスレッドでダウンロード完了時になにか処理を実行したいときや
            // 複数ダウンロードの途中経過をメインスレッドで通知したい時などはここに記述
            self.mainImageView.image = [UIImage imageWithData:data];
        });
    });

}

- (void)setImageTapGesture {
    if(_mainImageView.gestureRecognizers.count == 0){
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [_mainImageView addGestureRecognizer:tap];
    }
    //画面上でわかりやすくするための処理
    self.mainImageView.alpha = 1.0;
}

- (void)removeImageTapGesture {
    for( UIGestureRecognizer *gestureReconizer in _mainImageView.gestureRecognizers){
        [_mainImageView removeGestureRecognizer:gestureReconizer];
    }
    //画面上でわかりやすくするための処理
    self.mainImageView.alpha = 0.3;
}

- (void)tapAction:(UIGestureRecognizer *)sender {
    NSLog(@"[%@]\nがタップされました。",sender.view);
}

@end
