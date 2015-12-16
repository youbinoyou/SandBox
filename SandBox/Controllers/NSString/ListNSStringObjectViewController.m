//
//  ListNSStringObjectViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/12/15.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import "ListNSStringObjectViewController.h"

@interface ListNSStringObjectViewController ()

@property (nonatomic,strong) NSString *mainString;

@end

@implementation ListNSStringObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setListButtons];
}

- (void)setListButtons {
    
    self.buttons = @[
                     @{
                         keyTitle : @"NSString",
                         },
                     @{
                         keyTitle : @"NSStringクラスについて",
                         keyAction : @"message"
                         },
                     @{
                         keyTitle : @"文字列生成例１",
                         keyAction : @"setNSString",
                         },
                     @{
                         keyTitle : @"文字列生成例２",
                         keyAction : @"setNSStringStringWithFormat",
                         },
                     @{
                         keyTitle : @"配列の生成例",
                         keyAction : @"setNSStringArray",
                         },
                     @{
                         keyTitle : @"NSStringのメソッド",
                         },
                     @{
                         keyTitle : @"length",
                         keyAction : @"getLength",
                         },
                     @{
                         keyTitle : @"isEqualToString",
                         keyAction : @"getIsEqualToString",
                         },
                     @{
                         keyTitle : @"intValue",
                         keyAction : @"getIntValue",
                         },
                     @{
                         keyTitle : @"floatValue",
                         keyAction : @"getFloatValue",
                         },
                     @{
                         keyTitle : @"doubleValue",
                         keyAction : @"getDoubleValue",
                         },
                     @{
                         keyTitle : @"boolValue",
                         keyAction : @"getBoolValue",
                         },
                     @{
                         keyTitle : @"substringToIndex",
                         keyAction : @"getSubstringToIndex",
                         },
                     @{
                         keyTitle : @"substringFromIndex",
                         keyAction : @"getSubstringFromIndex",
                         },
                     @{
                         keyTitle : @"substringWithRange",
                         keyAction : @"getSubstringWithRange",
                         },
                     @{
                         keyTitle : @"stringByTrimmingCharactersInSet",
                         keyAction : @"getStringByTrimmingCharactersInSet",
                         },
                     @{
                         keyTitle : @"hasPrefix",
                         keyAction : @"getHasPrefix",
                         },
                     @{
                         keyTitle : @"hasSuffix",
                         keyAction : @"getHasSuffix",
                         },
                     @{
                         keyTitle : @"rangeOfString",
                         keyAction : @"getRangeOfString",
                         },
                     @{
                         keyTitle : @"stringByAppendingString",
                         keyAction : @"getStringByAppendingString",
                         },
                     @{
                         keyTitle : @"連想配列",
                         keyAction : @"memo",
                         },
                     @{
                         keyTitle : @"情報提供元",
                         keyLink : @"http://iphone-tora.sakura.ne.jp/nsstring.html",
                         }
                     
                     ];
    [self setButtons];
}

- (void)message {
    UIAlertView *alert = [UIAlertView new];
    alert.title = @"NSStringクラスは、Objective-Cで文字列を扱うクラスです。";
    alert.message = @"NSStringは変更不可なので、可変の文字列を扱いたい場合はNSMutalbeStringクラスを使用します。";
    [alert addButtonWithTitle:@"OK"];
    [alert show];
}

- (void)setNSString {
    UIAlertView *alert = [UIAlertView new];
    alert.title = @"文字列生成例１";
    self.mainString = @"ほげ";
    alert.message = self.mainString;
    [alert addButtonWithTitle:@"OK"];
    [alert show];
}

- (void)setNSStringStringWithFormat {
    UIAlertView *alert = [UIAlertView new];
    alert.title = @"文字列生成例２";
    self.mainString = [NSString stringWithFormat : @"%f km",42.195];
    alert.message = self.mainString;
    [alert addButtonWithTitle : @"OK"];
    [alert show];
}

- (void)setNSStringArray {
    // 配列の生成例
    NSString *strs[] = {@"あ", @"い", @"う"};
    UIAlertView *alert = [UIAlertView new];
    alert.title = @"配列の生成例";
    self.mainString = [NSString stringWithFormat : @"%@,%@,%@",strs[0],strs[1],strs[2]];
    alert.message = self.mainString;
    [alert addButtonWithTitle : @"OK"];
    [alert show];
}

