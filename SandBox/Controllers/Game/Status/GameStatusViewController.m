//
//  GameStatusViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2016/01/19.
//  Copyright © 2016年 大島 曜. All rights reserved.
//

#import "GameStatusViewController.h"

@interface GameStatusViewController ()<UITextFieldDelegate,UIScrollViewDelegate> {
    NSDictionary *status;
    int statusSelectIndex;
}

@property (nonatomic,retain) IBOutletCollection(UIView) NSMutableArray *paramViews;

@end

@implementation GameStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.paramViews = [NSMutableArray array];
    NSArray *dataArray;
    dataArray = @[
                  @{ @"Number" : @(5) , @"String" : @"A" } ,
                  @{ @"Number" : @(4) , @"String" : @"B" } ,
                  @{ @"Number" : @(3) , @"String" : @"C" } ,
                  @{ @"Number" : @(2) , @"String" : @"A" } ,
                  @{ @"Number" : @(1) , @"String" : @"B" } ,
                  @{ @"Number" : @(0) , @"String" : @"C" } ,
                  ];
    //ソート対象となるキーを指定した、NSSortDescriptorの生成
    NSSortDescriptor *sortDescNumber;
    sortDescNumber = [[NSSortDescriptor alloc] initWithKey:@"Number" ascending:YES];
    
    // NSSortDescriptorは配列に入れてNSArrayに渡す
    NSArray *sortDescArray;
    sortDescArray = [NSArray arrayWithObjects:sortDescNumber, nil];
    
    // ソートの実行
    NSArray *sortArray;
    sortArray = [dataArray sortedArrayUsingDescriptors:sortDescArray];
    
    NSLog(@"%@",sortArray);
    
    //ソート対象となるキーを指定した、NSSortDescriptorの生成
    NSSortDescriptor *sortDescString;
    sortDescString = [[NSSortDescriptor alloc] initWithKey:@"String" ascending:YES];
    
    // NSSortDescriptorは配列に入れてNSArrayに渡す
    sortDescArray = [NSArray arrayWithObjects:sortDescString, nil];
    
    // ソートの実行
    sortArray = [dataArray sortedArrayUsingDescriptors:sortDescArray];
    
    NSLog(@"%@",sortArray);
    
    //ソート対象となるキーを指定した、NSSortDescriptorの生成
    sortDescString = [[NSSortDescriptor alloc] initWithKey:@"String" ascending:YES];
    sortDescNumber = [[NSSortDescriptor alloc] initWithKey:@"Number" ascending:YES];
    
    // NSSortDescriptorを配列にセット @"String"->@"Number"の順にソートする
    sortDescArray = [NSArray arrayWithObjects:sortDescString, sortDescNumber, nil];
    
    // ソートの実行
    sortArray = [dataArray sortedArrayUsingDescriptors:sortDescArray];

    NSLog(@"%@",sortArray);
    //ソート対象となるキーを指定した、NSSortDescriptorの生成
    sortDescNumber = [[NSSortDescriptor alloc] initWithKey:@"Number" ascending:YES];
    sortDescString = [[NSSortDescriptor alloc] initWithKey:@"String" ascending:YES];
    
    // NSSortDescriptorを配列にセット @"Number"->@"String"の順にソートする
    sortDescArray = [NSArray arrayWithObjects:sortDescNumber,sortDescString,  nil];
    
    // ソートの実行
    sortArray = [dataArray sortedArrayUsingDescriptors:sortDescArray];
    
    NSLog(@"%@",sortArray);

    
    // Do any additional setup after loading the view.
    /*
    NSDictionary *status = @{
                             @"名前":@"あい うえお",
                             @"LV":@"20",
                             @"体力":@"120",
                             @"近接":@"185",
                             @"遠隔":@"177",
                             @"防御力":@"253",
                             @"属性":@[@{@"毒":@"30"},@{@"毒":@"10"}],
                             @"テンション":@{@"min":@"3",@"max":@"5"},
                             @"サポート":@[@{@"アシスト":@""}],
                             @"ターゲット":@[@{@"小型一筋":@""}],
                             @"出撃状態":@[@{@"おとも２":@""}],
                             @"毛並み":@[@{@"ワントーン":@""}],
                             @"コメント":@[@{@"舞台クルパのヒロイン":@""}],
                             };
    // 一旦NSDictionaryのキーを取得
    NSArray *keys = [status allKeys];
    
    // sortedArrayUsingComparatorを使ってソート
    keys = [keys sortedArrayUsingComparator:^(id o1, id o2) {
        NSLog(@"%@ : %@",o1,o2);
        return [o1 compare:o2];
    }];
    
    NSLog(@"%@",keys);
    
    CGRect paramRect = CGRectZero;
    paramRect.origin.y = [UIScreen mainScreen].applicationFrame.origin.y;
    paramRect.size.width = 200;
    paramRect.size.height = 44;
    //for (int i = 0; i < [[status allKeys] count]; i++) {
    // 順番通りに値を取得
    for (id key in keys) {
        UILabel *label = [[UILabel alloc] init];
        label.text = key;
        paramRect.origin.y += paramRect.size.height;
        label.frame = paramRect;
        [self.view addSubview:label];
    }
     */
    status = @{
               @"keys" : @[
                       @"名前",
                       @"LV",
                       @"体力",
                       @"近接",
                       @"遠隔",
                       @"防御力",
                       @"属性",
                       @"テンション",
                       @"サポート",
                       @"ターゲット",
                       @"出撃状態",
                       @"毛並み",
                       @"コメント",
                       ],
               @"名前":@"あい うえお",
               @"LV":@"20",
               @"体力":@"120",
               @"近接":@"185",
               @"遠隔":@"177",
               @"防御力":@"253",
               @"属性":@[@{@"毒":@"30"},@{@"毒":@"10"},@{@"毒":@"40"},@{@"毒":@"20"}],
               @"テンション":@{@"min":@"3",@"max":@"5"},
               @"サポート":@[@{@"アシスト":@""}],
               @"ターゲット":@[@{@"小型一筋":@""}],
               @"出撃状態":@[@{@"おとも２":@""}],
               @"毛並み":@[@{@"ワントーン":@""}],
               @"コメント":@[@{@"舞台クルパのヒロイン":@""}],
               };
    
    CGRect paramRect = CGRectZero;
    paramRect.origin.y = [UIScreen mainScreen].applicationFrame.origin.y;
    paramRect.size.height = 44;
    //for (int i = 0; i < [[status allKeys] count]; i++) {
    // 順番通りに値を取得
    for (int i = 1 ;i < [status allKeys].count ; i++) {
        UIView *paramView = [[UIView alloc] init];
        paramView.tag = i;
        paramView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0.6 alpha:0.4];
        paramRect = CGRectMake(0, paramRect.origin.y, [UIScreen mainScreen].bounds.size.width, paramRect.size.height);
        paramRect.origin.y += paramRect.size.height;
        paramView.frame = paramRect;
        // タイトルラベル
        UILabel *paramLabel = [[UILabel alloc] init];
        paramLabel.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
        paramLabel.tag = i;
        paramLabel.text = [self keyStatusIndex:i - 1];
        paramRect.size.width = 100;
        paramLabel.frame = CGRectMake(0, 0, paramRect.size.width, paramRect.size.height);
        [paramView addSubview:paramLabel];
        // テキストラベル
        UILabel *paramTextLabel = [[UILabel alloc] init];
        paramTextLabel.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
        paramTextLabel.tag = i;
        NSString *paramText = [NSString stringWithFormat:@"%@", status[[self keyStatusIndex:i - 1]]];
        NSString *paramKey = [self keyStatusIndex:i - 1];
        paramText = [self stringStatusSearchKey:paramKey];
        paramTextLabel.text = paramText;
        CGFloat paramTextLabelWidth = [UIScreen mainScreen].bounds.size.width - paramLabel.frame.size.width;
        paramTextLabel.frame = CGRectMake(paramLabel.frame.size.width, 0, paramTextLabelWidth, paramRect.size.height);
        [paramView addSubview:paramTextLabel];
        
        [self.view addSubview:paramView];
        SEL action = NSSelectorFromString(@"tapParamView:");
        UITapGestureRecognizer *tapGestureRecognizer =
        [[UITapGestureRecognizer alloc] initWithTarget:self action:action];
        [paramView addGestureRecognizer:tapGestureRecognizer];
        [self.paramViews addObject:paramView];
    }
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //ノーティフィケーションの準備
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    // キーボード表示・非表示時のイベント登録
    [notificationCenter addObserver:self
                           selector:@selector(handleKeyboardWillShowNotification:)
                               name:UIKeyboardWillShowNotification
                             object:nil];
    [notificationCenter addObserver:self
                           selector:@selector(handleKeyboardWillHideNotification:)
                               name:UIKeyboardWillHideNotification
                             object:nil];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //ノーティフィケーションの準備
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    // キーボード表示・非表示時のイベント削除
    [notificationCenter removeObserver:self
                                  name:UIKeyboardWillShowNotification
                                object:nil];
    [notificationCenter removeObserver:self
                                  name:UIKeyboardWillHideNotification
                                object:nil];
}

