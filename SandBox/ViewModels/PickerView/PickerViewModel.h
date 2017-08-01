//
//  PickerViewModel.h
//  SandBox
//
//  Created by YouOhshima on 2017/08/01.
//  Copyright © 2017年 大島 曜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class JapanCityNameModel;
@interface PickerViewModel : NSObject

//選択されない行
@property (nonatomic,retain) NSArray *nonSelectRows;

@property (nonatomic,strong) UIPickerView *pickerView;
@property (nonatomic,retain) UIColor *backgroundColor;
@property (nonatomic,assign) BOOL masksToBounds;
@property (nonatomic,assign) CGSize shadowOffset;
@property (nonatomic,assign) CGFloat shadowOpacity;
@property (nonatomic,assign) CGFloat shadowRadius;
@property (nonatomic,retain) UIColor *shadowColor;

@property (nonatomic,retain) NSArray<JapanCityNameModel *> *items;

//
@property (nonatomic,retain) NSAttributedString *attributedString;
- (void)attributedTitle:(NSString *)title;

@end