/*
 【NSStringの主要メソッド】
 メソッド	説明
 -(unsigned int)length	文字列の長さを取得する
 （例）文字列"hogehoge"の長さを取得する
 　int len = [@"hogehoge" length];
 　len → 8
 -(BOOL)isEqualToString:
 (NSString*)string	同じ文字列であるか比較する
 （例）
 　BOOL bl = [@"hoge" isEqualToString:@"HOGE"];
 　bl → FALSE
 -(NSString*)stringByAppendingString:
 (NSString*)string	文字列を結合する
 ※例は下記参照
 -(NSString*)substringToIndex:
 (unsigned)anIndex	文字列の切り出し
 ※例は下記参照
 -(NSString*)
 stringByTrimmingCharactersInSet:
 (NSCharacterSet*)set	トリムする
 ※例は下記参照
 -(BOOL)hasPrefix:(NSString*)string	文字列の先頭比較
 ※例は下記参照
 -(BOOL)hasSuffix:(NSString*)string	文字列の後方比較
 ※例は下記参照
 -(NSRange)rangeOfString:
 (NSString*)aString	文字列中の文字を検索する
 ※例は下記参照
 */

#pragma mark - NSString methods

- (void)getLength {
    UIAlertView *alert = [UIAlertView new];
    alert.title = @"文字列の長さを取得する";
    self.mainString = [NSString stringWithFormat : @"length %ld",[self.mainString length]];
    alert.message = self.mainString;
    [alert addButtonWithTitle : @"OK"];
    [alert show];
}

- (void)getIsEqualToString {
//(NSString*)string	同じ文字列であるか比較する
//（例）
//　BOOL bl = [@"hoge" isEqualToString:@"HOGE"];
//　bl → FALSE
//  【文字列検索の比較】
    UIAlertView *alert = [UIAlertView new];
    alert.title = @"同じ文字列であるか比較する";
    BOOL o = [@"ほげ" isEqualToString:self.mainString];
    self.mainString = [NSString stringWithFormat : @"%@",o?@"YES":@"NO"];
    alert.message = self.mainString;
    [alert addButtonWithTitle : @"OK"];
    [alert show];
}

- (void)getIntValue {
//    -(int)intValue	int型にキャストする
//    （例）int val = [@"123" intValue];
    UIAlertView *alert = [UIAlertView new];
    alert.title = @"int型にキャストする";
    int val = [@"123" intValue];
    self.mainString = [NSString stringWithFormat : @"%d",val];
    alert.message = self.mainString;
    [alert addButtonWithTitle : @"OK"];
    [alert show];
}

- (void)getFloatValue {
//    -(float)floatValue	float型にキャストする
//    （例）float val = [@"123.45" floatValue];
    UIAlertView *alert = [UIAlertView new];
    alert.title = @"float型にキャストする";
    float val = [@"123.45" floatValue];
    self.mainString = [NSString stringWithFormat : @"%f",val];
    alert.message = self.mainString;
    [alert addButtonWithTitle : @"OK"];
    [alert show];
}

- (void)getDoubleValue {
//    -(double)doubleValue	double型にキャストする
//    （例）double val = [@"123.45" doubleValue];
    UIAlertView *alert = [UIAlertView new];
    alert.title = @"double型にキャストする";
    double val = [@"123.45" doubleValue];
    self.mainString = [NSString stringWithFormat : @"%f",val];
    alert.message = self.mainString;
    [alert addButtonWithTitle : @"OK"];
    [alert show];
}

- (void)getBoolValue {
//    BOOL型にキャストする
//    （例）BOOL b = [str boolValue];
    UIAlertView *alert = [UIAlertView new];
    alert.title = @"BOOL型にキャストする";
    BOOL b = [self.mainString boolValue];
    self.mainString = [NSString stringWithFormat : @"%@",b?@"YES":@"NO"];
    alert.message = self.mainString;
    [alert addButtonWithTitle : @"OK"];
    [alert show];
}

