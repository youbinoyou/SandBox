//
//  ViewController.m
//  SandBox
//
//  Created by 大島 曜 on 2015/04/10.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "ViewController.h"
#import "CustomAlertController.h"
#import "UtilsViewController.h"
#import "UtilsBlogSearch.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // サスペンド状態から復帰したときに、特定のメソッドがコールされるように指定
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(getUserDefaults)
     name:UIApplicationDidBecomeActiveNotification
     object:nil];
    [self setListButtons];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"Xcode 学習（c）You Ohshima";
    [titleLabel sizeToFit];
    
    if ([self.view isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scrollView = (UIScrollView *)(self.view);
        titleLabel.frame = CGRectMake(0,scrollView.contentSize.height - titleLabel.frame.size.height,[UIScreen mainScreen].applicationFrame.size.width , titleLabel.frame.size.height);
    } else {
        titleLabel.frame = CGRectMake(0,[UIScreen mainScreen].applicationFrame.size.height - titleLabel.frame.size.height,[UIScreen mainScreen].applicationFrame.size.width , titleLabel.frame.size.height);
    }
    
    [self.view addSubview:titleLabel];
}

- (void)setListButtons {
    self.buttons = @[
                     
                     @{@"title":@"Objective-Cについて",
                       @"listViewController:":@"ListObjeciveCViewController"},
                     @{@"title":@"ビューコントローラーについて",
                       @"listViewController:":@"ListUIViewControllerObjectViewController"},
                     @{@"title":@"ナビゲーションコントローラーについて",
                       @"listViewController:":@"ListUINavigationControllerObjectViewController"},
                     @{@"title":@"アラートについて",
                       @"listViewController:":@"ListAlertViewController"},
                     
                     @{@"title":@"ウィンドウについて",
                       @"listViewController:":@"ListWindowViewController"},
                     @{@"title":@"ラベルについて",
                       @"listViewController:":@"ListLabelViewController"},
                     @{@"title":@"テーブルビューコントローラについて",
                       @"listViewController:":@"TableViewControllerListViewController"},
                     @{@"title":@"テーブルビューについて",
                       @"listViewController:":@"TableViewListViewController"},
                     @{@"title":@"文字列装飾について",
                       @"listViewController:":@"ListAttributedStringViewController"},
                     @{@"title":@"例外処理について",
                       @"listViewController:":@"ListExceptionViewController"},
                     @{@"title":@"タブバーについて",
                       @"listViewController:":@"ListTabBarViewController"},
                     @{@"title":@"イメージについて",
                       @"listViewController:":@"ListImageViewController"},
                     @{@"title":@"ピッカービューについて",
                       @"listViewController:":@"PickerViewListViewController"},
                     @{@"title":@"タッチイベントについて",
                       @"listViewController:":@"ListUIResponderObjectViewController"},
                     @{@"title":@"アクティビティビューコントローラについて",
                       @"listViewController:":@"ActivityViewControllerListViewController"},
                     @{@"title":@"スライダーについて",
                       @"listViewController:":@"SliderListViewController"},
                     @{@"title":@"プログレスビューについて",
                       @"listViewController:":@"ProgressViewListViewController"},
                     @{@"title":@"ページコントロールについて",
                       @"listViewController:":@"PageControlListViewController"},
                     
                     @{@"title":@"ステッパーについて",
                       @"listViewController:":@"StepperListViewController"},
                     @{@"title":@"ローカル通知について",
                       @"listViewController:":@"ListUILocalNotificationObjectViewController"},
                     @{@"title":@"ブログデータの扱いについて",
                       @"action":@"blogData"},
                     @{@"title":@"開発管理表",
                       @"listViewController:":@"DevelopmentManagementTableViewController"},
                     @{@"title":@"トースト",
                       @"action":@"toast"},
                     @{@"title":@"設定（アプリ側）",
                       @"action":@"settingsBundle:"},
                     @{@"title":@"オリジナルキーボード",
                       @"listViewController:":@"ListCustomKeyboardsViewController"
                       },
                     @{@"title":@"ゲーム",
                       @"listViewController:":@"WordWorfGameViewController"
                       },
                     @{@"title":@"ステータス",
                       @"listViewController:":@"GameStatusViewController"
                       },
                     @{@"title":@"ショッピング",
                       @"action":@"shopping"
                       },
                     @{@"title":@"設定",
                       @"listViewController:":@"SettingContentsViewController"},
                     /*
                      @{@"title":@"CustomAlert",@"action":@"newCustomAlert:"},
                      @{@"title":@"ActionSheet",@"action":@"newCustomActionSheet:"},
                      */
                     ];
    [self setButtons];
}

- (void)toast {
    [UtilsViewController showToastMessage:@"トースト" duration:1.0 displayDuration:5.0
                              actionStart:nil actionFinish:nil];
}

- (void)settingsBundle:(id)sender
{
    [self getUserDefaults];
}

