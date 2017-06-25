//
//  ActivityViewControllerListViewController.m
//  SandBox
//
//  Created by YouOhshima on 2015/05/15.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "ActivityViewControllerListViewController.h"
#import "Store.h"

@interface ActivityViewControllerListViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain) NSArray *buttons;
@property (nonatomic,retain) NSArray *datas;
@property (nonatomic,retain) UITableView *tableView;

@end

@implementation ActivityViewControllerListViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.buttons = @[
                     @{@"title":@"アクティティビューコントローラ起動",@"action":@"setActivityViewControllerAction:",
                      
                       },
                     
                     @{@"title":@"ストア情報",@"action":@"storeMaking"},
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
- (void)cheackUIAlertView:(UIAlertView *)alertView{
    
    if (alertView.delegate) {
        /* @property(nonatomic,assign) id delegate; */
        NSLog(@"delegate : %@",alertView.delegate);
    }
    
    if (alertView.title) {
        /* @property(nonatomic,copy) NSString *title; */
        NSLog(@"title : %@",alertView.title);
    }
    
    if (alertView.message) {
        /* @property(nonatomic,copy) NSString *message; */
        NSLog(@"message : %@",alertView.message);
    }
    
    if (alertView.numberOfButtons){
        /* @property(nonatomic,readonly) NSInteger numberOfButtons; */
        NSLog(@"numberOfButtons : %ld",(long)alertView.numberOfButtons);
    }
    
    if ([alertView respondsToSelector:@selector(buttonTitleAtIndex:)]){
        /*  - (NSString *)buttonTitleAtIndex:(NSInteger)buttonIndex; */
        for (int b = 0; b < alertView.numberOfButtons; b++) {
            NSLog(@"alert[%d].title = %@",b,[alertView buttonTitleAtIndex:b]);
        }
    }
    
    if (alertView.cancelButtonIndex > -1){
        /* @property(nonatomic) NSInteger cancelButtonIndex; */
        NSLog(@"cancelButtonIndex : %ld",(long)alertView.cancelButtonIndex);
    }
    
    if (alertView.firstOtherButtonIndex){
        /* @property(nonatomic,readonly) NSInteger firstOtherButtonIndex; */
        NSLog(@"firstOtherButtonIndex : %ld",(long)alertView.firstOtherButtonIndex);
    }
    
    if (alertView.visible){
        /* @property(nonatomic,readonly,getter=isVisible) BOOL visible; */
        NSLog(@"visible : %@",alertView.visible?@"YES":@"NO");
    }
    
    if ([alertView respondsToSelector:@selector(dismissWithClickedButtonIndex:animated:)]){
        /*  - (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated; */
        for (int b = 0; b < alertView.numberOfButtons; b++) {
            BOOL animeted = (arc4random_uniform(10) / 10.0) > 5?YES:NO;
            [alertView dismissWithClickedButtonIndex:b animated:animeted];
        }
    }
    
    switch (alertView.alertViewStyle) {
            /*  @property(nonatomic,assign) UIAlertViewStyle alertViewStyle;NS_AVAILABLE_IOS(5_0) */
            //            typedef NS_ENUM(NSInteger, UIAlertViewStyle) {
            //                UIAlertViewStyleDefault = 0,
            //                UIAlertViewStyleSecureTextInput,
            //                UIAlertViewStylePlainTextInput,
            //                UIAlertViewStyleLoginAndPasswordInput
            //            };
            
        case UIAlertViewStyleDefault : {
            NSLog(@"alertViewStyle : %ld",(long)UIAlertViewStyleDefault);
            break;
        }
        case UIAlertViewStyleSecureTextInput : {
            NSLog(@"alertViewStyle : %ld",(long)UIAlertViewStyleSecureTextInput);
            break;
        }
        case UIAlertViewStylePlainTextInput : {
            NSLog(@"alertViewStyle : %ld",(long)UIAlertViewStylePlainTextInput);
            break;
        }
        case UIAlertViewStyleLoginAndPasswordInput : {
            NSLog(@"alertViewStyle : %ld",(long)UIAlertViewStyleLoginAndPasswordInput);
            break;
        }
        default:{
            NSLog(@"alertViewStyle : %ld",(long)alertView.alertViewStyle);
            break;
        }
    }
    
}

- (void)newUIAlertView:(id)sender{
    
    NSLog(@"%@ : 生成",sender);
    
    //    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"UIAlertView"
    //                                                        message:@"message"
    //                                                       delegate:self
    //                                              cancelButtonTitle:@"キャンセル"
    //                                              otherButtonTitles:nil];
    
    UIAlertView *alertView = [UIAlertView new];
    NSDictionary *item = self.buttons[0][@"UIAlertView"];
    if (item[@"title"]) {
        alertView.title = item[@"title"];
    }
    if (item[@"message"]) {
        alertView.message = item[@"message"];
    }
    if (item[@"delegate"]) {
        alertView.delegate = item[@"delegate"];
    }
    for(int b = 0; b < alertView.numberOfButtons;b++) {
        NSLog(@"button[%d] : %@",b,[alertView buttonTitleAtIndex:b]);
    }
    if (item[@"buttonTitles"]) {
        if ([alertView respondsToSelector:@selector(addButtonWithTitle:)]){
            /* - (NSInteger)addButtonWithTitle:(NSString *)title; */
            NSArray *buttonTitles = item[@"buttonTitles"];
            if ([buttonTitles isKindOfClass:[NSArray class]]) {
                for(NSString *buttonTitle in buttonTitles){
                    [alertView addButtonWithTitle:buttonTitle];
                }
            }
        }
    }
    if (item[@"cancelButtonIndex"]) {
        alertView.cancelButtonIndex = [item[@"cancelButtonIndex"] integerValue];
    }
    if (item[@"alertViewStyle"]) {
        alertView.alertViewStyle = [item[@"alertViewStyle"] integerValue];
    }
    
    //
    [self cheackUIAlertView:alertView];
    
    if ([alertView respondsToSelector:@selector(show)]){
        /*  - (void)show; */
        [alertView show];
    }
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSLog(@"%s",__PRETTY_FUNCTION__);
    NSLog(@"@param\n\nalertView:\n%@\nindex:\n%ld",alertView,buttonIndex);
    NSLog(@"alert[%ld].title = %@",buttonIndex,[alertView buttonTitleAtIndex:buttonIndex]);
    
    [self cheackUIAlertView:alertView];
    
    if (UIAlertViewStylePlainTextInput == alertView.alertViewStyle){
        if ([alertView respondsToSelector:@selector(textFieldAtIndex:)]){
            /*  - (UITextField *)textFieldAtIndex:(NSInteger)textFieldIndex NS_AVAILABLE_IOS(5_0); */
            for (int b = 0; b < 1; b++) {
                NSLog(@"alertView.text = %@",[alertView textFieldAtIndex:b].text);
            }
        }
    }
    if (UIAlertViewStyleSecureTextInput == alertView.alertViewStyle){
        if ([alertView respondsToSelector:@selector(textFieldAtIndex:)]){
            /*  - (UITextField *)textFieldAtIndex:(NSInteger)textFieldIndex NS_AVAILABLE_IOS(5_0); */
            for (int b = 0; b < 1; b++) {
                NSLog(@"alertView.text = %@",[alertView textFieldAtIndex:b].text);
            }
        }
    }
    if (UIAlertViewStyleLoginAndPasswordInput == alertView.alertViewStyle){
        if ([alertView respondsToSelector:@selector(textFieldAtIndex:)]){
            /*  - (UITextField *)textFieldAtIndex:(NSInteger)textFieldIndex NS_AVAILABLE_IOS(5_0); */
            for (int b = 0; b < 2; b++) {
                NSLog(@"alertView.text = %@",[alertView textFieldAtIndex:b].text);
            }
        }
    }
}

- (void)alertViewCancel:(UIAlertView *)alertView  {
    
    //    NSLog(@"%s",__PRETTY_FUNCTION__);
    //    NSLog(@"@param\n\nalertView:\n%@",alertView);
    
}

/**
 * UIAlertViewを呼び出す前の処理
 */
- (void)willPresentAlertView:(UIAlertView *)alertView {
    
    //    NSLog(@"%s",__PRETTY_FUNCTION__);
    //    NSLog(@"@param\n\nalertView:\n%@",alertView);
    
}

/**
 * UIAlertViewを呼び出した後の処理
 */
- (void)didPresentAlertView:(UIAlertView *)alertView {
    
    //    NSLog(@"%s",__PRETTY_FUNCTION__);
    //    NSLog(@"@param\n\nalertView:\n%@",alertView);
    
}

/**
 * UIAlertViewのボタンを表示する前の処理
 */
- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    //    NSLog(@"%s",__PRETTY_FUNCTION__);
    //    NSLog(@"@param\n\nalertView:\n%@\nindex:\n%ld",alertView,buttonIndex);
    
}