//キーボード表示
- (void)handleKeyboardWillShowNotification:(NSNotification *)notification {
    
    // キーボードの top を取得する
    NSDictionary *userInfo = [notification userInfo];
    CGRect rectKeyboard = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    rectKeyboard = [self.view convertRect:rectKeyboard fromView:nil];
//    CGPoint contentOffset = scrollView.frame.origin;
//    contentOffset.y = scrollView.frame.size.height - keyboardRect.origin.y;
//    scrollView.contentOffset = contentOffset;
    CGSize rectScrollViewContentSize = CGSizeZero;
    NSLog(@"%@",NSStringFromCGSize(rectScrollViewContentSize));
    CGPoint rectScrollViewContentOffset = CGPointZero;
    UIScrollView *scrollView = nil;
    UITextField *textField = nil;
    for (UIView *view in [self.view subviews]) {
        if ([view isKindOfClass:[UIScrollView class]]) {
            scrollView = (UIScrollView *)view;
        }
        if ([view isKindOfClass:[UITextField class]]) {
            textField = (UITextField *)view;
        }
    }

    NSLog(@"textField : %@",NSStringFromCGRect(textField.frame));
    NSLog(@"keyboard : %@",NSStringFromCGRect(rectKeyboard));
    // キーボードよりも上にTextFieldがある場合
    if (textField.frame.origin.y - rectKeyboard.origin.y < -(textField.frame.size.height * 3)) {
        NSLog(@"%lf",textField.frame.origin.y - rectKeyboard.origin.y);
        CGRect rectTextField = textField.frame;
        rectTextField.origin.y = rectKeyboard.origin.y - textField.frame.size.height;
        textField.frame = rectTextField;
        textField.alpha = 1.0;
    } else {
        CGRect rectTextField = textField.frame;
        rectTextField.origin.y = rectKeyboard.origin.y - textField.frame.size.height;
        textField.frame = rectTextField;
        textField.alpha = 1.0;
        rectScrollViewContentOffset.y = [UIScreen mainScreen].applicationFrame.size.height - rectKeyboard.origin.y + (textField.frame.origin.y - rectKeyboard.origin.y) + 10 - 2;
        scrollView.contentOffset = rectScrollViewContentOffset;
    }
    
//    rectScrollViewContentOffset = [UIScreen mainScreen].applicationFrame.origin;
//    rectScrollViewContentOffset.y = [UIScreen mainScreen].applicationFrame.size.height - rectKeyboard.origin.y;
//    NSLog(@"textField : %@",NSStringFromCGPoint(textField.frame.origin));
//    NSLog(@"rectKeyboard : %@",NSStringFromCGPoint(rectKeyboard.origin));
//    NSLog(@"scrollView : %@",NSStringFromCGPoint(rectScrollViewContentOffset));
//    //rectScrollViewContentSize = rectKeyboard.size;
//    //scrollView.contentSize = rectScrollViewContentSize;
}

