//
//  TableViewListViewController.m
//  SandBox
//
//  Created by YouOhshima on 2015/05/15.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "TableViewListViewController.h"
#import "Store.h"

@interface TableViewListViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain) NSArray *buttons;
@property (nonatomic,retain) NSArray *datas;
@property (nonatomic,retain) NSArray *prefectures;
@property (nonatomic,retain) UITableView *tableView;

@end

@implementation TableViewListViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.buttons = @[
                     @{@"title":@"ストア情報",@"action":@"storeMaking"},
                     @{@"title":@"ストア情報",@"action":@"storeMakingSortPrefectures"},
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


- (void)listViewController:(id)sender event:(id)event{
    
    NSLog(@"%s",__PRETTY_FUNCTION__);
    NSLog(@"@param\n\nsender:\n%@\nevent:\n%@",sender,event);
    
    UIButton *sendButton = sender;
    Class listViewControllerClass = NSClassFromString(self.buttons[sendButton.tag][@"listViewController:"]);
    if (listViewControllerClass) {
        /**
         * 遷移するViewControllerの生成
         */
        UIViewController *listViewController = [[listViewControllerClass alloc] init];
        listViewController.view.backgroundColor = self.view.backgroundColor;
        listViewController.title = self.buttons[sendButton.tag][@"title"];
        listViewController.navigationItem.leftBarButtonItem =
        // TOPページに戻る処理
        [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(dismissCloseButtonAction:)];
        
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:listViewController];
        navigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:navigationController animated:YES completion:^(){
            NSLog(@"%@",self.buttons[sendButton.tag][@"title"]);
        }];
    } else {
        NSLog(@"No Class : %@",self.buttons[sendButton.tag][@"listViewController:"]);
    }
}

/**
 * TOPページに戻る処理
 */
- (void)dismissCloseButtonAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^(){
        NSLog(@"%@",sender);
    }];
}

- (void)dealloc
{
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

- (void)storeMakingSortPrefectures {
    
    if (!self.tableView)
    {
        self.tableView = [UITableView new];
        self.tableView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:self.tableView];
        self.tableView.frame = CGRectMake(0,
                                          CGRectGetMaxY([UIScreen mainScreen].applicationFrame),
                                          CGRectGetWidth([UIScreen mainScreen].applicationFrame),
                                          CGRectGetHeight([UIScreen mainScreen].applicationFrame) / 2.0);
    }
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tag = 1;
    [UIView animateKeyframesWithDuration:0.3
                                   delay:0.3
                                 options:UIViewKeyframeAnimationOptionLayoutSubviews
                              animations:^(void){
                                  self.tableView.frame = CGRectMake(0,
                                                                    CGRectGetMidY([UIScreen mainScreen].applicationFrame),
                                                                    CGRectGetWidth([UIScreen mainScreen].applicationFrame),
                                                                    CGRectGetHeight([UIScreen mainScreen].applicationFrame) / 2.0);
                                  
                              }completion:^(BOOL finished) {
                                  
                              }];
    
    NSArray *tempDatas = [self createStore];
    self.prefectures = @[@"東京都", @"神奈川県", @"千葉県", @"埼玉県"];
    UILocalizedIndexedCollation *collation = [UILocalizedIndexedCollation currentCollation];
    
    NSInteger sectionCount = self.prefectures.count;
    NSMutableArray *unsortedSections = [NSMutableArray arrayWithCapacity:sectionCount];
    
    for (int i = 0; i < sectionCount; i++) {
        [unsortedSections addObject:[NSMutableArray array]];
    }
    
    for (id data in tempDatas) {
        NSInteger index = [self.prefectures indexOfObject:((Store *)data).prefecture];
        [[unsortedSections objectAtIndex:index] addObject:data];
    }
    
    NSMutableArray *sections = [NSMutableArray arrayWithCapacity:sectionCount];
    
    for (NSMutableArray *section in unsortedSections) {
        [sections addObject:[collation sortedArrayFromArray:section collationStringSelector:@selector(phoneticGuides)]];
    }
    
    self.datas = sections;
}

