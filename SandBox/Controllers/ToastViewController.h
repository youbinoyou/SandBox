//
//  ToastViewController.h
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/12/16.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToastViewController : UIViewController {
    NSTimer *timer;
}

@property (strong, nonatomic) NSString *message;

@property (strong, nonatomic) IBOutlet UILabel *labelMessage;
@property (strong, nonatomic) IBOutlet UIView *viewMessage;

@property (nonatomic,assign) void (^startHandler)(void);
@property (nonatomic,assign) void (^endHandler)(void);

@end