//キーボード非表示
- (void)handleKeyboardWillHideNotification:(NSNotification *)notification {
    
    //self.scrollView.height = self.view.frame.size.height-self.scrollView.frame.origin.y;
    for (UIView *view in [self.view subviews]) {
        if ([view isKindOfClass:[UITextField class]]) {
            UITextField *textField = (UITextField *)view;
            textField.alpha = 0.0;
            NSLog(@"textField : %ld : %@",textField.tag,textField.text);
            NSInteger index = textField.tag - (NSInteger)1;
            //id item = status[[self keyStatusIndex:index]];
            NSString *key = [self keyStatusIndex:index];
            NSLog(@"%@ : %@",key , textField.text);
            [self changeStatus:key valueString:textField.text index:index];
            [textField removeFromSuperview];
            [textField resignFirstResponder];
        }
    }

}

- (void)changeStatus:(NSString *)key valueString:(NSString *)value index:(NSInteger)index{
    id checkItem = status[key];
    if (![checkItem isKindOfClass:[NSString class]]) {
        return;
    }
    NSMutableDictionary *mStatus = [status mutableCopy];
    [mStatus setObject:value forKey:key];
    status = [mStatus copy];
    for (UIView *cView in [self.paramViews[index] subviews]) {
        if ([cView isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel*)cView;
            if ([label.text isEqualToString:key]) {
                
            } else {
                label.text = value;
            }
        }
        NSLog(@"%@",cView);
    }

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // scroll領域取得
    NSLog(@"%f %f", scrollView.contentOffset.x,scrollView.contentOffset.y);
}


