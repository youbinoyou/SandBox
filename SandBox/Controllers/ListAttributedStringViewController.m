//
//  ListAttributedStringViewController.m
//  SandBox
//
//  Created by 大島 曜 on 2015/04/24.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "ListAttributedStringViewController.h"

@interface ListAttributedStringViewController ()

@property (nonatomic) NSArray *buttons;
@property (nonatomic) UILabel *label;

@end

@implementation ListAttributedStringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.buttons = @[
                     @{@"title":@"フォント名\nNSFontAttributeName",@"action":@"fontAttributeName"},
                     @{@"title":@"段落の書式\nNSParagraphStyleAttributeName",@"action":@"paragraphStyleAttributeName"},
                     
                     @{@"title":@"フォント名と段落の書式",@"action":@"paragraphStyleAttributeNameWithFont"},
                     
                     
                     @{@"title":@"文字色\nNSForegroundColorAttributeName",@"action":@"foregroundColorAttributeName"},
                     @{@"title":@"文字色\nNSForegroundColorAttributeName",@"action":@"foregroundColorAttributeNameWithFont"},
                     
                     @{@"title":@"背景色\nNSBackgroundColorAttributeName",@"action":@"backgroundColorAttributeName"},
                     @{@"title":@"背景色\nNSBackgroundColorAttributeName",@"action":@"backgroundColorAttributeNameWithFont"},
                     @{@"title":@"リガチャ\nNSLigatureAttributeName",@"action":@"ligatureAttributeName"},
                     
                     @{@"title":@"リガチャ\nNSLigatureAttributeName",@"action":@"ligatureAttributeNameWithFont"},
                     @{@"title":@"カーニング\nNSKernAttributeName",@"action":@"kernAttribute"},
                     @{@"title":@"カーニング\nNSKernAttributeName",@"action":@"kernAttributeNameWithFont"},
                     @{@"title":@"取り消し線\nNSStrikethroughStyleAttributeName",@"action":@"strikethroughStyleAttributeName"},
                     @{@"title":@"取り消し線\nNSStrikethroughStyleAttributeName",@"action":@"strikethroughStyleAttributeNameWithFont"},
                     @{@"title":@"下線\nNSUnderlineStyleAttributeName",@"action":@"underlineStyleAttributeName"},
                     @{@"title":@"下線\nNSUnderlineStyleAttributeName",@"action":@"underlineStyleAttributeNameWithFont"},
                     @{@"title":@"枠線の色\n NSStrokeColorAttributeName",@"action":@"strokeColorAttributeNameWithFont"},
                     @{@"title":@"枠線の幅\nNSStrokeWidthAttributeName",@"action":@"strokeWidthAttributeNameWithFont"},
                     @{@"title":@"枠線の設定\n NSStrokeColorAttributeName",@"action":@"strokeColorAndWidthAttributeNameFont"},
                     @{@"title":@"影\nNSShadowAttributeName",@"action":@"shadowAttributeName"},
                     @{@"title":@"影\nNSShadowAttributeName",@"action":@"shadowAttributeNameWithFont"},
                     
                     @{@"title":@"縦書き\nNSVerticalGlyphFormAttributeName",@"action":@"verticalGlyphFormAttributeName"},
                     @{@"title":@"縦書き\nNSVerticalGlyphFormAttributeName",@"action":@"verticalGlyphFormAttributeNameWithFont"},
                     @{@"title":@"混合",@"action":@"mixAttributeName"},
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
        }        [self.view addSubview:button];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fontAttributeName{
    NSString *text = @"国境の長いトンネルを抜けると雪国であった。";
    UIFont *font = /*/[UIFont boldSystemFontOfSize:20.0f];/*/[UIFont fontWithName:@"HiraKakuProN-W6" size:20.f];
    NSAttributedString *str = [[NSAttributedString alloc]
                               initWithString:text
                               attributes:@{NSFontAttributeName:font}];
    [str drawInRect:CGRectMake(0, 0, 200, 100)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    label.attributedText = str;
    label.numberOfLines = 0;
    label.center = self.view.center;
    if (!self.label) {
        [self.view addSubview:label];
    }
    self.label = label;
}

- (void)paragraphStyleAttributeName{
    NSString *text = @"国境の長いトンネルを抜けると雪国であった。";
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [style setAlignment:NSTextAlignmentCenter];
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:text
                                                              attributes:@{NSParagraphStyleAttributeName:style}];
    [str drawInRect:CGRectMake(0, 0, 200, 100)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    label.attributedText = str;
    label.numberOfLines = 0;
    label.center = self.view.center;
    if (!self.label) {
        [self.view addSubview:label];
    }
    self.label = label;
}
- (void)paragraphStyleAttributeNameWithFont{
    UIFont *font = /*/[UIFont boldSystemFontOfSize:20.0f];/*/[UIFont fontWithName:@"HiraKakuProN-W6" size:20.f];
    NSString *text = @"国境の長いトンネルを抜けると雪国であった。";
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [style setAlignment:NSTextAlignmentCenter];
    NSAttributedString *str = [[NSAttributedString alloc]
                               initWithString:text
                               attributes:@{NSParagraphStyleAttributeName:style,
                                            NSFontAttributeName:font}];
    [str drawInRect:CGRectMake(0, 0, 200, 100)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    label.attributedText = str;
    label.numberOfLines = 0;
    label.center = self.view.center;
    if (!self.label) {
        [self.view addSubview:label];
    }
    self.label = label;
}

- (void)foregroundColorAttributeNameWithFont{
    UIFont *font = /*/[UIFont boldSystemFontOfSize:20.0f];/*/[UIFont fontWithName:@"HiraKakuProN-W6" size:20.f];
    NSString *text = @"国境の長いトンネルを抜けると雪国であった。";
    NSAttributedString *str = [[NSAttributedString alloc]
                               initWithString:text
                               attributes:@{NSForegroundColorAttributeName:[UIColor blueColor],
                                            NSFontAttributeName:font}];
    CGSize size = [str size];
    [str drawInRect:CGRectMake(0, 0, size.width / 2.0, size.height / 2.0)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    label.attributedText = str;
    label.numberOfLines = 0;
    label.center = self.view.center;
    if (!self.label) {
        [self.view addSubview:label];
    }
    self.label = label;
}

- (void)backgroundColorAttributeNameWithFont{
    UIFont *font = /*/[UIFont boldSystemFontOfSize:20.0f];/*/[UIFont fontWithName:@"HiraKakuProN-W6" size:20.f];
    NSString *text = @"国境の長いトンネルを抜けると雪国であった。";
    NSAttributedString *str = [[NSAttributedString alloc]
                               initWithString:text
                               attributes:@{NSBackgroundColorAttributeName:[UIColor redColor],
                                            NSFontAttributeName:font}];
    CGSize size = [str size];
    [str drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    label.attributedText = str;
    label.numberOfLines = 0;
    label.center = self.view.center;
    if (!self.label) {
        [self.view addSubview:label];
    }
    self.label = label;
}

- (void)ligatureAttributeNameWithFont{
    UIFont *font = [UIFont fontWithName:@"Verdana-Bold" size:30.f];
    NSString *text = @"Affine";
    NSAttributedString *str = [[NSAttributedString alloc]
                               initWithString:text
                               attributes:@{
                                            NSFontAttributeName:font}];
    //[str drawInRect:CGRectMake(0, 100, 400, 100)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    label.attributedText = str;
    label.numberOfLines = 0;
    label.center = self.view.center;
    if (!self.label) {
        [self.view addSubview:label];
    }
    str = [[NSAttributedString alloc]
           initWithString:text
           attributes:@{NSLigatureAttributeName:@1,
                        NSFontAttributeName:font}];
    //[str drawInRect:CGRectMake(0, 150, 400, 100)];
    label.attributedText = str;
    self.label = label;
    
}


- (void)kernAttributeNameWithFont{
    UIFont *font = [UIFont fontWithName:@"Verdana-Bold" size:30.f];
    NSString *text = @"国境の長いトンネルを抜けると雪国であった。";
    
    NSAttributedString *str = [[NSAttributedString alloc]
                               initWithString:text
                               attributes:@{NSKernAttributeName:@18.0,
                                            NSFontAttributeName:font}];
    CGSize size = [str size];
    [str drawInRect:CGRectMake(0, 0, size.width, size.height)];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    label.attributedText = str;
    label.numberOfLines = 0;
    label.center = self.view.center;
    if (!self.label) {
        [self.view addSubview:label];
    }
    label.attributedText = str;
    self.label = label;
    
}

- (void)strikethroughStyleAttributeNameWithFont{
    UIFont *font = [UIFont fontWithName:@"Verdana-Bold" size:30.f];
    NSString *text = @"国境の長いトンネルを抜けると雪国であった。";
    NSAttributedString *str = [[NSAttributedString alloc]
                               initWithString:text
                               attributes:@{NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle],
                                            NSFontAttributeName:font}];
    CGSize size = [str size];
    [str drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    label.attributedText = str;
    label.numberOfLines = 0;
    label.center = self.view.center;
    if (!self.label) {
        [self.view addSubview:label];
    }
    label.attributedText = str;
    self.label = label;
    
}

- (void)underlineStyleAttributeNameWithFont{
    UIFont *font = [UIFont fontWithName:@"Verdana-Bold" size:30.f];
    NSString *text = @"国境の長いトンネルを抜けると雪国であった。";
    NSAttributedString *str = [[NSAttributedString alloc]
                               initWithString:text
                               attributes:@{NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle],
                                            NSFontAttributeName:font}];
    CGSize size = [str size];
    [str drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    label.attributedText = str;
    label.numberOfLines = 0;
    label.center = self.view.center;
    if (!self.label) {
        [self.view addSubview:label];
    }
    label.attributedText = str;
    self.label = label;
    
    [self.label setNeedsLayout];
    
}
- (void)strokeColorAttributeNameWithFont{
    UIFont *font = [UIFont fontWithName:@"Verdana-Bold" size:30.f];
    NSString *text = @"国境の長いトンネルを抜けると雪国であった。";
    NSAttributedString *str = [[NSAttributedString alloc]
                               initWithString:text
                               attributes:@{NSStrokeColorAttributeName:[UIColor blueColor],
                                            NSStrokeWidthAttributeName:@1,
                                            NSFontAttributeName:font}];
    CGSize size = [str size];
    [str drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    label.attributedText = str;
    label.numberOfLines = 0;
    label.center = self.view.center;
    if (!self.label) {
        [self.view addSubview:label];
    }
    label.attributedText = str;
    self.label = label;
    
    [self.label setNeedsLayout];
    
}
- (void)strokeWidthAttributeNameWithFont{
    UIFont *font = [UIFont fontWithName:@"Verdana-Bold" size:30.f];
    NSString *text = @"国境の長いトンネルを抜けると雪国であった。";
    NSAttributedString *str = [[NSAttributedString alloc]
                               initWithString:text
                               attributes:@{NSStrokeWidthAttributeName:@5,
                                            NSFontAttributeName:font}];
    CGSize size = [str size];
    [str drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    label.attributedText = str;
    label.numberOfLines = 0;
    label.center = self.view.center;
    if (!self.label) {
        [self.view addSubview:label];
    }
    label.attributedText = str;
    self.label = label;
    
    [self.label setNeedsLayout];
    
}

- (void)strokeColorAndWidthAttributeNameFont{
    UIFont *font = [UIFont fontWithName:@"Verdana-Bold" size:30.f];
    NSString *text = @"国境の長いトンネルを抜けると雪国であった。";
    NSAttributedString *str = [[NSAttributedString alloc]
                               initWithString:text
                               attributes:@{NSStrokeColorAttributeName:[UIColor blueColor],
                                            NSStrokeWidthAttributeName:@5,
                                            NSFontAttributeName:font}];
    CGSize size = [str size];
    [str drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    label.attributedText = str;
    label.numberOfLines = 0;
    label.center = self.view.center;
    if (!self.label) {
        [self.view addSubview:label];
    }
    label.attributedText = str;
    self.label = label;
    
    [self.label setNeedsLayout];
    
}

- (void)shadowAttributeNameWithFont{
    UIFont *font = [UIFont fontWithName:@"Verdana-Bold" size:30.f];
    NSString *text = @"国境の長いトンネルを抜けると雪国であった。";
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeMake(1.f, 1.f);   // 影のサイズ
    shadow.shadowColor = [UIColor redColor];      // 影の色
    shadow.shadowBlurRadius = 5.f;                // ぼかしの半径
    NSAttributedString *str = [[NSAttributedString alloc]
                               initWithString:text
                               attributes:@{NSShadowAttributeName:shadow,
                                            NSFontAttributeName:font}];
    CGSize size = [str size];
    [str drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    label.attributedText = str;
    label.numberOfLines = 0;
    label.center = self.view.center;
    if (!self.label) {
        [self.view addSubview:label];
    }
    label.attributedText = str;
    self.label = label;
    
    [self.label setNeedsLayout];
    
}


- (void)verticalGlyphFormAttributeNameWithFont{
    UIFont *font = [UIFont fontWithName:@"Verdana-Bold" size:30.f];
    NSString *text = @"国境の長いトンネルを抜けると雪国であった。";
    NSAttributedString *str = [[NSAttributedString alloc]
                               initWithString:text
                               attributes:@{NSVerticalGlyphFormAttributeName:@1,
                                            NSFontAttributeName:font}];
    CGSize size = [str size];
    [str drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    label.attributedText = str;
    label.numberOfLines = 0;
    label.center = self.view.center;
    if (!self.label) {
        [self.view addSubview:label];
    }
    label.attributedText = str;
    self.label = label;
    
    [self.label setNeedsLayout];
    
}

- (void)mixAttributeName{
    NSString *text = @"国境の長いトンネルを抜けると雪国であった。";

    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
    /* 全体にフォントを適用 */
    [str addAttribute:NSFontAttributeName
                value:[UIFont fontWithName:@"HiraMinProN-W3" size:20.f]
                range:NSMakeRange(0, text.length)];
    /* 一部の範囲に別のフォントを上書きで適用 */
    [str addAttribute:NSFontAttributeName
                value:[UIFont fontWithName:@"STHeitiTC-Medium" size:40.f]
                range:NSMakeRange(3, 6)];
    /* 黄色の文字色 */
    [str addAttribute:NSForegroundColorAttributeName
                value:[UIColor yellowColor]
                range:NSMakeRange(0, 5)];
    /* 打ち消し線 */
    [str addAttribute:NSStrikethroughStyleAttributeName
                value:[NSNumber numberWithInteger:NSUnderlineStyleSingle]
                range:NSMakeRange(10, 3)];
    /* 青の背景色と白の文字色 */
    [str addAttributes:@{NSBackgroundColorAttributeName:[UIColor blueColor],
                         NSForegroundColorAttributeName:[UIColor whiteColor]}
                 range:NSMakeRange(14, 2)];
    /* 赤の枠線と下線 */
    [str addAttributes:@{NSStrokeColorAttributeName:[UIColor redColor],
                         NSStrokeWidthAttributeName:@2.0,
                         NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]}
                 range:NSMakeRange(17, 3)];
    
    CGSize size = [str size];
    [str drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    label.attributedText = str;
    label.numberOfLines = 0;
    label.center = self.view.center;
    if (!self.label) {
        [self.view addSubview:label];
    }
    label.attributedText = str;
    self.label = label;
    
    [self.label setNeedsLayout];
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
