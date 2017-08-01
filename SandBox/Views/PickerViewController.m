//
//  PickerViewController.m
//  SandBox
//
//  Created by 大島 曜 on 2015/05/15.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "PickerViewController.h"
#import <QuartzCore/QuartzCore.h>

#import "PickerViewModel.h"
#import "JapanCityNameModel.h"

@interface PickerViewController ()

@property (retain, nonatomic) UIPickerView *picker;

@property (retain, nonatomic) PickerViewModel *pickerViewModel;

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
    }
    //初回位置
    self.picker.frame = CGRectMake(10,
                                   CGRectGetHeight([UIScreen mainScreen].bounds) / 2.0f,
                                   CGRectGetWidth([UIScreen mainScreen].bounds) - 20,
                                   CGRectGetHeight([UIScreen mainScreen].bounds) / 2.0f);
    
    _pickerViewModel = [PickerViewModel new];
    _pickerViewModel.pickerView = self.picker;
    //背景の設定
    _pickerViewModel.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0.3 alpha:0.5];
    
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
    
    [self.picker selectRow:row inComponent:component animated:YES];
    
    //0 番目は、選択しても何も起こらない
    if ([_pickerViewModel.items[row].number integerValue] > 0) {
        // デリゲート先の処理を呼び出し、選択された文字列を親Viewに表示させる
        if ([self.delegate respondsToSelector:@selector(applySelectedString:)]) {
            [self.delegate applySelectedString:_pickerViewModel.items[row].title];//[NSString stringWithFormat:@"%ld", row]];
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
    return [_pickerViewModel.items count];
}

// PickerViewの各行に表示する文字列を指定するメソッド
- (NSString *)pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    //NSArray *data = @[@"",@""];
    JapanCityNameModel *model = _pickerViewModel.items[row];
    return model.title;// [NSString stringWithFormat:@"%ld", row];
}

- (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component NS_AVAILABLE_IOS(6_0) __TVOS_PROHIBITED { // attributed title is favored if both methods are implemented
    [_pickerViewModel attributedTitle:_pickerViewModel.items[row].title];
    return _pickerViewModel.attributedString;
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