- (void)blogData {
   UtilsBlogSearch *blogSearch = [[UtilsBlogSearch alloc] init];
    if ([blogSearch requestXml:@"http://www.sotechsha.co.jp/xml/sample.xml"]) {
        
        NSLog(@"titleList : %@",[blogSearch titleList]);
    }
}

- (void)shopping {
    id viewController = [UtilsViewController getTransitionModalViewController:@"CustomShopping"
                                 withStortboardIdentifier:nil];
    [self presentViewController:viewController animated:YES completion:^(void){
        
    }];
    //[self.navigationController pushViewController:viewController animated:YES];
}

- (void)getUserDefaults{
    
    //変更された設定をデータベースに反映
    [NSUserDefaults resetStandardUserDefaults];
    
    ///// タイトル /////
    //設定アプリで設定されているタイトルの値を取得
    NSString *labelTitleString = [self retrieveFromUserDefaults:@"title_preference"];
    NSLog(@"%@",labelTitleString);
    
    NSString *labelNameString = [self retrieveFromUserDefaults:@"name_preference"];
    NSLog(@"%@",labelNameString);
    
    ///// ラベル色の設定 /////
    
    //設定アプリで設定されているラベル色の値を取得
    NSString *labelColorString = [self retrieveFromUserDefaults:@"label_color_preference"];
    
    // 設定値を画面に表示
    //valueLabel01.text = NSLocalizedString(labelColorString, nil);
    
    // 設定された値から、UIColorを作成
    UIColor *labelColor;
    
    if ([labelColorString compare:@"Black"] == NSOrderedSame){
        labelColor = [UIColor blackColor];
    }
    if ([labelColorString compare:@"Gray"] == NSOrderedSame){
        labelColor = [UIColor grayColor];
    }
    if ([labelColorString compare:@"White"] == NSOrderedSame){
        labelColor = [UIColor whiteColor];
    }
    
    // 各ラベルの色を変更
    //titleLabel01.textColor = labelColor;
    //titleLabel02.textColor = labelColor;
    //titleLabel03.textColor = labelColor;
    
    //valueLabel01.textColor = labelColor;
    //valueLabel02.textColor = labelColor;
    //valueLabel03.textColor = labelColor;
    
    
    //設定アプリのデータにアクセスするために、NSUserDefaultsを作成
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    ///// 画面の明るさ設定 /////
    
    //設定アプリで設定されている画面の明るさ設定値を取得
    NSInteger brightness = [defaults integerForKey:@"brightness_preference"];
    NSLog(@"%ld",brightness);
    // 設定値を画面に表示
    //valueLabel02.text = [NSString stringWithFormat:@"%d",brightness];
    
    // 画面の明るさを変更
    // self.view.alpha = (float)brightness / 100.0;
    
    
    ///// ツールバーの表示設定 /////
    
    //設定アプリで設定されているツールバー表示設定値を取得
    BOOL toolbarSW = [defaults boolForKey:@"show_preference"];
    
    // 設定値を画面に表示
    if ( toolbarSW == YES ) {
    //    valueLabel03.text = @"ON";
    }else{
    //    valueLabel03.text = @"OFF";
    }
    
    // ツールバーの表示状態を変更
    //toolbar01.hidden = !toolbarSW;
}

- (id)retrieveFromUserDefaults:(NSString*)key
{
    id idVal;
    
    //設定アプリのデータにアクセスするために、NSUserDefaultsを作成
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //指定されたキーのオブジェクトを取得
    if (defaults) {
        idVal = [defaults objectForKey:key];
    } else {
        idVal = nil;
    }
    
    //アプリインストール直後は、アプリから各設定値を取得できず、一旦手動で設定値を
    //変更すると、アプリから各設定値を取得可能となる。
    //この問題を解決するために、以下の処理を行う。
    
    //オブジェクトがない場合はRoot.plistファイルから読み込んで値を設定する。
    if (idVal == nil) {
        
        //バンドルパスを取得
        NSString *bPath = [[NSBundle mainBundle] bundlePath];
        NSString *settingsPath = [bPath stringByAppendingPathComponent:@"Settings.bundle"];
        NSString *plistFile = [settingsPath stringByAppendingPathComponent:@"Root.plist"];
        
        //Root.plistの設定ディクショナリから、設定項目の配列を取得
        NSDictionary *settingsDictionary = [NSDictionary dictionaryWithContentsOfFile:plistFile];
        NSArray *preferencesArray = [settingsDictionary objectForKey:@"PreferenceSpecifiers"];
        
        //項目の数分ループ
        NSDictionary *item;
        for(item in preferencesArray)
        {
            //項目のキーを取得
            NSString *keyValue = [item objectForKey:@"Key"];
            
            //ファイルで指定されている項目のデフォルト値を取得
            id defaultValue = [item objectForKey:@"DefaultValue"];
            
            if (keyValue && defaultValue) {
                [defaults setObject:defaultValue forKey:keyValue];
                if ([keyValue compare:key] == NSOrderedSame) {
                    idVal = defaultValue;
                }
            }
        }
        [defaults synchronize];
    }
    return idVal;
}



@end
