//
//  DevelopmentManagementTableViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2016/01/05.
//  Copyright © 2016年 大島 曜. All rights reserved.
//

#import "DevelopmentManagementTableViewController.h"

@interface DevelopmentManagementTableViewController ()<UITableViewDelegate,UITableViewDataSource> {
    int dicCount;
    int keyCount;
    NSString *footerTitle;
}

@property (nonatomic,retain) NSArray *mainTable;

@end

@implementation DevelopmentManagementTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    footerTitle = @"";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"管理"
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(keyChange)];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self load];
    if (self.mainTable) {
        return;
    }
    self.mainTable = @[
                       @{
                           @"プロジェクト管理" : @[
                                   @{
                                       @"no":@"アプリ名-000",
                                       @"着手時期":@"2015/12",
                                       @"納期時期":@"2016/02/29",
                                       @"対象":@"PM",
                                       @"案件名":@"プロジェクトマネージメント",
                                       @"工数":@{
                                               @"PM工数":@"30",
                                               },
                                       @"備考":@"2015/12時点",
                                       }
                                   ]
                           ,
                           @"開発案件" : @[
                                   @{
                                       @"no":@"APP-000",
                                       @"ステータス":@"着手",
                                       @"着手時期":@"2015/12",
                                       @"納期時期":@"2016/01",
                                       @"ドキュメント":@"UI設計書",
                                       @"対象":@"APL",
                                       @"案件名":@"登録（氏名・電話番号）を簡易化",
                                       @"工数":@{
                                               @"設計工数":@"1",
                                               @"製造工数":@"6",
                                               @"テスト工数":@"1",
                                       },
                                       @"備考":@"2015/12時点",
                                       },
                                   
                                   @{
                                       @"no":@"APP-000",
                                       @"ステータス":@"着手",
                                       @"着手時期":@"2015/12",
                                       @"納期時期":@"2016/01",
                                       @"ドキュメント":@"UI設計書",
                                       @"対象":@"APL",
                                       @"案件名":@"登録（氏名・電話番号）を簡易化",
                                       @"工数":@{
                                               @"設計工数":@"1",
                                               @"製造工数":@"6",
                                               @"テスト工数":@"1",
                                               },
                                       @"備考":@"2015/12時点",
                                       },
                                   
                                   @{
                                       @"no":@"APP-000",
                                       @"ステータス":@"着手",
                                       @"着手時期":@"2015/12",
                                       @"納期時期":@"2016/01",
                                       @"ドキュメント":@"UI設計書",
                                       @"対象":@"APL",
                                       @"案件名":@"登録（氏名・電話番号）を簡易化",
                                       @"工数":@{
                                               @"設計工数":@"1",
                                               @"製造工数":@"6",
                                               @"テスト工数":@"1",
                                               },
                                       @"備考":@"2015/12時点",
                                       },
                                   
                                   @{
                                       @"no":@"APP-000",
                                       @"ステータス":@"着手",
                                       @"着手時期":@"2015/12",
                                       @"納期時期":@"2016/01",
                                       @"ドキュメント":@"UI設計書",
                                       @"対象":@"APL",
                                       @"案件名":@"登録（氏名・電話番号）を簡易化",
                                       @"工数":@{
                                               @"設計工数":@"1",
                                               @"製造工数":@"6",
                                               @"テスト工数":@"1",
                                               },
                                       @"備考":@"2015/12時点",
                                       },
                                   
                                   @{
                                       @"no":@"APP-000",
                                       @"ステータス":@"着手",
                                       @"着手時期":@"2015/12",
                                       @"納期時期":@"2016/01",
                                       @"ドキュメント":@"UI設計書",
                                       @"対象":@"APL",
                                       @"案件名":@"登録（氏名・電話番号）を簡易化",
                                       @"工数":@{
                                               @"設計工数":@"1",
                                               @"製造工数":@"6",
                                               @"テスト工数":@"1",
                                               },
                                       @"備考":@"2015/12時点",
                                       },
                                   
                                   @{
                                       @"no":@"APP-000",
                                       @"ステータス":@"着手",
                                       @"着手時期":@"2015/12",
                                       @"納期時期":@"2016/01",
                                       @"ドキュメント":@"UI設計書",
                                       @"対象":@"APL",
                                       @"案件名":@"登録（氏名・電話番号）を簡易化",
                                       @"工数":@{
                                               @"設計工数":@"1",
                                               @"製造工数":@"6",
                                               @"テスト工数":@"1",
                                               },
                                       @"備考":@"2015/12時点",
                                       },
                                   
                                   @{
                                       @"no":@"APP-000",
                                       @"ステータス":@"着手",
                                       @"着手時期":@"2015/12",
                                       @"納期時期":@"2016/01",
                                       @"ドキュメント":@"UI設計書",
                                       @"対象":@"APL",
                                       @"案件名":@"登録（氏名・電話番号）を簡易化",
                                       @"工数":@{
                                               @"設計工数":@"1",
                                               @"製造工数":@"6",
                                               @"テスト工数":@"1",
                                               },
                                       @"備考":@"2015/12時点",
                                       },
                                   
                                   @{
                                       @"no":@"APP-000",
                                       @"ステータス":@"着手",
                                       @"着手時期":@"2015/12",
                                       @"納期時期":@"2016/01",
                                       @"ドキュメント":@"UI設計書",
                                       @"対象":@"APL",
                                       @"案件名":@"登録（氏名・電話番号）を簡易化",
                                       @"工数":@{
                                               @"設計工数":@"1",
                                               @"製造工数":@"6",
                                               @"テスト工数":@"1",
                                               },
                                       @"備考":@"2015/12時点",
                                       }
                                   ],
                           
                           @"SE作業": @[
                                   @{
                                       @"no":@"APP-000",
                                       @"ステータス":@"未実施",
                                       @"着手時期":@"2015/12",
                                       @"納期時期":@"2016/01",
                                       @"ドキュメント":@"source",
                                       @"対象":@"APL",
                                       @"案件名":@"◯◯を表示できるようにする。",
                                       @"工数":@{
                                               @"作業工数":@"1",
                                               },
                                       @"備考":@"2015/12時点、デザインのみ計上",
                                       },
                                   
                                   @{
                                       @"no":@"APP-000",
                                       @"ステータス":@"未実施",
                                       @"着手時期":@"2015/12",
                                       @"納期時期":@"2016/01",
                                       @"ドキュメント":@"source",
                                       @"対象":@"APL",
                                       @"案件名":@"◯◯を表示できるようにする。",
                                       @"工数":@{
                                               @"作業工数":@"1",
                                               },
                                       @"備考":@"2015/12時点、デザインのみ計上",
                                       },
                                   
                                   @{
                                       @"no":@"APP-000",
                                       @"ステータス":@"未実施",
                                       @"着手時期":@"2015/12",
                                       @"納期時期":@"2016/01",
                                       @"ドキュメント":@"source",
                                       @"対象":@"APL",
                                       @"案件名":@"◯◯を表示できるようにする。",
                                       @"工数":@{
                                               @"作業工数":@"1",
                                               },
                                       @"備考":@"2015/12時点、デザインのみ計上",
                                       },
                                   
                                   @{
                                       @"no":@"APP-000",
                                       @"ステータス":@"未実施",
                                       @"着手時期":@"2015/12",
                                       @"納期時期":@"2016/01",
                                       @"ドキュメント":@"source",
                                       @"対象":@"APL",
                                       @"案件名":@"◯◯を表示できるようにする。",
                                       @"工数":@{
                                               @"作業工数":@"1",
                                               },
                                       @"備考":@"2015/12時点、デザインのみ計上",
                                       },
                                   
                                   @{
                                       @"no":@"APP-000",
                                       @"ステータス":@"未実施",
                                       @"着手時期":@"2015/12",
                                       @"納期時期":@"2016/01",
                                       @"ドキュメント":@"source",
                                       @"対象":@"APL",
                                       @"案件名":@"◯◯を表示できるようにする。",
                                       @"工数":@{
                                               @"作業工数":@"1",
                                               },
                                       @"備考":@"2015/12時点、デザインのみ計上",
                                       },
                                   
                                   @{
                                       @"no":@"APP-000",
                                       @"ステータス":@"未実施",
                                       @"着手時期":@"2015/12",
                                       @"納期時期":@"2016/01",
                                       @"ドキュメント":@"source",
                                       @"対象":@"APL",
                                       @"案件名":@"◯◯を表示できるようにする。",
                                       @"工数":@{
                                               @"作業工数":@"1",
                                               },
                                       @"備考":@"2015/12時点、デザインのみ計上",
                                       },
                                   
                                   @{
                                       @"no":@"APP-000",
                                       @"ステータス":@"未実施",
                                       @"着手時期":@"2015/12",
                                       @"納期時期":@"2016/01",
                                       @"ドキュメント":@"source",
                                       @"対象":@"APL",
                                       @"案件名":@"◯◯を表示できるようにする。",
                                       @"工数":@{
                                               @"作業工数":@"1",
                                               },
                                       @"備考":@"2015/12時点、デザインのみ計上",
                                       },
                                   
                                   @{
                                       @"no":@"APP-000",
                                       @"ステータス":@"未実施",
                                       @"着手時期":@"2015/12",
                                       @"納期時期":@"2016/01",
                                       @"ドキュメント":@"source",
                                       @"対象":@"APL",
                                       @"案件名":@"◯◯を表示できるようにする。",
                                       @"工数":@{
                                               @"作業工数":@"1",
                                               },
                                       @"備考":@"2015/12時点、デザインのみ計上",
                                       },
                                   
                                   @{
                                       @"no":@"APP-000",
                                       @"ステータス":@"未実施",
                                       @"着手時期":@"2015/12",
                                       @"納期時期":@"2016/01",
                                       @"ドキュメント":@"source",
                                       @"対象":@"APL",
                                       @"案件名":@"◯◯を表示できるようにする。",
                                       @"工数":@{
                                               @"作業工数":@"1",
                                               },
                                       @"備考":@"2015/12時点、デザインのみ計上",
                                       }
                                   ],
                           
                           @"見送り作業": @[
                                   @{
                                       @"no":@"-",
                                       @"ステータス":@"-",
                                       @"着手時期":@"-",
                                       @"納期時期":@"-",
                                       @"ドキュメント":@"-",
                                       @"対象":@"-",
                                       @"案件名":@"-",
                                       @"工数":@{
                                               @"作業工数":@"-",
                                               },
                                       @"備考":@"-",
                                       }
                                   ]

                           }
                       ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return [self.mainTable count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    NSDictionary *dic = self.mainTable[section];
    NSString *dicKey = [dic allKeys][dicCount];
    return [dic[dicKey] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *dic = self.mainTable[section];
    NSString *dicKey = [dic allKeys][dicCount];
    return [NSString stringWithFormat:@"%@>%@",dicKey,footerTitle];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    // Configure the cell...
    NSDictionary *dic = self.mainTable[indexPath.section];
    NSString *dicKey = [dic allKeys][dicCount];
    NSDictionary *item = dic[dicKey][indexPath.row];
    NSString *key = [item allKeys][keyCount];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",item[key]];
    return cell;
}

- (void)keyChange {
    NSDictionary *dic = self.mainTable[0];
    UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:@"管理"
                                                                                 message:@"選択してください。" preferredStyle:UIAlertControllerStyleActionSheet];
    [alertViewController addAction:[UIAlertAction actionWithTitle:@"保存"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * _Nonnull action) {
                                                              [self save];
                                                          }]];
    for (NSString *key in [dic allKeys]) {
        
        UIAlertActionStyle style = ([[dic allKeys] indexOfObject:key] == dicCount)?UIAlertActionStyleDestructive:UIAlertActionStyleDefault;
        [alertViewController addAction:[UIAlertAction actionWithTitle:key
                                                                style:style
                                                              handler:^(UIAlertAction * _Nonnull action) {
                                                                  int d = (int)[[dic allKeys] indexOfObject:key];
                                                                  dicCount = d;
                                                                  [self.tableView reloadData];
                                                              }]];
    }
    [alertViewController addAction:[UIAlertAction actionWithTitle:@"前の表"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * _Nonnull action) {
                                                              dicCount--;
                                                              if (dicCount < 0) {
                                                                  dicCount = 0;
                                                              }
                                                              [self.tableView reloadData];
                                                          }]];
    [alertViewController addAction:[UIAlertAction actionWithTitle:@"次の表"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * _Nonnull action) {
                                                              dicCount++;
                                                              if ([[dic allKeys] count] <= dicCount) {
                                                                  dicCount = 0;
                                                              }
                                                              [self.tableView reloadData];
                                                          }]];
    
    [self presentViewController:alertViewController animated:YES completion:^(void){
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *dic = self.mainTable[indexPath.section];
    NSString *dicKey = [dic allKeys][dicCount];
    NSDictionary *item = dic[dicKey][indexPath.row];
    UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:@"管理"
                                                                                 message:@"選択してください。" preferredStyle:UIAlertControllerStyleAlert];
    [alertViewController addAction:[UIAlertAction actionWithTitle:@"最初のリスト"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * _Nonnull action) {
                                                              keyCount = 0;
                                                              footerTitle = [item allKeys][keyCount];
                                                              [self.tableView reloadData];
                                                          }]];

    for (NSString *key in [item allKeys]) {
        
        UIAlertActionStyle style = ([[item allKeys] indexOfObject:key] == keyCount)?UIAlertActionStyleDestructive:UIAlertActionStyleDefault;
        [alertViewController addAction:[UIAlertAction actionWithTitle:key
                                                                style:style
                                                              handler:^(UIAlertAction * _Nonnull action) {
                                                                  int d = (int)[[item allKeys] indexOfObject:key];
                                                                  keyCount = d;
                                                                  footerTitle = [item allKeys][keyCount];
                                                                  [self.tableView reloadData];
                                                              }]];
    }
    [alertViewController addAction:[UIAlertAction actionWithTitle:@"前のリスト"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * _Nonnull action) {
                                                              keyCount--;
                                                              if (keyCount < 0) {
                                                                  keyCount = 0;
                                                              }
                                                              footerTitle = [item allKeys][keyCount];
                                                              [self.tableView reloadData];
                                                          }]];
    [alertViewController addAction:[UIAlertAction actionWithTitle:@"次のリスト"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * _Nonnull action) {
                                                              keyCount++;
                                                              if ([[item allKeys] count] <= keyCount) {
                                                                  keyCount = 0;
                                                              }
                                                              footerTitle = [item allKeys][keyCount];
                                                              [self.tableView reloadData];
                                                          }]];
    
    [self presentViewController:alertViewController animated:YES completion:^(void){
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }];
    
}

