//
//  SettingContentsViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/11/16.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import "SettingContentsViewController.h"

@interface SettingContentsViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *tableList;

@end

@implementation SettingContentsViewController

const NSString *keyTitle = @"title";
const NSString *keyItems = @"items";
const NSString *keySectionStyle = @"sectionStyle";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableList = [self getSettigContentsPlist];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"" forIndexPath:indexPath];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SettingCell"];
    // Configure the cell...
    if (self.tableList[indexPath.section][keyItems]) {
        NSLog(@"%@",self.tableList[indexPath.section][keyItems][indexPath.row][keyTitle]);
        cell.textLabel.text = self.tableList[indexPath.section][keyItems][indexPath.row][keyTitle];
    }
    if (self.tableList[indexPath.section][keyItems][indexPath.row][keySectionStyle]) {
        if (self.tableList[indexPath.section][keyItems][indexPath.row][keySectionStyle]) {
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        } else {
            
        }
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSMutableArray *)getSettigContentsPlist{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Settings"
                                                     ofType:@"plist"];
    NSArray *items = [NSArray arrayWithContentsOfFile:path];
    return [items mutableCopy];
}


@end
