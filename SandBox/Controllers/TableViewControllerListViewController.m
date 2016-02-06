//
//  TableViewControllerListViewController.m
//  SandBox
//
//  Created by YouOhshima on 2015/05/20.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "TableViewControllerListViewController.h"

@interface TableViewControllerListViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation TableViewControllerListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.buttons = @[
                    @{@"title":@"UITableViewControllerStylePlain",
                      @"subtitle":@"StylePlain",
                      @"headertitle":@"StylePlain",
                      @"action":@"newUITableViewControllerStylePlain:"},
                    @{@"title":@"UITableViewControllerStyleGrouped",
                      @"subtitle":@"StyleGrouped",
                      @"headertitle":@"StyleGrouped",
                      @"action":@"newUITableViewControllerStyleGrouped:"},
                    @{@"title":@"閉じる",
                      @"subtitle":@"クローズ",
                      @"headertitle":@"処理",
                      @"action":@"close:"},
                    ];
    
    CGRect rectButton = CGRectZero;
    for (NSDictionary *item in self.buttons) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        const CGFloat r = arc4random_uniform(255) / 255.0;
        const CGFloat g = arc4random_uniform(255) / 255.0;
        const CGFloat b = arc4random_uniform(255) / 255.0;
        
        button.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:0.5];
        [button setTitle:item[@"title"] forState:UIControlStateNormal];
        [button sizeToFit];
        button.tag = [self.buttons indexOfObject:item];
        rectButton.origin.x = 20;
        rectButton.size.width  = [UIScreen mainScreen].applicationFrame.size.width - 40;
        rectButton.size.height = [UIScreen mainScreen].applicationFrame.size.height / (self.buttons.count + 2);
        rectButton.origin.y += rectButton.size.height + 1;
        button.frame = rectButton;
        if (item[@"action"]) {
            SEL action = NSSelectorFromString(item[@"action"]);
            if ([self respondsToSelector:action]) {
                [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
            }
        }
        if (item[@"listViewController:"]) {
            SEL action = NSSelectorFromString(@"listViewController:event:");
            if ([self respondsToSelector:action]) {
                [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
            }
        }
        [self.view addSubview:button];
    }
    
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



// action

- (void)newUITableViewControllerStylePlain:(id)sender
{
    UITableViewController *tableViewController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    tableViewController.title = @"Plain";
    tableViewController.tableView.delegate = self;
    tableViewController.tableView.dataSource = self;
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tableViewController];
    tableViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(close:)];
    tableViewController.modalTransitionStyle = arc4random_uniform(4);
    [self presentViewController:navigationController animated:YES completion:^(){
    }];
}

- (void)newUITableViewControllerStyleGrouped:(id)sender
{
    UITableViewController *tableViewController = [[UITableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    tableViewController.title = @"Grouped";
    tableViewController.tableView.delegate = self;
    tableViewController.tableView.dataSource = self;
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tableViewController];
    tableViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(close:)];
    tableViewController.modalTransitionStyle = arc4random_uniform(4);
    [self presentViewController:navigationController animated:YES completion:^(){
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.buttons count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = self.buttons[indexPath.section][@"title"];
    cell.detailTextLabel.text = self.buttons[indexPath.section][@"subtitle"];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
        return self.buttons[section][@"headertitle"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.buttons[indexPath.section][@"action"]) {
        SEL action = NSSelectorFromString(self.buttons[indexPath.section][@"action"]);
        if ([self respondsToSelector:action]) {
            [self performSelector:action withObject:nil afterDelay:0.0];
            NSLog(@"action");
        }
    }
    if (self.buttons[indexPath.section][@"listViewController:"]) {
        SEL action = NSSelectorFromString(@"listViewController:event:");
        if ([self respondsToSelector:action]) {
            [self performSelector:action withObject:nil afterDelay:0.0];
            NSLog(@"action");
        }
    }

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^(void){
        
    }];
}

@end