/**
 * UIAlertViewのボタンを表示した後の処理
 */
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    //    NSLog(@"%s",__PRETTY_FUNCTION__);
    //    NSLog(@"@param\n\nalertView:\n%@\nindex:\n%ld",alertView,buttonIndex);
    
}

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView {
    
    NSLog(@"%s",__PRETTY_FUNCTION__);
    NSLog(@"@param\n\nalertView:\n%@",alertView);
    
    [self cheackUIAlertView:alertView];
    
    return NO;
}

- (void)setCustomAlertTitle:(NSString *)title {
    title = @"カメハメハ";
    NSMutableArray *mButtons = [self.buttons mutableCopy];
    NSMutableDictionary *mButton = [mButtons[0] mutableCopy];
    NSMutableDictionary *mUIAlertView = [mButton[@"UIAlertView"] mutableCopy];
    mUIAlertView[@"title"] = title;
    mButton[@"UIAlertView"] = mUIAlertView;
    mButtons[0] = mButton;
    self.buttons = mButtons;
}

- (void)setCustomAlertMessage:(NSString *)message {
    message = @"カメハメハ";
    NSMutableArray *mButtons = [self.buttons mutableCopy];
    NSMutableDictionary *mButton = [mButtons[0] mutableCopy];
    NSMutableDictionary *mUIAlertView = [mButton[@"UIAlertView"] mutableCopy];
    mUIAlertView[@"message"] = message;
    mButton[@"UIAlertView"] = mUIAlertView;
    mButtons[0] = mButton;
    self.buttons = mButtons;
}

