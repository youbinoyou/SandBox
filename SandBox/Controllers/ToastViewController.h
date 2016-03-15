//
//  ToastViewController.h
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/12/16.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^handler)(id sender);

@protocol ToastViewControllerDelegate <NSObject>

@optional
- (void)toast:(id)sender openHandler:(handler)openHandler;
- (void)toast:(id)sender stopHandler:(handler)stopHandler;
- (void)toast:(id)sender closeHandler:(handler)closeHandler;

@end

@interface ToastViewController : UIViewController {
    NSTimer *timer;
}

@property (strong, nonatomic) NSString *message;

@property (strong, nonatomic) IBOutlet UILabel *labelMessage;
@property (strong, nonatomic) IBOutlet UIView *viewMessage;

@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, assign) NSTimeInterval displayDuration;

//起動した時に呼ばれます
@property (nonatomic, assign) void (^startHandler)(id sender);
//起動した時に呼ばれます
@property (nonatomic, assign) void (^doneHandler)(id sender);
//閉じた時に呼ばれます
@property (nonatomic, assign) void (^endHandler)(id sender);

@property (nonatomic, assign) id<ToastViewControllerDelegate> delegate;

@end