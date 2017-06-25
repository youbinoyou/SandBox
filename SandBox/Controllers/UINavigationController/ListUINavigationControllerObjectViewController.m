//
//  ListUINavigationControllerObjectViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/12/03.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import "ListUINavigationControllerObjectViewController.h"

@interface ListUINavigationControllerObjectViewController ()

@end

@implementation ListUINavigationControllerObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setListButtons];
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        [self navigationBarTintColor];
        //viewControllerで制御することを伝える。iOS7 からできたメソッド
        [self setNeedsStatusBarAppearanceUpdate];
    }

}

- (void)setListButtons {
    self.buttons = @[
                     @{
                         keyTitle : @"ナビゲーションバーをカスタマイズする",
                         keyAction : @"navigationBarTintColor:",
                         },
                     @{
                         keyTitle : @"ナビゲーションバーをカスタマイズする",
                         keyLink : @"http://qiita.com/yimajo/items/7051af0919b5286aecfe",
                         },
                     ];
    [self setButtons];
}

- (void)navigationBarTintColor {
    [UINavigationBar appearance].barTintColor = [UIColor colorWithRed:0.000 green:0.549 blue:0.890 alpha:1.000];
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    //タイトルをカスタマイズする
    /* 
     * 次に、タイトルの文字色を変える。
     * iOS7ではUITextAttributeTextColorは非推奨になった。NSForegroundColorAttributeNameが使える。
     */
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    //ステータスバーの文字色を一括で変更したい
    /*
     * ステータスバーの文字色もコードで白に出来る。
     * ただしinfo.plistで”View controller-based status bar”をNOにしておく必要がある。
     */
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    //ステータスバーのスタイルをViewController毎に変えたい場合
    
    /*
     * アプリ全体を一括で変えたくない場合、info.plistで”View controller-based status bar”をYESにしておくと、UIViewControllerでステータスバーのスタイルを動的に変更することができる。
     * //下の2つのメソッドを呼び出す事を伝える
     * - (void)setNeedsStatusBarAppearanceUpdate;
     * //オーバーライドしてスタイル指定
     * - (UIStatusBarStyle)preferredStatusBarStyle;
     * //オーバーライドして非表示かどうかを選択
     * - (BOOL)prefersStatusBarHidden;
     */
}

/*
setNeedsStatusBarAppearanceUpdateメソッドを実行した際に、preferredStatusBarStyleと、prefersStatusBarHiddenメソッドが実行されるのでそれぞれをオーバーライドしてスタイルの変更や非表示選択を行える。
 */