- (void)getSubstringToIndex {
//    先頭から３文字取得
//    NSString *str = [@"あいうえお" substringToIndex:3];
//    str → "あいう";
    UIAlertView *alert = [UIAlertView new];
    alert.title = @"先頭から３文字取得";
    NSString *str = [self.mainString substringToIndex:3];
    self.mainString = [NSString stringWithFormat : @"%@",str];
    alert.message = self.mainString;
    [alert addButtonWithTitle : @"OK"];
    [alert show];
}

- (void)getSubstringFromIndex {
//    ３文字目から後ろを取得
//    NSString *str = [@"あいうえお" substringFromIndex:3];
//    str → "えお"
    UIAlertView *alert = [UIAlertView new];
    alert.title = @"３文字目から後ろを取得";
    NSString *str = [self.mainString substringFromIndex:3];
    self.mainString = [NSString stringWithFormat : @"%@",str];
    alert.message = self.mainString;
    [alert addButtonWithTitle : @"OK"];
    [alert show];
}

- (void)getSubstringWithRange {
//    ２文字目から３文字分を取得
//    NSString *str = [@"あいうえお" substringWithRange:NSMakeRange(1,3)];
//    str → "いうえ"
    UIAlertView *alert = [UIAlertView new];
    alert.title = @"２文字目から３文字分を取得";
    NSString *str = [self.mainString substringWithRange:NSMakeRange(1,3)];
    self.mainString = [NSString stringWithFormat : @"%@",str];
    alert.message = self.mainString;
    [alert addButtonWithTitle : @"OK"];
    [alert show];
}