- (BOOL)saveWithFilePath:(NSString *)fileName withObject:(id)saveData {
    
    BOOL successful = [saveData writeToFile:fileName atomically:NO];
    if (successful) {
        NSLog(@"%@", @"データの保存に成功しました。");
    }
//    
//    self.mainTable = [[NSArray alloc] initWithContentsOfFile:fileName];
//    if (self.mainTable) {
//        for (NSString *data in self.mainTable) {
//            NSLog(@"%@", data);
//        }
//    } else {
//        NSLog(@"%@", @"データが存在しません。");
//    }
    return successful;
}

- (id)loadWithFilePath:(NSString *)fileName {
    id loadData = [[NSArray alloc] initWithContentsOfFile:fileName];
    if (loadData) {
//        for (NSString *data in loadData) {
//            NSLog(@"%@", data);
//        }
        NSLog(@"<<success>>データ:%@",fileName);
    } else {
        NSLog(@"%@", @"データが存在しません。");
        loadData = nil;
    }
    return loadData;
}

- (void)load {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directory = [paths objectAtIndex:0];
    NSString *filePath = [directory stringByAppendingPathComponent:@"DevelopmentManagementMainTable.plist"];
    
    self.mainTable = [self loadWithFilePath:filePath];
}

- (void)save {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directory = [paths objectAtIndex:0];
    NSString *filePath = [directory stringByAppendingPathComponent:@"DevelopmentManagementMainTable.plist"];
    
    [self saveWithFilePath:filePath withObject:self.mainTable];
    return;
    
    BOOL successful = [self.mainTable writeToFile:filePath atomically:NO];
    if (successful) {
        NSLog(@"%@", @"データの保存に成功しました。");
    }
    
    self.mainTable = [[NSArray alloc] initWithContentsOfFile:filePath];
    if (self.mainTable) {
        for (NSString *data in self.mainTable) {
            NSLog(@"%@", data);
        }
    } else {
        NSLog(@"%@", @"データが存在しません。");
    }
}