- (void)tapParamView:(UITapGestureRecognizer *)tapGestureRecognizer {
    UIView *tapParamView = tapGestureRecognizer.view;
    statusSelectIndex = (int)tapParamView.tag;
    
    id item = status[[self keyStatusIndex:statusSelectIndex - 1]];
    // テキストとして取り出す
    NSString *paramText = [NSString stringWithFormat:@"%@", item];
    // キーを取り出す
    NSString *paramKey = [self keyStatusIndex:statusSelectIndex - 1];
    // パラメータのテキストを表示する
    paramText = [self stringStatusSearchKey:paramKey];
    NSLog(@"%@",paramText);
    
    [self stringActionView:tapParamView beforeString:paramText];
    
    //タップした時のアニメーション
    for (UIView *paramView in self.paramViews) {
        if (tapParamView != paramView) {
            paramView.alpha = 0.8;
        } else {
            paramView.alpha = 1.0;
        }
    }
}

- (void)stringActionView:(UIView *)sender beforeString:(NSString *)beforeString {
    for (UIView *view in [self.view subviews]) {
        if ([view isKindOfClass:[UITextField class]]) {
            UITextField *textField = (UITextField *)view;
            textField.alpha = 0.0;
            [textField removeFromSuperview];
            [textField resignFirstResponder];
        }
    }
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.delegate = self;
    scrollView.frame = self.view.frame;
    for (UIView *view in [self.view subviews]) {
        if (view == scrollView) {
            
        } else {
            [scrollView addSubview:view];
        }
    }
    [self.view addSubview:scrollView];
    
    
    UIButton *clearBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    //[clearBtn setBackgroundImage:[UIImage imageNamed:@"icon_close"] forState:UIControlStateNormal];
    [clearBtn setTitle:@"(OK)" forState:UIControlStateNormal];
    [clearBtn addTarget:self action:@selector(clearText:) forControlEvents:UIControlEventTouchUpInside];
    UITextField *textField = [[UITextField alloc] init];
    // textFieldの右に×ボタンを置く
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.rightView = clearBtn;
    // 常に表示されるように設定する。
    textField.rightViewMode = UITextFieldViewModeAlways;
    
    textField.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    CGRect rectTextField = [UIScreen mainScreen].applicationFrame;
    rectTextField.size.height = 44;
    rectTextField.origin.y = [UIScreen mainScreen].applicationFrame.size.height;
    textField.frame = sender.frame;
    textField.tag = sender.tag;
    textField.text = beforeString;
    textField.delegate = self;
    textField.alpha = 0.0;
    [self.view addSubview:textField];
    [self.view sendSubviewToBack:scrollView];
    NSLog(@"%@",NSStringFromCGRect(sender.frame));
    NSLog(@"%@",NSStringFromCGRect(scrollView.frame));
    NSLog(@"%@",NSStringFromCGRect(textField.frame));
    [textField becomeFirstResponder];
}