- (void)getStringByTrimmingCharactersInSet {
//    ABCの前後にあるスペースを取り除く
//    NSString *str = [@"  ABC   " stringByTrimmingCharactersInSet:
//                     [NSCharacterSet whitespaceCharacterSet]];
//    str → "ABC"
    //【トリム例文】
    UIAlertView *alert = [UIAlertView new];
    alert.title = @"ABCの前後にあるスペースを取り除く";
    NSString *str = [@"  ABC   " stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    self.mainString = [NSString stringWithFormat : @"%@",str];
    alert.message = self.mainString;
    [alert addButtonWithTitle : @"OK"];
    [alert show];
}

- (void)getHasPrefix {
    //    ABCの前後にあるスペースを取り除く
    //    NSString *str = [@"  ABC   " stringByTrimmingCharactersInSet:
    //                     [NSCharacterSet whitespaceCharacterSet]];
    //    str → "ABC"
    //【【前比較、後比較の例文】
    UIAlertView *alert = [UIAlertView new];
    alert.title = @"ほげから始まる文字列であればYES";
    BOOL b = [self.mainString hasPrefix:@"ほげ"];  // 文字列strが"hoge"から始まる文字列であればTRUE
    self.mainString = [NSString stringWithFormat : @"%@",b?@"YES":@"NO"];
    alert.message = self.mainString;
    [alert addButtonWithTitle : @"OK"];
    [alert show];
}

- (void)getHasSuffix {
    //    ABCの前後にあるスペースを取り除く
    //    NSString *str = [@"  ABC   " stringByTrimmingCharactersInSet:
    //                     [NSCharacterSet whitespaceCharacterSet]];
    //    str → "ABC"
    //【【前比較、後比較の例文】
    UIAlertView *alert = [UIAlertView new];
    alert.title = @"ほげで終わる文字列であればYES";
    BOOL b = [self.mainString hasSuffix:@"ほげ"];  // 文字列strが"hoge"で終わる文字列であればTRUE
    self.mainString = [NSString stringWithFormat : @"%@",b?@"YES":@"NO"];
    alert.message = self.mainString;
    [alert addButtonWithTitle : @"OK"];
    [alert show];
}

- (void)getRangeOfString {
    // 【文字列検索の例文】
    // 文字列strの中に@"E"というパターンが存在するかどうか
    NSRange searchResult = [self.mainString rangeOfString:@"E"];
    if(searchResult.location == NSNotFound){
        // みつからない場合の処理
        UIAlertView *alert = [UIAlertView new];
        alert.title = @"Eが含まれない文字列であればNO";
        BOOL b = NO;
        self.mainString = [NSString stringWithFormat : @"%@",b?@"YES":@"NO"];
        alert.message = self.mainString;
        [alert addButtonWithTitle : @"OK"];
        [alert show];
    }else{
        // みつかった場合の処理
        UIAlertView *alert = [UIAlertView new];
        alert.title = @"Eが含まれる文字列であればYES";
        BOOL b = YES;
        self.mainString = [NSString stringWithFormat : @"%@",b?@"YES":@"NO"];
        alert.message = self.mainString;
        [alert addButtonWithTitle : @"OK"];
        [alert show];
    }
}

- (void)getStringByAppendingString {
//    ［文字列の結合】
//    文字列str1とstr2を結合する
//    NSString *str1 = @"ho";
//    NSString *str2 = @"ge";
//    
//    NSString *val = [str1 stringByAppendingString:str2];
//    val → @"hoge"
    UIAlertView *alert = [UIAlertView new];
    alert.title = @"文字列の結合";
    self.mainString = [self.mainString stringByAppendingString:@"ほげ"];
    alert.message = self.mainString;
    [alert addButtonWithTitle : @"OK"];
    [alert show];
}

- (void)memo {
    NSDictionary *dic =
    @{
      @"key":@"value",
      @"apple":@"100円",
      @"orange":@"50円",
      @"peach":@"500円",
      };
    NSMutableDictionary *addDictionary = [dic mutableCopy];
    addDictionary[@"grape"] = @"300円";
    dic = addDictionary;
    NSArray *array =
    @[
      @{@"key":@"value"},
      @{@"apple":@"100円"},
      @{@"orange":@"50円"},
      @{@"peach":@"500円"},
      ];
    NSMutableArray *addArray = [array mutableCopy];
    addArray[[array count]] = @{@"grape" : @"300円"};
    array = @[
              @{@"CAR":@"1000円"},
              @{@"TV":@"2000円"},
              @{@"PC":@"3000円"},
                     ];
    array = addArray;
    NSLog(@"%@",dic);
    NSLog(@"%@",array);
    dic = [self unsetObject:dic key:@"grape"];
    array = [self unsetObject:array key:@"grape"];
    NSLog(@"%@",dic);
    NSLog(@"%@",array);
    array = [self ksortObject:array];
    NSLog(@"%@",array);
}

- (id)unsetObject:(id)object key:(NSString *)key {
    if ([object isKindOfClass:[NSArray class]]) {
        NSMutableArray *mArray = [NSMutableArray new];
        for (NSDictionary *dic in object) {
            if (!dic[key]) {
                [mArray addObject:dic];
            }
        }
        object = mArray;
    }
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *mDictionary = [object mutableCopy];
        [mDictionary removeObjectForKey:key];
        object = mDictionary;
    }
    return object;
}

//昇順
- (id)ksortObject:(id)object {
    NSLog(@"%@",object);
    if ([object isKindOfClass:[NSArray class]]) {
        NSMutableArray *mArray = [NSMutableArray new];
        for (NSDictionary *dic in object) {
            [mArray addObject:[NSString stringWithFormat:@"%@",dic]];
        }
        object = [mArray sortedArrayUsingSelector:@selector(compare:)];
    }
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *mDictionary = [object mutableCopy];
        object = mDictionary;
    }
    return object;
}

//降順
- (id)krsortObject:(id)object {
    if ([object isKindOfClass:[NSArray class]]) {
        NSMutableArray *mArray = [NSMutableArray new];
        object = mArray;
    }
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *mDictionary = [object mutableCopy];
        object = mDictionary;
    }
    return object;
}


//昇順
- (id)asortObject:(id)object {
    if ([object isKindOfClass:[NSArray class]]) {
        NSMutableArray *mArray = [NSMutableArray new];
        object = mArray;
    }
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *mDictionary = [object mutableCopy];
        object = mDictionary;
    }
    return object;
}

//降順
- (id)arsortObject:(id)object {
    if ([object isKindOfClass:[NSArray class]]) {
        NSMutableArray *mArray = [NSMutableArray new];
        object = mArray;
    }
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *mDictionary = [object mutableCopy];
        object = mDictionary;
    }
    return object;
}

@end
