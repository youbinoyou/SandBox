//
//  ContentsSettingTableView.h
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/12/22.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ContentsSettingTableView;
@protocol ContentsSettingTableViewDelegate <NSObject>

- (void)contentsCellObject:(id)sender action:(SEL)action;
- (void)contentsSettingTableView:(ContentsSettingTableView *)settingTableView action:(SEL)action;

@end

@interface ContentsSettingTableView : UITableView

@property (nonatomic,assign) id<ContentsSettingTableViewDelegate> contentsDelegate;

@end
