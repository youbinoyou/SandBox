//
//  PickerViewController.m
//  SandBox
//
//  Created by 大島 曜 on 2015/05/15.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "PickerViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface PickerViewController ()

@property (retain, nonatomic) UIPickerView *picker;
@property (retain, nonatomic) NSArray *items;
@end

@implementation PickerViewController

- (id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // PickerViewのデリゲート先とデータソースをこのクラスに設定
    if (!self.picker) {
        self.picker = [UIPickerView new];
        [self.view addSubview:self.picker];
        self.picker.backgroundColor = [UIColor colorWithRed:0 green:0.6 blue:1.0 alpha:0.8];
    }
    self.picker.frame = CGRectMake(10,
                                   CGRectGetHeight([UIScreen mainScreen].bounds) / 2.0f,
                                   CGRectGetWidth([UIScreen mainScreen].bounds) - 20,
                                   CGRectGetHeight([UIScreen mainScreen].bounds) / 2.0f);

    // 領域外をマスクで切り取る設定をしない
    self.picker.layer.masksToBounds = NO;
    // 影のかかる方向を指定する
    self.picker.layer.shadowOffset = CGSizeMake(10.0f, 10.0f);
    // 影の透明度
    self.picker.layer.shadowOpacity = 0.7f;
    // 影の色
    self.picker.layer.shadowColor = [UIColor blackColor].CGColor;
    // ぼかしの量
    self.picker.layer.shadowRadius = 10.0f;
    self.picker.delegate = self;
    self.picker.dataSource = self;
    
    self.items = @[
                   /*県番号	都道府県名	県庁所在地*/
                   @{@"n":@0,@"title":@"都道府県名",@"subtitle":@"県庁所在地"},
                   @{@"n":@1,@"title":@"北海道(ほっかいどう)",@"subtitle":@"札幌(さっぽろ)"},
                   @{@"n":@2,@"title":@"青森県(あおもり)",@"subtitle":@"青森(あおもり)"},
                   @{@"n":@3,@"title":@"岩手県(いわて)",@"subtitle":@"盛岡(もりおか)"},
                   @{@"n":@4,@"title":@"宮城県(みやぎ)",@"subtitle":@"	仙台(せんだい)"},
                   @{@"n":@5,@"title":@"秋田県(あきた)",@"subtitle":@"	秋田(あきた)"},
                   @{@"n":@6,@"title":@"山形県(やまがた)",@"subtitle":@"山形(やまがた)"},
                   @{@"n":@7,@"title":@"福島県(ふくしま)",@"subtitle":@"福島(ふくしま)"},
                   @{@"n":@8,@"title":@"茨城県(いばらき)",@"subtitle":@"水戸(みと)"},
                   @{@"n":@9,@"title":@"栃木県(とちぎ)	",@"subtitle":@"宇都宮(うつのみや)"},
                   @{@"n":@10,@"title":@"群馬県(ぐんま)",@"subtitle":@"前橋(まえばし)"},
                   @{@"n":@11,@"title":@"埼玉県(さいたま)",@"subtitle":@"さいたま"},
                   @{@"n":@12,@"title":@"千葉県(ちば)",@"subtitle":@"千葉(ちば)"},
                   @{@"n":@13,@"title":@"東京都(とうきょう)",@"subtitle":@"東京(とうきょう)"},
                   @{@"n":@14,@"title":@"神奈川県(かながわ)",@"subtitle":@"横浜(よこはま)"},
                   @{@"n":@15,@"title":@"新潟県(にいがた)",@"subtitle":@"新潟(にいがた)"},
                   @{@"n":@16,@"title":@"富山県(とやま)",@"subtitle":@"富山(とやま)"},
                   @{@"n":@17,@"title":@"石川県(いしかわ)",@"subtitle":@"金沢(かなざわ)"},
                   @{@"n":@18,@"title":@"福井県(ふくい)",@"subtitle":@"福井(ふくい)"},
                   @{@"n":@19,@"title":@"山梨県(やまなし)",@"subtitle":@"甲府(こうふ)"},
                   @{@"n":@20,@"title":@"長野県(ながの)",@"subtitle":@"長野(ながの)"},
                   @{@"n":@21,@"title":@"岐阜県(ぎふ)",@"subtitle":@"岐阜(ぎふ)"},
                   @{@"n":@22,@"title":@"静岡県(しずおか)",@"subtitle":@"静岡(しずおか)"},
                   @{@"n":@23,@"title":@"愛知県(あいち)",@"subtitle":@"名古屋(なごや)"},
                   @{@"n":@24,@"title":@"三重県(みえ)",@"subtitle":@"津(つ)"},
                   @{@"n":@25,@"title":@"滋賀県(しが)",@"subtitle":@"大津(おおつ)"},
                   @{@"n":@26,@"title":@"京都府(きょうと)",@"subtitle":@"京都(きょうと)"},
                   @{@"n":@27,@"title":@"大阪府(おおさか)",@"subtitle":@"大阪(おおさか)"},
                   @{@"n":@28,@"title":@"兵庫県(ひょうご)",@"subtitle":@"神戸(こうべ)"},
                   @{@"n":@29,@"title":@"奈良県(なら)",@"subtitle":@"奈良(なら)"},
                   @{@"n":@30,@"title":@"和歌山県(わかやま)",@"subtitle":@"和歌山(わかやま)"},
                   @{@"n":@31,@"title":@"鳥取県(とっとり)",@"subtitle":@"鳥取(とっとり)"},
                   @{@"n":@32,@"title":@"島根県(しまね)",@"subtitle":@"松江(まつえ)"},
                   @{@"n":@33,@"title":@"岡山県(おかやま)",@"subtitle":@"岡山(おかやま)"},
                   @{@"n":@34,@"title":@"広島県(ひろしま)",@"subtitle":@"広島(ひろしま)"},
                   @{@"n":@35,@"title":@"山口県(やまぐち)",@"subtitle":@"山口(やまぐち)"},
                   @{@"n":@36,@"title":@"徳島県(とくしま)",@"subtitle":@"徳島(とくしま)"},
                   @{@"n":@37,@"title":@"香川県(かがわ)",@"subtitle":@"高松(たかまつ)"},
                   @{@"n":@38,@"title":@"愛媛県(えひめ)",@"subtitle":@"松山(まつやま)"},
                   @{@"n":@39,@"title":@"高知県(こうち)",@"subtitle":@"高知(こうち)"},
                   @{@"n":@40,@"title":@"福岡県(ふくおか)",@"subtitle":@"福岡(ふくおか)"},
                   @{@"n":@41,@"title":@"佐賀県(さが)",@"subtitle":@"佐賀(さが)"},
                   @{@"n":@42,@"title":@"長崎県(ながさき)",@"subtitle":@"長崎(ながさき)"},
                   @{@"n":@43,@"title":@"熊本県(くまもと)",@"subtitle":@"熊本(くまもと)"},
                   @{@"n":@44,@"title":@"大分県(おおいた)",@"subtitle":@"大分(おおいた)"},
                   @{@"n":@45,@"title":@"宮崎県(みやざき)",@"subtitle":@"宮崎(みやざき)"},
                   @{@"n":@46,@"title":@"鹿児島県(かごしま)",@"subtitle":@"鹿児島(かごしま)"},
                   @{@"n":@47,@"title":@"沖縄県(おきなわ)",@"subtitle":@"那覇(なは)"},
                   ];
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

// PickerViewで要素が選択されたときに呼び出されるメソッド
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    [self.picker selectRow:row inComponent:component animated:YES];
    if ([self.items[row][@"n"] integerValue] > 0) {
        // デリゲート先の処理を呼び出し、選択された文字列を親Viewに表示させる
        if ([self.delegate respondsToSelector:@selector(applySelectedString:)]) {
            [self.delegate applySelectedString:self.items[row][@"title"]];//[NSString stringWithFormat:@"%ld", row]];
            [self closePickerView:nil];
            //[pickerView selectedRowInComponent:component];
            //- (NSInteger)selectedRowInComponent:(NSInteger)component;

        } else {
            @throw [NSException exceptionWithName:@"Not Delegate Exception" reason:@"" userInfo:nil];
        }
    }
}

// PickerViewの列数を指定するメソッド
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView {
    return 1;
}

// PickerViewに表示する行数を指定するメソッド
-(NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.items count];
}

// PickerViewの各行に表示する文字列を指定するメソッド
-(NSString*)pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    //NSArray *data = @[@"",@""];
    return self.items[row][@"title"];// [NSString stringWithFormat:@"%ld", row];
}

// 空の領域にある透明なボタンがタップされたときに呼び出されるメソッド
- (void)closePickerView:(id)sender {
    // PickerViewを閉じるための処理を呼び出す
    if ([self.delegate respondsToSelector:@selector(closePickerView:)]) {
        [self.delegate closePickerView:self];
    } else {
        @throw [NSException exceptionWithName:@"Not Delegate Exception" reason:@"" userInfo:nil];
    }
}

- (void)dealloc
{
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

@end