- (void)setCustomAlertDelegate:(id)delegate {
    delegate = self;
    NSMutableArray *mButtons = [self.buttons mutableCopy];
    NSMutableDictionary *mButton = [mButtons[0] mutableCopy];
    NSMutableDictionary *mUIAlertView = [mButton[@"UIAlertView"] mutableCopy];
    mUIAlertView[@"delegate"] = delegate;
    mButton[@"UIAlertView"] = mUIAlertView;
    mButtons[0] = mButton;
    self.buttons = mButtons;
}

- (void)setCustomAlertCancelButtonIndex:(NSInteger )cancelButtonIndex {
    NSMutableArray *mButtons = [self.buttons mutableCopy];
    NSMutableDictionary *mButton = [mButtons[0] mutableCopy];
    NSMutableDictionary *mUIAlertView = [mButton[@"UIAlertView"] mutableCopy];
    mUIAlertView[@"cancelButtonIndex"] = [NSNumber numberWithInteger:cancelButtonIndex];
    mButton[@"UIAlertView"] = mUIAlertView;
    mButtons[0] = mButton;
    self.buttons = mButtons;
}
- (void)selectCustomAlertCancelButtonIndex{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"UIAlertView"
                                                                   message:@"cancelButtonIndex?"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    NSArray *buttonTitles = self.buttons[0][@"UIAlertView"][@"buttonTitles"];
    for(NSString *buttonTitle in buttonTitles){
        [alert addAction:[UIAlertAction actionWithTitle:buttonTitle
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction *action){
                                                    [self setCustomAlertCancelButtonIndex:[buttonTitles indexOfObject:buttonTitle]];
                                                }]];
    }
    
    [self presentViewController:alert animated:YES completion:^(){
        
    }];
    
}