- (void)originalDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *cacheDirPath = [paths objectAtIndex:0];
    NSString *filePath = [cacheDirPath stringByAppendingPathComponent:@"DevelopmentManagementMainTable.plist"];
//    Person *tYamada = [[Person alloc] init];
//    tYamada.name = @"山田太郎";
//    Address *yAddress = [[Address alloc] init];
//    yAddress.zipCode = @"104-0061";
//    yAddress.state = @"東京都";
//    yAddress.city = @"中央区";
//    yAddress.other = @"銀座1丁目";
//    tYamada.address = yAddress;
    
    // 注意！tYamada オブジェクトをそのまま保存することはできない
    // NSArray *array = @[tYamada];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:@""];
    NSArray *array = @[data];
    BOOL successful = [array writeToFile:filePath atomically:YES];
    if (successful) {
        NSLog(@"%@", @"データの保存に成功しました。");
    }
    
    array = [[NSArray alloc] initWithContentsOfFile:filePath];
    if (array) {
        for (NSData *data in array) {
            id person = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            NSLog(@"%@", person);
        }
    } else {
        NSLog(@"%@", @"データが存在しません。");
    }

    /*
     保存できるデータの種類
     
     さきほども説明した通りおおもとのデータは NSArray か NSDictionary 型でないといけませんがその下の階層に保存できるデータの種類は複数あります。
     プロパティリストで保存できるデータの種類は以下の通りです。
     
     NSString
     NSNumber
     実数型、数値型、ブール型に対応
     NSData
     NSDate
     NSArray
     NSDictionary
     */
    
    
    // NSCachesDirectoryを引数に渡し、戻ってきた配列の
    // 一つ目の要素を取得するとCacheディレクトリを取得できます。
    array = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    cacheDirPath = [array objectAtIndex:0];
    
    // まずは、新規で作るディレクトリの絶対パスを作成します。
    
    NSString *newCacheDirPath = [cacheDirPath stringByAppendingPathComponent:@"sampleDirectory"];
    // 次にFileManagerを用いて、ディレクトリの作成を行います。
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    BOOL created = [fileManager createDirectoryAtPath:newCacheDirPath
                          withIntermediateDirectories:YES
                                           attributes:nil
                                                error:&error];
    // 作成に失敗した場合は、原因をログに出します。
    if (!created) {
        NSLog(@"failed to create directory. reason is %@ - %@", error, error.userInfo);
    }
    
    /*
     
    // 保存するデータ。
    // 今回は、サーバー上のデータを直接取得して、NSData形式で保持します。
    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.yoheim.net/image/108.png"]];
    
    // 保存する先のパス
    NSString *savedPath = [newCacheDirPath stringByAppendingPathComponent:@"110.png"];
    
    // 保存処理を行う。
    // 失敗した場合には、NSErrorのインスタンスを得られるので、
    // その情報を表示する。
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    BOOL success = [fileManager createFileAtPath:path contents:data attributes:nil];
    if (!success) {
        NSLog(@"failed to save image. reason is %@ - %@", error, error.userInfo);
    }
     */
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

@end
