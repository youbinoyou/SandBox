//
//  ListNSErrorObjectViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2016/05/30.
//  Copyright © 2016年 大島 曜. All rights reserved.
//

#import "ListNSErrorObjectViewController.h"
#import "UtilsViewController.h"

@interface ListNSErrorObjectViewController ()

@end

@implementation ListNSErrorObjectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setListButtons];
}

- (void)setListButtons
{
    self.buttons = @[
                     @{@"title":@"エラー",
                       },
                     @{@"title":@"NSError",@"action":@"showError"},
                     @{@"title":@"例 Error",@"action":@"exampleError"},
                     @{@"title":@"オリジナルError",@"action":@"showOriginalError"},
                     ];
    
    [self setButtons];
}

- (void)showError {
    NSError *error = [NSError new];
    NSLog(@"[[%@]]\n",NSStringFromClass([error class]));
}

- (void)showOriginalError
{
    
    /**
     * [ domain ]
     * バンドルIDのような 逆順DNS を設定
     * NSString型文字列
     */
    NSString *errorDomain = @"you.ohshima.SandBox";

    /**
     * [ code ]
     * Error codeを設定
     * NSInteger型数値
     * ※ プロジェクトでErrorコードが設定されてる時はこちらを設定
     */
    NSInteger errorCode = 12345;
    
    /**
     *
     * userInfo
     * 2つのキーを設定
     * ・NSLocalizedDescriptionKey
     * ・NSLocalizedRecoverySuggestionErrorKey
     * NSDictionary型 ディレクトリ
     * ※ NSLocalizedRecoverySuggestionErrorKey は不要なら省略可
     */
    NSDictionary *errorUserInfo = @{
                                    NSLocalizedDescriptionKey: @"Error Description",
                                    NSLocalizedRecoverySuggestionErrorKey: @"Error Suggestion" //省略化
                                    };
    NSError *error = [[NSError alloc] initWithDomain:errorDomain code:errorCode userInfo:errorUserInfo];

    [self showError:error];
/*
 NSError
 
 エラー処理に使うNSErrorのお勉強。
 Apple: Error Handling Programming Guide
 Apple: NSError Class Reference
 
 NSErrorには3つのプロパティがある。
 – code
 – localizedDescription
 – localizedSuggestion
 NSErrorにエラーメッセージを設定する
 
 NSErrorを使う
 
 NSErrorインスタンスにnilを設定。
 処理関数に参照渡し。
 処理関数内でエラーがあれば参照エラーへNSErrorを設定する。
 処理側関数。
 */
}

- (void)exampleError
{
    //NSErrorインスタンスに nil を設定
    NSError *error = nil;
    NSString *successMessage = [self successMessage:@"Success Message" didFailWithError:error];
    
    if (error) {
        // error処理
        [self showError:error];
    }
    if (successMessage) {
        [UtilsViewController showToastOnViewController:self
                                               message:successMessage
                                         animationType:ToastViewControllerAnimationTypeCenter];
    }
}

- (void)showError:(NSError *)error
{
    if (error) {
        NSLog(@"[[%@]]\n%@",NSStringFromClass([error class]),error);
    } else {
        NSLog(@"[[%@]]\n",NSStringFromClass([error class]));
    }
}

- (NSString *)successMessage:(NSString *)message didFailWithError:(NSError *)error
{
    NSString *successMessage = message;
    
    if (error) {
        return nil;
    }
    
    return successMessage;
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
