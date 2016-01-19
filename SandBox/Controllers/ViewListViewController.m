//
//  ViewListViewController.m
//  SandBox
//
//  Created by 大島 曜 on 2015/05/14.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "ViewListViewController.h"

@interface ViewListViewController ()


@property (nonatomic,retain) NSArray *buttons;

@end

@implementation ViewListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.buttons = @[
                     @{@"title":@"UIViewについて"}
                       ];
    
    NSArray *data = @[
                      @{
                          @"title":@"UIView",
                          @"caption":@"UIViewは画面表示を管理するクラスです。"
                          "画面表示を管理するクラスなので、ラベルやボタンといった各種コントロールのクラスは全てこのUIViewを継承しています。"
                          "各種コントロール部品の最も基本的なクラスです。",
                          
                          @"hierarchy.title":@"UIViewのクラス階層",
                          @"hierarchy":@[@"NSObject",@"UIResponder",@"UIView"],
                          
                          @"create.title":@"生成",
                          @"create.caption":@"// 生成例"
                          "UIView *uv = [[UIView alloc] init];"
                          ""
                          "// サイズを指定しつつ生成の例"
                          "UIView *uv = [[UIView alloc] initWithFrame:CGRectMake(0,0,100,100)];"
                          ""
                          "※サイズに関しては、サイズ指定のCGRect欄をご覧ください。",
                          
                          @"property.title":@"UIViewのプロパティ",
                          @"property":@[
                                  @"【UIViewの主要プロパティ】"
                                  "プロパティ名/型	読専	説明"
                                  "frame"
                                  "（CGRect）		位置とサイズを指定する"
                                  "（例）uv.frame = CGRectMake(0, 0, 100, 80);"
                                  "※CGRectMakeについてはサイズ指定をご覧ください"
                                  "center"
                                  "（CGPoint）		中心位置を指定する"
                                  "（例）uv.center = CGPointMake(200, 300);"
                                  "※CGPointMakeについてはサイズ指定をご覧ください"
                                  "bounds"
                                  "（CGRect）"
                                  "backgroundColor"
                                  "（UIColor）		背景色を設定する"
                                  "（例）uv.backgroundColor = [UIColor blueColor];"
                                  "hidden"
                                  "（BOOL）		表示／非表示を指定する"
                                  "（例）uv.hidden = YES;　//非表示にする"
                                  "（例）uv.hidden = NO;　//表示する"
                                  "autoresizingMask"
                                  "（UIViewAutoresizing）		子要素の自動調整"
                                  "　UIViewAutoresizingFlexibleTopMargin：上を自動調整"
                                  "　UIViewAutoresizingFlexibleBottomMargin：下を自動調整"
                                  "　UIViewAutoresizingFlexibleRightMargin：右を自動調整"
                                  "　UIViewAutoresizingFlexibleLeftMargin：左を自動調整"
                                  "　UIViewAutoresizingFlexibleWidth：幅を自動調整"
                                  "　UIViewAutoresizingFlexibleHeight：高さを自動調整"
                                  "　UIViewAutoresizingNone：自動調整なし"
                                  "contentMode"
                                  "（UIViewContentMode）		サイズ変更時の自動調整の設定"
                                  "　UIViewContentModeScaleToFill：UIViewの大きさに合わせる"
                                  "　UIViewContentModeScaleAspectFit："
                                  "　　　　　縦横比を崩さずにUIViewに合わせる"
                                  "　UIViewContentModeScaleAspectFill："
                                  "　UIViewContentModeCenter：中央"
                                  "　UIViewContentModeTop：上"
                                  "　UIViewContentModeBottom：下"
                                  "　UIViewContentModeRight：右"
                                  "　UIViewContentModeLeft：左"
                                  "　UIViewContentModeTopRight：右上"
                                  "　UIViewContentModeTopLeft：左上"
                                  "　UIViewContentModeBottomRight：右下"
                                  "　UIViewContentModeBottomLeft：左下"
                                  "tag"
                                  "（NSInteger）		UIViewにタグ付けする"
                                  "（例）uv.tag = 1;"
                                  "※いくつかあるボタンを一意に識別したい時などに使えます。"
                                  "alpha"
                                  "（CGFloat）		透過を設定する（0.0(透明) ～1.0(非透明)）"
                                  "（例）uv.alpha = 0.5;　//透明度を50％に設定する"
                                  "superview"
                                  "（UIView）		自分の親のUIViewクラスを取得する"
                                  "subviews"
                                  "（NSArray）		自分の子のUIViewクラスを取得する"
                                  "（子クラスは複数ある可能性があるため、NSArray型で返る）"
                                  "transform"
                                  "（CGAffineTransform）		アフィン変換を指定する"
                                  "アフィン変換を使用することで、画像の回転、縮小、拡大、移動等が簡単に行えます。"
                                  "※以下例文を参照ください。"
                                  "userInteractionEnabled"
                                  "（BOOL）		タッチの検知をするかしないかの設定"
                                  "　YES：タッチの検知をする（デフォルト）"
                                  "　NO：タッチの検知をしない"
                                  "（例）uv.userInteractionEnabled = NO;"
                                  "主要なプロパティのみ掲載しています。"
                                  "　上記「UIViewのクラス階層」にあるクラスのプロパティも使用できます。"
                                  ],
                          @"method.title":@"UIViewのメソッド",
                          @"method":@"【UIViewの主要メソッド】"
                          "メソッド名	説明"
                          "-(void)addSubView:(UIView *)view	サブビューを追加する"
                          "（例）[self.view addSubView:hogeView];"
                          "-(void)drawRect:(CGRect)rect	図形を描画する"
                          "※下記「drawRect例文」を参照ください。"
                          "-(void)sizeToFit	コンテンツの大きさに合わせてUIViewの大きさを変える"
                          "（例）[uv sizeToFit];"
                          "主要なメソッドのみ掲載しています。"
                          "　上記「UIViewのクラス階層」にあるクラスのメソッドも使用できます。",
                          @"exsample.title":@"UIView例文",
                          @"exsample":@""
                          "// UIViewの生成"
                          "UIView *uv = [[UIView alloc] init];"
                          "uv.frame = self.view.bounds;"
                          "uv.backgroundColor = [UIColor redColor];"
                          "[self.view addSubview:uv];"
                          ""
                          ""
                          "// アフィン変換例文"
                          ""
                          "// 回転"
                          "uv.transform = CGAffineTransformMakeRotation(M_PI * 90 / 180.0);  // 90度回転"
                          "uv.transform = CGAffineTransformMakeRotation(M_PI);  // 180度回転"
                          ""
                          "// 拡大・縮小"
                          "uv.transform = CGAffineTransformMakeScale(0.8, 0.5);  // 横0.8倍、縦0.5倍"
                          "uv.transform = CGAffineTransformMakeScale(3.0, 3.0);  // 縦横3倍"
                          ""
                          "// 移動"
                          "uv.transform = CGAffineTransformMakeTranslation(100, -200);  // 右に100px、上に200px移動",
                          @"":@"アニメーションブロック"
                          "iPhone上で画像をアニメーションのように動かしたりする時は、アニメーションブロックを使用すれば簡単に実現できます。"
                          ""
                          "やり方はとても簡単で、動かしたいUIViewオブジェクトの条件をbeginAnimationsとcommitAnimationsで囲ってやればOKです。"
                          "このようにするだけで、始めにあった位置から終了位置までの動きを自動でアニメーションしてくれます。"
                          "条件等は以下サンプルを参照ください。"
                          ""
                          "★アニメーションブロックサンプル"
                          "// まずはアニメーションさせるオブジェクトを生成し、初期位置を指定する"
                          "UIImage *img = [UIImage imageNamed:@\"Sample.png\"];"
                          "UIImageView *iv = [[UIImageView alloc] initWithImage:img];"
                          "iv.frame = CGRectMake(0, 0, 100, 100);  // 100x100サイズのUIImageViewを作成し"
                          "iv.center = CGPointMake(200, 100);  // 200,100の位置に配置する"
                          ""
                          "[UIView beginAnimations:nil context:nil];  // 条件指定開始"
                          "[UIView setAnimationDuration:2.0];  // 2秒かけてアニメーションを終了させる"
                          "[UIView setAnimationDelay:3.0];  // 3秒後にアニメーションを開始する"
                          "[UIView setAnimationRepeatCount:5.0];  // アニメーションを5回繰り返す"
                          "[UIView setAnimationCurve:UIViewAnimationCurveLinear];  // アニメーションは一定速度"
                          "iv.center = CGPointMake(200, 400);  // 終了位置を200,400の位置に指定する"
                          ""
                          "[UIView commitAnimations];  // アニメーション開始！"
                          ""
                          "【UIViewAnimationCurveの種類】"
                          "定数	説明"
                          "UIViewAnimationCurveLinear	一定速度でアニメーションする"
                          "UIViewAnimationCurveEaseIn	徐々に加速するアニメーションをする"
                          "UIViewAnimationCurveEaseOut	徐々に減速するアニメーションをする"
                          "UIViewAnimationCurveEaseInOut	中盤にかけて加速し、終わりにかけて減速するアニメーションをする"
                          "drawRect例文"
                          "UIViewの「-(void)drawRect:(CGRect)rect」メソッド内に以下のような記述をすることにより、"
                          "いろいろな図形を描くことができます。"
                          ""
                          "図形を描く時はコンテキストを取得して、そこに描くという感じで記述します。"
                          ""
                          "// 直線を描画"
                          "CGContextRef context = UIGraphicsGetCurrentContext();  // コンテキストを取得"
                          "CGContextMoveToPoint(context, 30, 30);  // 始点"
                          "CGContextAddLineToPoint(context, 100, 100);  // 終点"
                          "CGContextStrokePath(context);  // 描画！"
                          ""
                          "//四角形を描画"
                          "CGContextRef context = UIGraphicsGetCurrentContext();  // コンテキストを取得"
                          "CGContextStrokeRect(context, CGRectMake(50,50,100,100));  // 四角形の描画"
                          "CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1.0);  // 塗りつぶしの色を指定"
                          "CGContextFillRect(context, CGRectMake(50,50,100,100));  // 四角形を塗りつぶす"
                          ""
                          "// 円を描画"
                          "CGContextRef context = UIGraphicsGetCurrentContext();  // コンテキストを取得"
                          "CGContextStrokeEllipseinRect(context, CGRectMake(50, 50, 100, 100));  // 円の描画"
                          "CGContextFillEllipseInRect(context, CGRectMake(50, 50, 100, 100));  // 円を塗りつぶす"
                          ""
                          "線の太さや色、終端の形を変えたい場合はそれぞれ以下の記述を追加すればOKです。"
                          ""
                          "// 線の太さを指定"
                          "CGContextSetLineWidth(context, 12.0);  // 12ptに設定"
                          ""
                          "// 線の色を指定"
                          "CGContextRGBStrokeColor(context, 0, 0, 1, 1);  // 青色に設定"
                          ""
                          "// 終端の形を指定"
                          "CGContextSetLineCap(context, kCGLineCapRound);  // 丸に設定"
                          ""
                          "【終端の種類】"
                          "定数	説明	イメージ"
                          "kCGLineCapRound	丸い形"
                          "kCGLineCapButt	四角い形"
                          "kCGLineCapSquare	四角形をくっつけた形"
                          },
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
        navigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:navigationController animated:YES completion:^(){
            NSLog(@"%@",self.buttons[sendButton.tag][@"title"]);
        }];
    } else {
        NSLog(@"No Class : %@",self.buttons[sendButton.tag][@"listViewController:"]);
    }
}

/**
 * TOPページに戻る処理
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