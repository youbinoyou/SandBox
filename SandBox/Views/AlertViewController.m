//
//  AlertViewController.m
//  SandBox
//
//  Created by YouOhshima on 2015/05/18.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "AlertViewController.h"
#import <QuartzCore/QuartzCore.h>

/**
 * Alertで使うUIButtonクラス
 */
@interface AlertButton : UIButton

@end

@implementation AlertButton

/**
 * UIButtonの初期化
 * @param NSCoder Object
 * @return id Object
 */
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.backgroundColor = [UIColor colorWithRed:1.0 green:0.4 blue:0 alpha:0.9];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:[UIFont buttonFontSize]];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.layer.cornerRadius = 8.0f;
        self.clipsToBounds = YES;
        
        UIButton *button = self;
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = CGRectMake(0, 0, 364, 44);
        gradientLayer.locations = [NSArray arrayWithObjects:
                                   [NSNumber numberWithFloat:0.0],
                                   [NSNumber numberWithFloat:0.3],
                                   [NSNumber numberWithFloat:0.5],
                                   [NSNumber numberWithFloat:1.0],
                                   nil];
        gradientLayer.colors =
        [NSArray arrayWithObjects:
         (id)[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8].CGColor,
         (id)[UIColor colorWithRed:0.8 green:0.5 blue:0.0 alpha:0.7].CGColor,
         (id)[UIColor colorWithRed:0.5 green:0.3 blue:0.0 alpha:0.5].CGColor,
         (id)[UIColor colorWithRed:0.3 green:0.0 blue:0.0 alpha:0.3].CGColor,
         nil];
        gradientLayer.cornerRadius  = 8.0f;
        [button.layer insertSublayer:gradientLayer atIndex:0];
    }
    return self;
}

@end

/**
 * Alertで使うMessageLabelクラス
 */
@interface AlertMessageLabel : UILabel

@end

@implementation AlertMessageLabel

/**
 * MessageLabelの初期化
 * @param NSCoder Object
 * @return id Object
 */
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.font = [UIFont systemFontOfSize:[UIFont buttonFontSize]];
        self.layer.borderColor = [UIColor blackColor].CGColor;  //ボーダー色（黒）
        self.layer.borderWidth = 1.0;  //ボーダー幅（２ピクセル）
        
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect
{
    UIEdgeInsets insets = {0, 10, 0, 10};
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end




/**
 * Alertで使うUIButtonクラス
 */
@interface Alert2Button : UIButton

@end

@implementation Alert2Button

/**
 * UIButtonの初期化
 * @param NSCoder Object
 * @return id Object
 */
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        UIButton *button = self;
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = CGRectMake(0, 0, 140, 44);
        gradientLayer.locations = [NSArray arrayWithObjects:
                                   [NSNumber numberWithFloat:0.0],
                                   [NSNumber numberWithFloat:0.3],
                                   [NSNumber numberWithFloat:0.5],
                                   [NSNumber numberWithFloat:1.0],
                                   nil];
        gradientLayer.colors =
        [NSArray arrayWithObjects:
         (id)[UIColor colorWithRed:1 green:1 blue:1 alpha:0.8].CGColor,
         (id)[UIColor colorWithRed:1 green:1 blue:1 alpha:0.7].CGColor,
         (id)[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5].CGColor,
         (id)[UIColor colorWithRed:0.8 green:0.8 blue:1 alpha:0.3].CGColor,
         nil];
        gradientLayer.cornerRadius = 20.0f;
        [button.layer addSublayer:gradientLayer];

        self.layer.cornerRadius = 20.0f;
        self.clipsToBounds = YES;
        // aViewは、UIView型のインスタンス
        // 領域外をマスクで切り取る設定をしない
        self.layer.masksToBounds = NO;
        // 影のかかる方向を指定する
        self.layer.shadowOffset = CGSizeMake(2.0f, 2.0f);
        // 影の透明度
        self.layer.shadowOpacity = 0.7f;
        // 影の色
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        // ぼかしの量
        self.layer.shadowRadius = 2.0f;
            }
    

    return self;
}

@end

/**
 * Alertで使うUIButtonクラス
 */
@interface AreaSelectionCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *areaContentView;
@property (weak, nonatomic) IBOutlet UILabel *areaTitleLabel;

@end

@implementation AreaSelectionCell

/**
 * UIButtonの初期化
 * @param NSCoder Object
 * @return id Object
 */
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
    }
    
    return self;
}

@end



@interface AlertViewController ()

@end

@implementation AlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.messageLabel.text = @"ほげほげほげほげほげ\nほげほげほげほげほげ\nほげほげほげほげほげ\nほげほげほげほげほげ";
    self.title = @"地域選択";
    //self.alertNavigationBar.layer.cornerRadius = 20.0f;
    self.alertView.layer.cornerRadius = 20.0f;