- (void)clearText:(id)sender {
    UIScrollView *scrollView = nil;
    UITextField *textField = nil;
    for (UIView *view in [self.view subviews]) {
        if ([view isKindOfClass:[UIScrollView class]]) {
            scrollView = (UIScrollView *)view;
        }
        if ([view isKindOfClass:[UITextField class]]) {
            textField = (UITextField *)view;
        }
    }
    [textField resignFirstResponder];
}

// UITxtFieldDelegate
// 改行ボタンが押された際に呼ばれる。
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [textField resignFirstResponder];
}

- (void)ok {
    NSLog(@"確認しました");
}

// TODO:Util
- (NSString *)stringItemWithItems:(NSArray *)items{
    NSString *stringItem = @"";
    NSInteger i = 0;
    for (NSDictionary *item in items) {
        stringItem = [stringItem stringByAppendingFormat:@"%@:%@",
                        [item allKeys][i],
                        [item allValues][i]
                        ];
    }
    return stringItem;
}

- (NSString *)stringStatusSearchKey:(NSString *)key {
    NSString *stringStatus = @"";
    id statusItem = status[key];
    if ([statusItem isKindOfClass:[NSString class]]) {
        stringStatus = status[key];
    }
    if ([key isEqualToString:@"名前"]) {
        stringStatus = status[key];
    }
    if ([key isEqualToString:@"LV"]) {
        stringStatus = status[key];
    }
    if ([key isEqualToString:@"体力"]) {
        stringStatus = status[key];
    }
    if ([key isEqualToString:@"近接"]) {
        stringStatus = status[key];
    }
    if ([key isEqualToString:@"遠隔"]) {
        stringStatus = status[key];
    }
    if ([key isEqualToString:@"防御力"]) {
        stringStatus = status[key];
    }
    if ([key isEqualToString:@"属性"]) {
        NSArray *attributes = status[key];
        stringStatus = [self stringItemWithItems:attributes];
    }
    if ([key isEqualToString:@"テンション"]) {
        stringStatus = @"";
        NSDictionary *tension = status[key];
        NSString *minString = tension[@"min"];
        NSString *maxString = tension[@"max"];
        NSInteger min = [minString integerValue];
        NSInteger max = [maxString integerValue];
        for (NSInteger i = 0; i < max; i++) {
            if (i < min) {
                stringStatus = [stringStatus stringByAppendingString:@"■"];
            } else {
                stringStatus = [stringStatus stringByAppendingString:@"□"];
            }
        }
    }
    
    if ([key isEqualToString:@"サポート"]) {
        NSArray *supports = status[key];
        stringStatus = [self stringItemWithItems:supports];

    }
    if ([key isEqualToString:@"ターゲット"]) {
        NSArray *targets = status[key];
        stringStatus = [self stringItemWithItems:targets];
    }
    if ([key isEqualToString:@"出撃状態"]) {
        NSArray *sortieStates = status[key];
        stringStatus = [self stringItemWithItems:sortieStates];
    }
    if ([key isEqualToString:@"毛並み"]) {
        NSArray *furStates = status[key];
        stringStatus = [self stringItemWithItems:furStates];
    }
    if ([key isEqualToString:@"コメント"]) {
        NSArray *coments = status[key];
        stringStatus = [self stringItemWithItems:coments];
    }
    return stringStatus;
}

- (NSString *)keyStatusIndex:(NSInteger)index {
    NSArray *statusKeys = status[@"keys"];
    return statusKeys[index];
    /*
     NSString *key = nil;
    switch (index) {
        case 0:
            key = @"名前";
            break;
        case 1:
            key = @"LV";
            break;
        case 2:
            key = @"体力";
            break;
        case 3:
            key = @"近接";
            break;
        case 4:
            key = @"遠隔";
            break;
        case 5:
            key = @"防御力";
            break;
        case 6:
            key = @"属性";
            break;
        case 7:
            key = @"テンション";
            break;
        case 8:
            key = @"サポート";
            break;
        case 9:
            key = @"ターゲット";
            break;
        case 10:
            key = @"出撃状態";
            break;
        case 11:
            key = @"毛並み";
            break;
        case 12:
            key = @"コメント";
            break;
        default:
            key = @"コメント";
            break;
    }
    return key;
     */
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

@end
