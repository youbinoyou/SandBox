//
//  SettingContentsViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/11/16.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import "SettingContentsViewController.h"
#import "KeyNames.h"

@interface SettingContentsViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *tableList;

@end

@implementation SettingContentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableList = [self getSettigContentsPlist];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return [self.tableList count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    NSArray *items = self.tableList[section][keyItems];
    return [items count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *headerTitle = @"";
    if (self.tableList[section][keyTitle]) {
        headerTitle = self.tableList[section][keyTitle];
    }
    return headerTitle;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [UIView new];
    headerView.backgroundColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1.0];
    UILabel *headerLabel = [UILabel new];
    //headerLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:1.0];
    headerLabel.text =  [self tableView:tableView titleForHeaderInSection:section];
    [headerLabel sizeToFit];
    [headerView addSubview:headerLabel];
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"" forIndexPath:indexPath];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SETTING_CELL];
    // Configure the cell...
    NSArray *tableSectionItems = self.tableList[indexPath.section][keyItems];
    if (tableSectionItems[indexPath.row][keySectionStyle]) {
        if (tableSectionItems[indexPath.row][keySectionStyle]) {
            UITableViewCellSelectionStyle style = [tableSectionItems[indexPath.row][keySectionStyle] integerValue];
            cell.selectionStyle = style;
        } else {
            
        }
    }
    if (tableSectionItems[indexPath.row]) {
        NSLog(@"table[%ld][%@] = %@",indexPath.section,keyItems,tableSectionItems);
        cell.textLabel.text = self.tableList[indexPath.section][keyItems][indexPath.row][keyTitle];
        if (self.tableList[indexPath.section][keyItems]) {
            cell.textLabel.text = self.tableList[indexPath.section][keyItems][indexPath.row][keyTitle];
        }
        NSString *setTitle = tableSectionItems[indexPath.row][keySetTitle];
        if (setTitle) {
            setTitle = [setTitle stringByAppendingString:@":"];
           SEL selectorTitle = NSSelectorFromString(setTitle);
            if ([self respondsToSelector:selectorTitle]) {
                [self performSelector:selectorTitle withObject:cell afterDelay:0.0];
            } else {
                NSLog(@"noActon : %@",setTitle);
            }
        }
    }
    return cell;
}

- (void)stringVersion:(id)sender {
    NSDictionary *mainBundleInfoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSLog(@"%@",mainBundleInfoDictionary);
    NSString *CFBundleShortVersionString;
    CFBundleShortVersionString = mainBundleInfoDictionary[@"CFBundleShortVersionString"];
    NSLog(@"バージョン %@",
          mainBundleInfoDictionary[@"CFBundleShortVersionString"]);
    NSString *CFBundleVersion;
    CFBundleVersion = mainBundleInfoDictionary[@"CFBundleVersion"];
    NSLog(@"ビルド %@",
          mainBundleInfoDictionary[@"CFBundleVersion"]);
    UITableViewCell *cell = (UITableViewCell *)sender;
    cell.textLabel.text = [cell.textLabel.text stringByAppendingFormat:@" : %@ ビルド : %@",
                           CFBundleShortVersionString,
                           CFBundleVersion];
}

- (void)setAppStoreReceiptURL:(id)sender {
    NSURL *appStoreReceiptURL = [[NSBundle mainBundle] appStoreReceiptURL];
    UITableViewCell *cell = (UITableViewCell *)sender;
    NSString *text = nil;
    if ([[UIApplication sharedApplication] canOpenURL:appStoreReceiptURL]) {
        text = [cell.textLabel.text stringByAppendingFormat:@" : %@",
                appStoreReceiptURL];
    } else {
        text = [cell.textLabel.text stringByAppendingString:@" : AppStoreReceiptURL"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = text;
}

- (void)openAppStoreReceiptURL {
    NSURL *appStoreReceiptURL = [[NSBundle mainBundle] appStoreReceiptURL];
    if ([[UIApplication sharedApplication] canOpenURL:appStoreReceiptURL]) {
        [[UIApplication sharedApplication] openURL:appStoreReceiptURL];
    } else {
        NSString *appStoreReceiptString = [NSString stringWithFormat:@"%@",appStoreReceiptURL];
        NSURL *file = [NSURL fileURLWithPath:appStoreReceiptString];
        NSLog(@"appStoreReceiptURL : %@",file);
    }
}

- (void)setGitHub:(id)sender {
    NSURL *appStoreReceiptURL = [[NSBundle mainBundle] appStoreReceiptURL];
    UITableViewCell *cell = (UITableViewCell *)sender;
    NSString *text = nil;
    if ([[UIApplication sharedApplication] canOpenURL:appStoreReceiptURL]) {
        text = [cell.textLabel.text stringByAppendingFormat:@" : %@",
                appStoreReceiptURL];
    } else {
        text = [cell.textLabel.text stringByAppendingString:@" : GitHubURL"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = text;
}

//- (void)linkURLAction:(id)sender event:(id)event {
//    
//}

- (void)linkURLOpen:(id)sender {
    NSDictionary *sendItem = (NSDictionary *)sender;
    NSString *linkURLString = sendItem[@"linkURL"];
    NSURL *linkURL = [NSURL URLWithString:linkURLString];
    if ([[UIApplication sharedApplication] canOpenURL:linkURL]) {
        [[UIApplication sharedApplication] openURL:linkURL];
    } else {
        NSLog(@"リンク切れ : %@",linkURLString);
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *actionItem = self.tableList[indexPath.section][keyItems][indexPath.row][keyActionItem];
    if (actionItem) {
        SEL action = NSSelectorFromString(actionItem[keyAction]);
        if ([self respondsToSelector:action]) {
            NSLog(@"%@",actionItem);
            [self performSelector:action withObject:actionItem afterDelay:0.0];
        } else {
            NSLog(@"noActionItem : %@",actionItem);
        }
    } else {
        NSString *stringAction = self.tableList[indexPath.section][keyItems][indexPath.row][keyAction];
        if (stringAction) {
            SEL action = NSSelectorFromString(stringAction);
            if ([self respondsToSelector:action]) {
                [self performSelector:action withObject:tableView afterDelay:0.0];
            } else {
                NSLog(@"noAction : %@",stringAction);
            }
        }
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSMutableArray *)getSettigContentsPlist{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Settings"
                                                     ofType:@"plist"];
    NSArray *items = [NSArray arrayWithContentsOfFile:path];
    return [items mutableCopy];
}


@end