//    if (self.tableView) {
//        self.tableView.delegate = self;
//        self.tableView.dataSource = self;
//    }
    self.datasource =  @[
                         /*県番号      都道府県名	県庁所在地*/
                         @{@"no":@0,@"title":@"都道府県名",@"title.ruby":@"とどうふけんめい",@"subtitle":@"県庁所在地",@"subtitle.ruby":@"けんちょうそざいち"},
                         @{@"no":@1,@"title":@"北海道",@"title.ruby":@"ほっかいどう",@"subtitle":@"札幌",@"subtitle.ruby":@"さっぽろ"},
                         @{@"no":@2,@"title":@"青森県",@"title.ruby":@"あおもり",@"subtitle":@"青森",@"subtitle.ruby":@"あおもり"},
                         @{@"no":@3,@"title":@"岩手県",@"title.ruby":@"いわて",@"subtitle":@"盛岡",@"subtitle.ruby":@"もりおか"},
                         @{@"no":@4,@"title":@"宮城県",@"title.ruby":@"みやぎ",@"subtitle":@"	仙台",@"subtitle.ruby":@"せんだい"},
                         @{@"no":@5,@"title":@"秋田県",@"title.ruby":@"あきた",@"subtitle":@"	秋田",@"subtitle.ruby":@"あきた"},
                         @{@"no":@6,@"title":@"山形県",@"title.ruby":@"やまがた",@"subtitle":@"山形",@"subtitle.ruby":@"やまがた"},
                         @{@"no":@7,@"title":@"福島県",@"title.ruby":@"ふくしま",@"subtitle":@"福島",@"subtitle.ruby":@"ふくしま"},
                         @{@"no":@8,@"title":@"茨城県",@"title.ruby":@"いばらき",@"subtitle":@"水戸",@"subtitle.ruby":@"みと"},
                         @{@"no":@9,@"title":@"栃木県",@"title.ruby":@"とちぎ)	",@"subtitle":@"宇都宮",@"subtitle.ruby":@"うつのみや"},
                         @{@"no":@10,@"title":@"群馬県",@"title.ruby":@"ぐんま",@"subtitle":@"前橋",@"subtitle.ruby":@"まえばし"},
                         @{@"no":@11,@"title":@"埼玉県",@"title.ruby":@"さいたま",@"subtitle":@"さいたま",@"subtitle.ruby":@"さいたま"},
                         @{@"no":@12,@"title":@"千葉県",@"title.ruby":@"ちば",@"subtitle":@"千葉",@"subtitle.ruby":@"ちば"},
                         @{@"no":@13,@"title":@"東京都",@"title.ruby":@"とうきょう",@"subtitle":@"東京",@"subtitle.ruby":@"とうきょう"},
                         @{@"no":@14,@"title":@"神奈川県",@"title.ruby":@"かながわ",@"subtitle":@"横浜",@"subtitle.ruby":@"よこはま"},
                         @{@"no":@15,@"title":@"新潟県",@"title.ruby":@"にいがた",@"subtitle":@"新潟",@"subtitle.ruby":@"にいがた"},
                         @{@"no":@16,@"title":@"富山県",@"title.ruby":@"とやま",@"subtitle":@"富山",@"subtitle.ruby":@"とやま"},
                         @{@"no":@17,@"title":@"石川県",@"title.ruby":@"いしかわ",@"subtitle":@"金沢",@"subtitle.ruby":@"かなざわ"},
                         @{@"no":@18,@"title":@"福井県",@"title.ruby":@"ふくい",@"subtitle":@"福井",@"subtitle.ruby":@"ふくい"},
                         @{@"no":@19,@"title":@"山梨県",@"title.ruby":@"やまなし",@"subtitle":@"甲府",@"subtitle.ruby":@"こうふ"},
                         @{@"no":@20,@"title":@"長野県",@"title.ruby":@"ながの",@"subtitle":@"長野",@"subtitle.ruby":@"ながの"},
                         @{@"no":@21,@"title":@"岐阜県",@"title.ruby":@"ぎふ",@"subtitle":@"岐阜",@"subtitle.ruby":@"ぎふ"},
                         @{@"no":@22,@"title":@"静岡県",@"title.ruby":@"しずおか",@"subtitle":@"静岡",@"subtitle.ruby":@"しずおか"},
                         @{@"no":@23,@"title":@"愛知県",@"title.ruby":@"あいち",@"subtitle":@"名古屋(なごや"},
                         @{@"no":@24,@"title":@"三重県",@"title.ruby":@"みえ",@"subtitle":@"津",@"subtitle.ruby":@"つ"},
                         @{@"no":@25,@"title":@"滋賀県",@"title.ruby":@"しが",@"subtitle":@"大津",@"subtitle.ruby":@"おおつ"},
                         @{@"no":@26,@"title":@"京都府",@"title.ruby":@"きょうと",@"subtitle":@"京都",@"subtitle.ruby":@"きょうと"},
                         @{@"no":@27,@"title":@"大阪府",@"title.ruby":@"おおさか",@"subtitle":@"大阪",@"subtitle.ruby":@"おおさか"},
                         @{@"no":@28,@"title":@"兵庫県",@"title.ruby":@"ひょうご",@"subtitle":@"神戸",@"subtitle.ruby":@"こうべ"},
                         @{@"no":@29,@"title":@"奈良県",@"title.ruby":@"なら",@"subtitle":@"奈良",@"subtitle.ruby":@"なら"},
                         @{@"no":@30,@"title":@"和歌山県",@"title.ruby":@"わかやま",@"subtitle":@"和歌山",@"subtitle.ruby":@"わかやま"},
                         @{@"no":@31,@"title":@"鳥取県",@"title.ruby":@"とっとり",@"subtitle":@"鳥取",@"subtitle.ruby":@"とっとり"},
                         @{@"no":@32,@"title":@"島根県",@"title.ruby":@"しまね",@"subtitle":@"松江",@"subtitle.ruby":@"まつえ"},
                         @{@"no":@33,@"title":@"岡山県",@"title.ruby":@"おかやま",@"subtitle":@"岡山",@"subtitle.ruby":@"おかやま"},
                         @{@"no":@34,@"title":@"広島県",@"title.ruby":@"ひろしま",@"subtitle":@"広島",@"subtitle.ruby":@"ひろしま"},
                         @{@"no":@35,@"title":@"山口県",@"title.ruby":@"やまぐち",@"subtitle":@"山口",@"subtitle.ruby":@"やまぐち"},
                         @{@"no":@36,@"title":@"徳島県",@"title.ruby":@"とくしま",@"subtitle":@"徳島",@"subtitle.ruby":@"とくしま"},
                         @{@"no":@37,@"title":@"香川県",@"title.ruby":@"かがわ",@"subtitle":@"高松",@"subtitle.ruby":@"たかまつ"},
                         @{@"no":@38,@"title":@"愛媛県",@"title.ruby":@"えひめ",@"subtitle":@"松山",@"subtitle.ruby":@"まつやま"},
                         @{@"no":@39,@"title":@"高知県",@"title.ruby":@"こうち",@"subtitle":@"高知",@"subtitle.ruby":@"こうち"},
                         @{@"no":@40,@"title":@"福岡県",@"title.ruby":@"ふくおか",@"subtitle":@"福岡",@"subtitle.ruby":@"ふくおか"},
                         @{@"no":@41,@"title":@"佐賀県",@"title.ruby":@"さが",@"subtitle":@"佐賀",@"subtitle.ruby":@"さが"},
                         @{@"no":@42,@"title":@"長崎県",@"title.ruby":@"ながさき",@"subtitle":@"長崎",@"subtitle.ruby":@"ながさき"},
                         @{@"no":@43,@"title":@"熊本県",@"title.ruby":@"くまもと",@"subtitle":@"熊本",@"subtitle.ruby":@"くまもと"},
                         @{@"no":@44,@"title":@"大分県",@"title.ruby":@"おおいた",@"subtitle":@"大分",@"subtitle.ruby":@"おおいた"},
                         @{@"no":@45,@"title":@"宮崎県",@"title.ruby":@"みやざき",@"subtitle":@"宮崎",@"subtitle.ruby":@"みやざき"},
                         @{@"no":@46,@"title":@"鹿児島県",@"title.ruby":@"かごしま",@"subtitle":@"鹿児島",@"subtitle.ruby":@"かごしま"},
                         @{@"no":@47,@"title":@"沖縄県",@"title.ruby":@"おきなわ",@"subtitle":@"那覇",@"subtitle.ruby":@"なは"},
                         ];
    
    self.alertNavigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"❌" style:UIBarButtonItemStyleDone target:self action:@selector(closeAlertView:withObject:)];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setTitle:(NSString *)title {
    self.alertNavigationItem.title = title;
}
- (IBAction)buttonAction:(id)sender {
    NSLog(@"%@",@"ホゲホゲ");
    //[self dismissViewControllerAnimated:YES completion:^(void){}];
    [self closeAlertView:sender withObject:nil];
}

