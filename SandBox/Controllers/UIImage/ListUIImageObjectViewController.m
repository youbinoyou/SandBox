//
//  ListUIImageObjectViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/12/15.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import "ListUIImageObjectViewController.h"

@interface ListUIImageObjectViewController ()

@property (nonatomic,strong) UIImageView *mainImageView;

@end

@implementation ListUIImageObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setListButtons];
    // Do any additional setup after loading the view.
    self.mainImageView = [UIImageView new];
    self.mainImageView.center = self.view.center;
    [self.view addSubview:self.mainImageView];
}

- (void)setListButtons {
    
    self.buttons = @[
                     @{
                         keyTitle : @"UIImage",
                         },
                     @{
                         keyTitle : @"UIImageクラスについて",
                         keyAction : @"message"
                         },
                     @{
                         keyTitle : @"画像ファイル名を指定したUIImageの生成",
                         keyAction : @"setImage",
                         },
                     @{
                         keyTitle : @"URLを指定したUIImageの生成",
                         keyAction : @"setImageURL",
                         },
                     @{
                         keyTitle : @"UIImageのプロパティ",
                         },
                     @{
                         keyTitle : @"size",
                         keyAction : @"getSize",
                         },
                     @{
                         keyTitle : @"情報提供元",
                         keyLink : @"http://iphone-tora.sakura.ne.jp/uiimage.html",
                         }
                     
                     ];
    [self setButtons];
}

- (void)message {
    UIAlertView *alert = [UIAlertView new];
    alert.title = @"UIImageクラスは、画像を管理するクラスです。";
    alert.message = @"背景に画像を表示したり、ボタン内に画像を表示したりとプログラム中で画像を扱う場合には、画像ファイルをUIImageオブジェクトにしてから、UIImageViewやUIButton等のコントロールに渡す必要があります。";
    [alert addButtonWithTitle:@"OK"];
    [alert show];
}

- (void)setImage {
    // 画像ファイル名を指定したUIImageの生成例
    UIImage *image = [UIImage imageNamed:@"Sample.png"];

}

- (void)setImageURL {
    
    // URLを指定したUIImageの生成例
    NSData *dt = [NSData dataWithContentsOfURL:
                  [NSURL URLWithString:@"http://cdn.dev.classmethod.jp/wp-content/uploads/2014/08/app_store-100x100.png"]];
    UIImage *image = [[UIImage alloc] initWithData:dt];
    self.mainImageView.image = image;
    CGRect imageRect = self.mainImageView.frame;
    imageRect.size = self.mainImageView.image.size;
    self.mainImageView.frame = imageRect;
    self.mainImageView.center = self.view.center;
    //[self.mainImageView sizeToFit];

}

- (void)getSize {
    //画像のサイズを取得する
    //（例）CGSize cs = image.size;
    //画像の横幅を取得する
    //（例）float width = image.size.width;
    //画像の高さを取得する
    //（例）float height = image.size.height;
    UIAlertView *alert = [UIAlertView new];
    alert.title = @"size";
    alert.message = [NSString stringWithFormat:@"%@",NSStringFromCGSize(self.mainImageView.image.size)];
    [alert addButtonWithTitle:@"OK"];
    [alert show];
}

@end