- (void)setCustomAlertViewStyle:(UIAlertViewStyle )alertViewStyle {
    NSMutableArray *mButtons = [self.buttons mutableCopy];
    NSMutableDictionary *mButton = [mButtons[0] mutableCopy];
    NSMutableDictionary *mUIAlertView = [mButton[@"UIAlertView"] mutableCopy];
    mUIAlertView[@"alertViewStyle"] = [NSNumber numberWithInteger:alertViewStyle];
    mButton[@"UIAlertView"] = mUIAlertView;
    mButtons[0] = mButton;
    self.buttons = mButtons;
}

- (void)selectCustomAlertViewStyle{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"UIAlertView"
                                                                   message:@"alertViewStyle?"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"UIAlertViewStyleDefault"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction *action){
                                                [self setCustomAlertViewStyle:UIAlertViewStyleDefault];
                                            }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"UIAlertViewStylePlainTextInput"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction *action){
                                                [self setCustomAlertViewStyle:UIAlertViewStylePlainTextInput];
                                            }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"UIAlertViewStyleSecureTextInput"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction *action){
                                                [self setCustomAlertViewStyle:UIAlertViewStyleSecureTextInput];
                                            }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"UIAlertViewStyleLoginAndPasswordInput"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction *action){
                                                [self setCustomAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
                                            }]];
    
    [self presentViewController:alert animated:YES completion:^(){
        
    }];
    
}

- (void)setCustomAlertButtonTitles:(NSArray *)buttonTitles {
    buttonTitles = @[
                     @"button1",
                     @"button2",
                     @"button3（キャンセル）",
                     ];
    NSMutableArray *mButtons = [self.buttons mutableCopy];
    NSMutableDictionary *mButton = [mButtons[0] mutableCopy];
    NSMutableDictionary *mUIAlertView = [mButton[@"UIAlertView"] mutableCopy];
    mUIAlertView[@"buttonTitles"] = buttonTitles;
    mButton[@"UIAlertView"] = mUIAlertView;
    mButtons[0] = mButton;
    self.buttons = mButtons;
}

-(void)defalutUIAlertButtonAction:(id)sender {
    NSMutableArray *mButtons = [self.buttons mutableCopy];
    NSMutableDictionary *mButton = [mButtons[0] mutableCopy];
    mButton[@"UIAlertView"] = @{
                                @"title":@"UIAlertView",
                                @"message":@"message",
                                @"delegate":self,
                                @"cancelButtonIndex":@1,
                                @"alertViewStyle":[NSNumber numberWithInteger:UIAlertViewStyleDefault],
                                @"buttonTitles":@[
                                        @"ボタンタイトル１",
                                        @"ボタンタイトル２（キャンセル）",
                                        @"ボタンタイトル３",
                                        ]
                                };
    mButtons[0] = mButton;
    self.buttons = mButtons;
}

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
        navigationController.modalTransitionStyle = arc4random_uniform(4);
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

- (void)setActivityViewControllerAction:(id)sender
{
    //共有したい物を用意 (Arrayにまとめる)
    NSString *text = [NSString stringWithFormat:@"文字文字文字文字"];
    NSURL *url = [NSURL URLWithString:@"http://www....."];
    NSArray *array = @[text,url];
    
    //連携可能アプリをArrayに。
    UIActivity *activity = [UIActivity new];
    NSArray *app = @[activity];
    
    //アクティビティビューコントローラー
    UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:array applicationActivities:app];
    [self presentViewController:activityVC animated:YES completion:nil];
}


- (void)storeMaking
{
    if (!self.tableView)
    {
        self.tableView = [UITableView new];
        [self.view addSubview:self.tableView];
    }
    self.tableView.frame = CGRectMake(0,
                                      CGRectGetMidY([UIScreen mainScreen].applicationFrame),
                                      CGRectGetWidth([UIScreen mainScreen].applicationFrame),
                                      CGRectGetHeight([UIScreen mainScreen].applicationFrame) / 2.0);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
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
    return [[[UILocalizedIndexedCollation currentCollation] sectionTitles] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.datas objectAtIndex:section] count];
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
    cell.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.3];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (0 == [[self.datas objectAtIndex:section] count])
    {
        return nil;
    }
    return [[[UILocalizedIndexedCollation currentCollation] sectionTitles] objectAtIndex:section];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [[UILocalizedIndexedCollation currentCollation] sectionIndexTitles];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index];
}

@end
