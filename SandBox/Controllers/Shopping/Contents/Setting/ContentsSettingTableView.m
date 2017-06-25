//
//  ContentsSettingTableView.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/12/22.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import "ContentsSettingTableView.h"
#import "ContentsSettingTableViewCell.h"
#import "CustomButtonCell.h"
#import "CommonCell.h"

@interface ContentsSettingTableView () <UITableViewDelegate,UITableViewDataSource,CustomButtonCellDelegate>
/**
 * テーブルアイテムリスト
 */
@property (retain, nonatomic) NSArray *tableItemList;

@end

@implementation ContentsSettingTableView

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.tableItemList = @[
                               @{
                                   @"CellIdentifier":@"ContentsSettingTableViewCell",
                                   @"items":@[
                                           @{
                                               @"text":@"青",
                                               @"attribute":@{
                                                       @"backgroundColor":[UIColor colorWithRed:0 green:0 blue:1 alpha:0.5],
                                                       @"textColor":[UIColor colorWithRed:1 green:1 blue:1 alpha:1]}
                                               }
                                           ]
                                   },
                               @{
                                   @"items":@[
                                           @{
                                               @"text":@"水",
                                               @"attribute":@{
                                                       @"backgroundColor":[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5],
                                                       @"textColor":[UIColor colorWithRed:0 green:0 blue:0 alpha:1]}
                                               }
                                           ]
                                   },
                               @{
                                   @"items":@[
                                           @{
                                               @"text":@"緑",
                                               @"attribute":@{
                                                       @"backgroundColor":[UIColor colorWithRed:0 green:1 blue:0 alpha:0.5],
                                                       @"textColor":[UIColor colorWithRed:1 green:1 blue:1 alpha:1]}
                                               }
                                           ]
                                   },
                               @{
                                   @"items":@[
                                           @{
                                               @"text":@"黄",
                                               @"attribute":@{
                                                       @"backgroundColor":[UIColor colorWithRed:1 green:1 blue:0 alpha:0.5],
                                                       @"textColor":[UIColor colorWithRed:0 green:0 blue:0 alpha:1]}
                                               }
                                           ]
                                   },
                               @{
                                   @"items":@[
                                           @{
                                               @"text":@"赤",
                                               @"attribute":@{
                                                       @"backgroundColor":[UIColor colorWithRed:1 green:0 blue:0 alpha:0.5],
                                                       @"textColor":[UIColor colorWithRed:1 green:1 blue:1 alpha:1]}
                                               }
                                           ]
                                   },
                               @{
                                   @"items":@[
                                           @{
                                               @"text":@"紫",
                                               @"attribute":@{
                                                       @"backgroundColor":[UIColor colorWithRed:1 green:0 blue:1 alpha:0.5],
                                                       @"textColor":[UIColor colorWithRed:1 green:1 blue:1 alpha:1]}
                                               }
                                           ]
                                   },
                               @{
                                   @"items":@[
                                           @{
                                               @"text":@"白",
                                               @"attribute":@{
                                                       @"switch.on":@(YES),
                                                       @"backgroundColor":[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5],
                                                       @"textColor":[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]}
                                               }
                                           ]
                                   },
                               @{
                                   @"items":@[
                                           @{
                                               @"text":@"黒",
                                               @"attribute":@{
                                                       @"backgroundColor":[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5],
                                                       @"textColor":[UIColor colorWithRed:1 green:1 blue:1 alpha:1.0]
                                                       }
                                               }
                                           ]
                                   },
                               @{
                                   @"CellIdentifier":@"CustomButtonCell",
                                   @"items":@[
                                           @{
                                               @"text":@"画面を閉じる",
                                               @"action":@"close"
                                               }
                                           ],
                                   },

                               ];
        self.separatorColor = [UIColor clearColor];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"items : %ld",(long)[self.tableItemList[section][@"items"]
         count]);
    return [self.tableItemList[section][@"items"] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"tableItemList : %ld",(long)self.tableItemList.count);
    return self.tableItemList.count;
}


// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // スタイルを指定した生成例
    static NSString *CellIdentifier = @"ContentsSettingTableViewCell";
    if (self.tableItemList[indexPath.section][@"CellIdentifier"]) {
        CellIdentifier = self.tableItemList[indexPath.section][@"CellIdentifier"];
    }
    //UITableViewCell *cell =
    //[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    CommonCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//     CustomerIntegrationSearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.customerIntegrationSearchList[indexPath.section][@"cellAttribute"][indexPath.row][@"cellIdentifire"] forIndexPath:indexPath];
    if ([cell isKindOfClass:[CustomButtonCell class]]) {
        ((CustomButtonCell *)cell).delegate = self;
    }
    [cell setModelDictionary:self.tableItemList[indexPath.section][@"items"][indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SEL action = NSSelectorFromString(self.tableItemList[indexPath.section][@"items"][indexPath.row][@"action"]);
    if (action) {
        NSLog(@"action : %@",NSStringFromSelector(action));
        
        //[self performSelector:action withObject:nil afterDelay:0.0];
        [self.contentsDelegate contentsSettingTableView:((ContentsSettingTableView *)tableView) action:action];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - CustomButtonCellDelegate

- (void)customButtonAction:(CustomButtonCell *)sender action:(SEL)action {
    NSLog(@"customButtonAction : %@",sender);
    if (self.contentsDelegate && [self.contentsDelegate respondsToSelector:@selector(contentsCellObject:action:)]) {
        [self.contentsDelegate contentsCellObject:sender action:action];
    }
}

@end