- (BOOL)prefersStatusBarHidden {
    //YESでステータスバーを非表示（NOなら表示）
    return YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    //文字を白くする
    return UIStatusBarStyleLightContent;
}
/*
 動的にステータスバーの表示・非表示を切り替える
 
 ボタン押下時にステータスバーを非表示にする場合、フラグを作ってそれをYESにする方法がiOS7 Tech Talkで紹介されていた。
 @property BOOL shouldBeHidingStatusBar;
 
 - (BOOL)prefersStatusBarHidden
 {
 return self.shouldBeHidingStatusBar;
 }
 
 - (IBAction)hideStatusBar
 {
 self.shouldBeHidingStatusBar = YES;
 [self setNeedsStatusBarAppearanceUpdate];
 }
 さらにステータスバーをアニメーションさせたい場合は、setNeedsStatusBarAppearanceUpdateをUIViewのanimateWithDuration:animations:メソッドでblocksに入れ、preferredStatusBarUpdateAnimationメソッドをオーバーライドしてUIStatusBarAnimationを指定する。
 - (IBAction)hideStatusBar
 {
 self.shouldBeHidingStatusBar = YES;
 [UIView animateWithDuration:0.5 animations:^{
 [self setNeedsStatusBarAppearanceUpdate];
 }];
 }
 
 //スライドするアニメーションを指定
 - (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
 {
 return UIStatusBarAnimationSlide;
 }
 UINavigationControllerがあり、ViewController毎にスタイルを変えたい場合、
 
 ステータスバーのスタイル変更（色を白にしたいなど）は、UINavigationControllerがあると途端にややこしくなる。
 まずUINavigationControllerがある場合の基本動作を把握しておく
 基本動作
 
 UINavigationControllerのchildViewControllerForStatusBarStyleが動作しnilを返す。
 nilの場合、自身(UINavigationController)のpreferredStatusBarStyleが動作。
 preferredStatusBarStyleはUIStatusBarStyleDefault（つまり黒）を返す
 nilを返されて各ViewControllerのpreferredStatusBarStyleが動作しない
 UINavigationControllerに紐づけてある各ViewControllerのpreferredStatusBarStyleが動作しないので、何が起こっているのか非常にわかりづらいし、コンテナであるUINavigationController自体で問題解決しないといけないとはなかなか気づけなかった。以下が解決方法。
 解決方法1. ナビゲーションバーのスタイルを変える
 
 各ViewControllerでnavigationBar.barStyle = UIBarStyleBlack;とする
 UINavigationControllerはスタイルが黒のときステータスバーを白になる
 解決方法2. UINavigationControllerを継承かカテゴリで動作を変える
 
 UINavigationControllerのchildViewControllerForStatusBarStyleをオーバーライドして表示しているViewControllerを返す
 各ViewControllerでpreferredStatusBarStyleをオーバーライドしスタイルを変える
 UINavigationControllerをカテゴリでオーバーライドする例
 #import "UINavigationController+StatusBarCustom.h"
 
 @implementation UINavigationController  (StatusBarCustom)
 
 - (UIViewController *)childViewControllerForStatusBarStyle
 {
 // デフォルトこいつはnilが返るので表示されたものを返すようにする
 return self.visibleViewController;
 }
 @end
 個別のViewControllerでpreferredStatusBarStyleが動作するのでステータスバーの色を白にする
 - (UIStatusBarStyle)preferredStatusBarStyle {
 //文字を白くする
 return UIStatusBarStyleLightContent;
 }
 解決方法の選定
 
 そもそもUINavigationControllerのchildViewControllerForStatusBarStyleがデフォルトでnilを返している基本動作がおかしい気がする。同じコンテナのUITabBarControllerはnilを返しておらず、タブが選択されたViewControllerを返していて理にかなっているし、そのおかげでコンテナに邪魔されない。もしコンテナで一括で変えたい場合などはそこで設定すればいいと考えられるので自然じゃないかな。
 そのため、解決方法2についてはカテゴリで既存の動作をオーバーライドするのも悪くない手ではないかと思う。むしろこういう時こそカテゴリでUIKitをオーバーライドすべきじゃないかなとすら思う。すでにアプリの設計上UINavigationControllerを継承で作りきっているならカテゴリ使う必要ないよねってな感想。
 解決方法1については、UINavigationBarを黒にすることでたまたまステータスバーが白くなることを利用している風に感じてしまう。UINavigaitonBarに画像やTintColorを設定しなければほんとに黒くなるので、そうしたい場合には理にかなっているが、黒と設定しているが見た目が黒じゃないということ自体には人の書いたコードを保守する目線で見ると辛い。
 ナビゲーションバーの非表示と同時にステータスバーを非表示にする
 
 UINavigationControllerのsetNavigationBarHidden:animated:メソッドを使いナビゲーションコントローラを非表示にしようとする場合、ステータスバー更新のためのUIViewControllerのsetNeedsStatusBarAppearanceUpdateメソッドを使う必要がない。
 //フルスクリーンにするメソッドを作る
 //ナビゲーションバーとステータスバーを非表示にしたい
 - (void)changeFullScreen
 {
 //ここでナビゲーションバーを非表示にするが
 //同時にステータスバー更新のメソッドも呼ばれる
 [self.navigationController setNavigationBarHidden:YES animated:YES];
 
 //以下は意味なし
 //ここでステータスバーの更新を呼んでも2度手間になる
 //    [self setNeedsStatusBarAppearanceUpdate];
 }
 分かってないこと
 
 MFMailComposeViewControllerでメールのモーダルの画面を立ち上げるとステータスバーの文字色が黒色（デフォルト）になってしまいコントロール出来ない...
 SKStoreProductViewControllerでAppStoreを表示するモーダルの場合は、ナビゲーションバーのtintColorをコントロールする方法をしりたい…
*/

@end
