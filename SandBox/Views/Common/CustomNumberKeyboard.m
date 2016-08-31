//
//  CustomNumberKeyboard.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/12/09.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import "CustomNumberKeyboard.h"

@interface CustomNumberKeyboard(){
    float num1;
    float num2;
}

@end

@implementation CustomNumberKeyboard

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)init {
    self = [super init];
    if (self) {
        // UINibで作成したxibファイルを取得
        UINib *nib = [UINib nibWithNibName:@"CustomNumberKeyboard" bundle:nil];
        // 0番目の要素（一番最初に置いたUIView）を取得して自分自身にセット
        // ※ self は、initメソッド内であれば代入できる
        self = [nib instantiateWithOwner:nil options:nil][0];
    }
    return self;
}

/**
 * 数値ボタン押下時処理
 *
 * @param sender 押下されたUIButton
 */
- (IBAction)numButton:(UIButton *)sender {
    NSString *numtag = [NSString stringWithFormat:@"%ld", (long)sender.tag];
    self.activeTextField.text = [self.activeTextField.text stringByAppendingString:numtag];
}

/**
 * ひとつ戻るボタン押下時処理
 *
 * @param sender 押下されたUIButton
 */
- (IBAction)oneBackButton:(UIButton *)sender {
    if (![self.activeTextField.text isEqualToString:@""]) {
        self.activeTextField.text = [self.activeTextField.text substringWithRange:NSMakeRange(0,self.activeTextField.text.length - 1)];
    }
}

- (IBAction)addButton:(id)sender {
    
}

- (IBAction)subtractionButton:(id)sender {
    
}

- (IBAction)equalButton:(id)sender {
    num2 = [self.activeTextField.text integerValue];
    NSInteger equalNumber = (num1 + num2);
    NSString *numtag = [NSString stringWithFormat:@"%ld", (long)equalNumber];
    self.activeTextField.text = numtag;
    num1 = num2;
    num2 = 0.0;
}

/**
 * return ボタン押下時処理
 * このViewに設定されたTextFieldのキーボードを閉じる
 */
- (IBAction)closeKeyboard:(id)sender{
    [self.activeTextField resignFirstResponder];
}

@end
