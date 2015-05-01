//
//  CustomAlertController.h
//  sandbox-iOS
//
//  Created by You Ohshima on 2015/04/20.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CustomAlertActionStyle) {
    CustomAlertActionStyleDefault = 0,
    CustomAlertActionStyleCancel,
    CustomAlertActionStyleDestructive
};

typedef NS_ENUM(NSInteger, CustomAlertControllerStyle) {
    CustomAlertControllerStyleActionSheet = 0,
    CustomAlertControllerStyleAlert
};

/**
 * カスタムアラートアクションクラス
 */
@interface CustomAlertAction : NSObject

typedef void (^CustomAlertActionHandler) (CustomAlertAction *action);

+ (instancetype)actionWithTitle:(NSString *)title style:(CustomAlertActionStyle)style handler:(CustomAlertActionHandler) handler;

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) CustomAlertActionStyle style;
@property (nonatomic, getter=isEnabled) BOOL enabled;

@end

/**
 * カスタムアラートコントローラークラス
 */
@interface CustomAlertController : UIViewController

+ (instancetype)customAlertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(CustomAlertControllerStyle)preferredStyle;

- (void)addAction:(CustomAlertAction *)action;

@property (nonatomic, readonly) NSArray *actions;
@property (nonatomic, readonly) NSArray *textFields;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *message;

@property (nonatomic, readonly) CustomAlertControllerStyle preferredStyle;

@end