- (void)storeMaking
{
    if (!self.tableView)
    {
        self.tableView = [UITableView new];
        self.tableView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:self.tableView];
        self.tableView.frame = CGRectMake(0,
                                          CGRectGetMaxY([UIScreen mainScreen].applicationFrame),
                                          CGRectGetWidth([UIScreen mainScreen].applicationFrame),
                                          CGRectGetHeight([UIScreen mainScreen].applicationFrame) / 2.0);
    }

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tag = 0;

    [UIView animateKeyframesWithDuration:0.3
                                   delay:0.3
                                 options:UIViewKeyframeAnimationOptionLayoutSubviews
                              animations:^(void){
                                  self.tableView.frame = CGRectMake(0,
                                                                    CGRectGetMidY([UIScreen mainScreen].applicationFrame),
                                                                    CGRectGetWidth([UIScreen mainScreen].applicationFrame),
                                                                    CGRectGetHeight([UIScreen mainScreen].applicationFrame) / 2.0);

                              }completion:^(BOOL finished) {
                                  
                              }];
    
    NSArray *tempDatas = [self createStore];
    UILocalizedIndexedCollation *collation = [UILocalizedIndexedCollation currentCollation];
    
    NSInteger sectionCount = [[collation sectionTitles] count];
    NSMutableArray *unsortedSections = [NSMutableArray arrayWithCapacity:sectionCount];
    
    for (int i = 0; i < sectionCount; i++)
    {
        [unsortedSections addObject:[NSMutableArray array]];
    }
    
    for (id data in tempDatas)
    {
        NSInteger index = [collation sectionForObject:data collationStringSelector:@selector(phoneticGuides)];
        [[unsortedSections objectAtIndex:index] addObject:data];
    }
    
    NSMutableArray *sections = [NSMutableArray arrayWithCapacity:sectionCount];
    
    for (NSMutableArray *section in unsortedSections)
    {
        [sections addObject:[collation sortedArrayFromArray:section collationStringSelector:@selector(phoneticGuides)]];
    }
    
    self.datas = sections;
}

- (NSArray *)createStore
{
    Store *temp1 = [[Store alloc] initWithBranchName:@"新宿店"
                                      phoneticGuides:@"しんじゅく"
                                          prefecture:@"東京都"];
    Store *temp2 = [[Store alloc] initWithBranchName:@"飯田橋店"
                                      phoneticGuides:@"いいだばし"
                                          prefecture:@"東京都"];
    Store *temp3 = [[Store alloc] initWithBranchName:@"立川店"
                                      phoneticGuides:@"たちかわ"
                                          prefecture:@"東京都"];
    Store *temp4 = [[Store alloc] initWithBranchName:@"大手町店"
                                      phoneticGuides:@"おおてまち"
                                          prefecture:@"東京都"];
    Store *temp5 = [[Store alloc] initWithBranchName:@"成田店"
                                      phoneticGuides:@"なりた"
                                          prefecture:@"千葉県"];
    Store *temp6 = [[Store alloc] initWithBranchName:@"浦安店"
                                      phoneticGuides:@"うらやす"
                                          prefecture:@"千葉県"];
    Store *temp7 = [[Store alloc] initWithBranchName:@"みなとみらい店"
                                      phoneticGuides:@"みなとみらい"
                                          prefecture:@"神奈川県"];
    Store *temp8 = [[Store alloc] initWithBranchName:@"川崎店"
                                      phoneticGuides:@"かわさき"
                                          prefecture:@"神奈川県"];
    Store *temp9 = [[Store alloc] initWithBranchName:@"溝の口店"
                                      phoneticGuides:@"みぞのくち"
                                          prefecture:@"神奈川県"];
    Store *temp10 = [[Store alloc] initWithBranchName:@"朝霞店"
                                       phoneticGuides:@"あさか"
                                           prefecture:@"埼玉県"];
    NSArray *tempDatas = @[temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10];
    
    return tempDatas;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (0 == tableView.tag)
    {
        return [[[UILocalizedIndexedCollation currentCollation] sectionTitles] count];
    }
    if (1 == tableView.tag)
    {
        return self.prefectures.count;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (0 == tableView.tag)
    {
        return [[self.datas objectAtIndex:section] count];
    }
    if (1 == tableView.tag)
    {
        return [[self.datas objectAtIndex:section] count];
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Store *data = [[self.datas objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.text = data.branchName;
    cell.backgroundColor = [UIColor colorWithRed:1 green:0.9 blue:0.6 alpha:1.0];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (0 == tableView.tag)
    {
        if (0 == [[self.datas objectAtIndex:section] count])
        {
            return nil;
        }
        return [[[UILocalizedIndexedCollation currentCollation] sectionTitles] objectAtIndex:section];
    }
    if (1 == tableView.tag)
    {
        return [self.prefectures objectAtIndex:section];
    }
    return nil;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if (0 == tableView.tag)
    {
        return [[UILocalizedIndexedCollation currentCollation] sectionIndexTitles];
    }
    if (1 == tableView.tag)
    {
        return self.prefectures;
    }
    return nil;
}


- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if (0 == tableView.tag)
    {
        return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index];
    }
    if (1 == tableView.tag)
    {
        return index;
    }
    return index;
}

@end