- (IBAction)button1Action:(id)sender {
    NSLog(@"%@",@"ホゲホゲ１");
    //[self dismissViewControllerAnimated:YES completion:^(void){}];
    [self closeAlertView:sender withObject:nil];
}
- (IBAction)button2Action:(id)sender {
    NSLog(@"%@",@"ホゲホゲ２");
    //[self dismissViewControllerAnimated:YES completion:^(void){}];
    [self closeAlertView:sender withObject:nil];
}

- (IBAction)closeButtonAction:(id)sender {
    [self closeAlertView:sender withObject:nil];
}

// 空の領域にある透明なボタンがタップされたときに呼び出されるメソッド
- (void)closeAlertView:(id)sender withObject:(id)object{
    // AlertViewを閉じるための処理を呼び出す
    if ([self.delegate respondsToSelector:@selector(closeAlertView:withObject:)]) {
        [self.delegate closeAlertView:self withObject:object];
    } else {
        @throw [NSException exceptionWithName:@"Not Delegate Exception" reason:@"" userInfo:nil];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [self.datasource count] - 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AreaSelectionCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"AreaSelectionCell"];
    cell.areaTitleLabel.text = self.datasource[indexPath.section + 1][@"title"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self closeAlertView:self withObject:self.datasource[indexPath.section + 1][@"title"]];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self closeAlertView:self withObject:nil];
}

- (void)dealloc
{
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

@end
