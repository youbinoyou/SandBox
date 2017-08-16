//
//  PickerViewModel.m
//  SandBox
//
//  Created by YouOhshima on 2017/08/01.
//  Copyright © 2017年 大島 曜. All rights reserved.
//

#import "PickerViewModel.h"
#import "JapanCityNameModel.h"

@interface PickerViewModel ()

@property (assign, nonatomic) BOOL isInit;

@end

@implementation PickerViewModel

- (id)init {
    if (self) {
        self.isInit = YES;
    }
    return self;
}

- (void)setPickerView:(UIPickerView *)pickerView_ {
    _pickerView = pickerView_;
    if (self.isInit) {
        //初期化
        [self bindViewModels];
        self.isInit = NO;
    }
}

//初期設定
- (void)bindViewModels {
    self.masksToBounds = NO;
    //self.nonSelectRows = nil;//どれも選択される
     self.nonSelectRows = @[@0];//初回 0 番目は選択されない
    self.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.8];
   self.shadowOffset = CGSizeMake(10.0, 10.0);
    self.shadowOpacity = 0.7;
    self.shadowRadius = 10.0;
    self.shadowColor = [UIColor blackColor];
    [self attributedTitle:@"Picker Sample"];
    self.items = [JapanCityNameModel JapanCityModels];
}

//選択されない行
- (void)setNonSelectRows:(NSArray *)nonSelectRows_ {
    _nonSelectRows = nonSelectRows_;
}

// TODO:public
// 背景の色
- (void)setBackgroundColor:(UIColor *)backgroundColor_ {
    self.pickerView.backgroundColor = backgroundColor_;
    _backgroundColor = backgroundColor_;
}


// 領域外をマスクで切り取る設定
- (void)setMasksToBounds:(BOOL)masksToBounds_ {
    self.pickerView.layer.masksToBounds = masksToBounds_;
    _masksToBounds = masksToBounds_;
    
}

// 影のかかる方向を指定する
- (void)setShadowOffset:(CGSize)shadowOffset_ {
    self.pickerView.layer.shadowOffset = shadowOffset_;
    _shadowOffset = shadowOffset_;
}

// 影の透明度
- (void)setShadowOpacity:(CGFloat)shadowOpacity_ {
    self.pickerView.layer.shadowOpacity = shadowOpacity_;
    _shadowOpacity = shadowOpacity_;
}

// 影の色
- (void)setShadowColor:(UIColor *)shadowColor_ {
    self.pickerView.layer.shadowColor = shadowColor_.CGColor;
    _shadowColor = shadowColor_;
}

- (void)setShadowRadius:(CGFloat)shadowRadius_ {
    // ぼかしの量
    self.pickerView.layer.shadowRadius = shadowRadius_;
    _shadowRadius = shadowRadius_;

}

// 装飾された文字の作成
- (void)attributedTitle:(NSString *)title {
    NSMutableAttributedString *attributedString;
    attributedString = [[NSMutableAttributedString alloc] initWithString:title];
    // フォント
    [attributedString addAttribute:NSFontAttributeName
                             value:[UIFont fontWithName:@"Futura-CondensedMedium" size:15.0]
                             range:NSMakeRange(0, [attributedString length])];
    
    // 文字色
    [attributedString addAttribute:NSForegroundColorAttributeName
                             value:[UIColor colorWithRed:1.0 green:1.0 blue:1.5 alpha:0.8]
                             range:NSMakeRange(0, [attributedString length])];
    
    // 背景色
    [attributedString addAttribute:NSBackgroundColorAttributeName
                             value:[UIColor colorWithRed:0.0 green:0.0 blue:0.5 alpha:0.8]
                             range:NSMakeRange(0, [attributedString length])];
    
    // 打ち消し線
    [attributedString addAttribute:NSStrikethroughStyleAttributeName
                             value:[NSNumber numberWithInt:3]
                             range:[title rangeOfString:@"Sample"]];
    self.attributedString = attributedString;
}

- (void)setAttributedString:(NSAttributedString *)attributedString_ {
    _attributedString = attributedString_;
}

@end
