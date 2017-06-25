//
//  ColorCheckMarkTableViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/11/18.
//  Copyright © 2015年 大島 曜. All rights reserved.
//
// http://qiita.com/uebo/items/105f95a69025863c1177
//

#import "ColorCheckMarkTableViewController.h"
#import "UITableViewCell+Common.h"

const NSInteger tableview_section = 1;

@interface ColorCheckMarkTableViewController ()

@end

@implementation ColorCheckMarkTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //チェックボックスの色を変更
    // -3.0
    [self.tableView setValue:[UIColor blackColor] forKey:@"multiselectCheckmarkColor"];
    // 6.0 -
    [[UITableViewCell appearance] setTintColor:[UIColor orangeColor]];
    // YESで複数選択・NOで単一選択
    self.tableView.allowsMultipleSelection = YES;
    //データを保存する
    if (!self.parameter) {
        NSMutableArray *array = [NSMutableArray new];
        for (int i = 0; i < 20; i++) {
            [array addObject:@(NO)];
        }
        self.parameter = array;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidAppear:(BOOL)animated
{
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Incomplete implementation, return the number of sections
    return tableview_section;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    return [_parameter count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[UITableViewCell identifier]];
    //[tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    // Configure the cell...
    cell.textLabel.text = @"index";
    if (indexPath.row % 4 == 2) {
        cell.tintColor = [UIColor yellowColor];
    } else  if (indexPath.row % 4 == 3) {
        cell.tintColor = [UIColor greenColor];
    }
    return cell;
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

// セルが選択された時に呼び出される
// 選択されたときにチェックマークをつける
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    /*
    // 選択されたセルを取得
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.row % 4 == 0) {
        // URLを指定したUIImageの生成例
        // この部分が重要
        dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_queue_t q_main = dispatch_get_main_queue();
        dispatch_async(q_global, ^{
            NSString *imageURL = @"http://icons.iconarchive.com/icons/yellowicon/game-stars/256/Mario-icon.png";
            NSData *imageData= [NSData dataWithContentsOfURL : [NSURL URLWithString: imageURL]];
            dispatch_async(q_main, ^{
                UIImage *image = [[UIImage alloc] initWithData:imageData];
                UIImageView *checkmark = [[UIImageView alloc] initWithImage:image];
                checkmark.frame = CGRectMake(0, 0, 55, 55);
                cell.accessoryView = checkmark;
            });
        });
        
    } else if(indexPath.row % 4 == 1) {
        // URLを指定したUIImageの生成例
        // この部分が重要
        dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_queue_t q_main = dispatch_get_main_queue();
        dispatch_async(q_global, ^{
            NSString *imageURL = @"http://iau.ae/iau2/wp-content/uploads/2014/01/coaching_icon1.png";
            NSData *imageData= [NSData dataWithContentsOfURL : [NSURL URLWithString: imageURL]];
            dispatch_async(q_main, ^{
                UIImage *image = [[UIImage alloc] initWithData:imageData];
                UIImageView *checkmark = [[UIImageView alloc] initWithImage:image];
                checkmark.frame = CGRectMake(0, 0, 55, 55);
                cell.accessoryView = checkmark;
            });
        });

    } else {
        // セルのアクセサリにチェックマークを指定
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } */
    //データを保存する
    if (self.parameter) {
        self.parameter[indexPath.row] = @(![self.parameter[indexPath.row] boolValue]);
    }
    [self scrollViewDidScroll:self.tableView];
}

// セルの選択がはずれた時に呼び出される
// 選択がはずれた時にチェックマークを外す
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 選択がはずれたセルを取得
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.row % 4 < 2) {
        cell.accessoryView = nil;
    } else {
        // セルのアクセサリを解除する（チェックマークを外す）
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    //データを保存する
    if (self.parameter) {
        self.parameter[indexPath.row] = @(![self.parameter[indexPath.row] boolValue]);
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    for (NSIndexPath *path in [self.tableView indexPathsForVisibleRows]) {
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:path];
        if ([self.parameter[path.row] boolValue]) {
            [self.tableView selectRowAtIndexPath:path
                                        animated:YES
                                  scrollPosition:UITableViewScrollPositionNone];
            if (path.row % 4 == 0) {
                // URLを指定したUIImageの生成例
                // この部分が重要
                dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
                dispatch_queue_t q_main = dispatch_get_main_queue();
                dispatch_async(q_global, ^{
                    NSString *imageURL = @"http://icons.iconarchive.com/icons/yellowicon/game-stars/256/Mario-icon.png";
                    NSData *imageData= [NSData dataWithContentsOfURL : [NSURL URLWithString: imageURL]];
                    dispatch_async(q_main, ^{
                        UIImage *image = [[UIImage alloc] initWithData:imageData];
                        UIImageView *checkmark = [[UIImageView alloc] initWithImage:image];
                        checkmark.frame = CGRectMake(0, 0, 55, 55);
                        cell.accessoryView = checkmark;
                    });
                });
                
            } else if(path.row % 4 == 1) {
                // URLを指定したUIImageの生成例
                // この部分が重要
                dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
                dispatch_queue_t q_main = dispatch_get_main_queue();
                dispatch_async(q_global, ^{
                    NSString *imageURL = @"http://iau.ae/iau2/wp-content/uploads/2014/01/coaching_icon1.png";
                    NSData *imageData= [NSData dataWithContentsOfURL : [NSURL URLWithString: imageURL]];
                    dispatch_async(q_main, ^{
                        UIImage *image = [[UIImage alloc] initWithData:imageData];
                        UIImageView *checkmark = [[UIImageView alloc] initWithImage:image];
                        checkmark.frame = CGRectMake(0, 0, 55, 55);
                        cell.accessoryView = checkmark;
                    });
                });
                
            } else {
                // セルのアクセサリにチェックマークを指定
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
        }
    }
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end