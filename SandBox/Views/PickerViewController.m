//
//  PickerViewController.m
//  SandBox
//
//  Created by 大島 曜 on 2015/05/15.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()

@property (retain, nonatomic) UIPickerView *picker;

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
    self.picker.delegate = self;
    self.picker.dataSource = self;
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
    // デリゲート先の処理を呼び出し、選択された文字列を親Viewに表示させる
    [self.delegate applySelectedString:[NSString stringWithFormat:@"%ld", row]];
    
    [self closePickerView:nil];
}

// PickerViewの列数を指定するメソッド
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView {
    return 1;
}

// PickerViewに表示する行数を指定するメソッド
-(NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 10;
}

// PickerViewの各行に表示する文字列を指定するメソッド
-(NSString*)pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    //NSArray *data = @[@"",@""];
    return [NSString stringWithFormat:@"%ld", row];
}

// 空の領域にある透明なボタンがタップされたときに呼び出されるメソッド
- (void)closePickerView:(id)sender {
    // PickerViewを閉じるための処理を呼び出す
    [self.delegate closePickerView:self];
}

- (void)dealloc
{
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

@end