//
//  ListUICollectionViewControllerObjectViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2016/03/16.
//  Copyright © 2016年 大島 曜. All rights reserved.
//

#import "ListUICollectionViewControllerObjectViewController.h"
#import "SandBoxCalendarViewController.h"
#import "CollectionViewController.h"
#import "CalendarDayCell.h"

@interface ListUICollectionViewControllerObjectViewController ()

@end

@implementation ListUICollectionViewControllerObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setListButtons];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setListButtons
{
    self.buttons = @[
                     @{
                         keyTitle : @"カレンダー",
                         keyAction : @"sandBoxCalendarViewController:"
                         },
                     @{
                         keyTitle : @"CollectionViewController",
                         keyAction : @"collectionViewController:"
                         },
                     ];
    [self setButtons];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)sandBoxCalendarViewController:(id)sender
{
    SandBoxCalendarViewController *calendarViewController =
    [[UIStoryboard storyboardWithName:@"Calender" bundle:nil] instantiateViewControllerWithIdentifier:@"SandBoxCalendarViewController"];
    [self.navigationController pushViewController:calendarViewController animated:YES];
}

- (void)collectionViewController:(id)sender
{
    CollectionViewController *collectionViewController = [[CollectionViewController alloc] init];
    //collectionViewController.view.backgroundColor = self.view.backgroundColor;
    //collectionViewController.view.frame = self.view.frame;
    collectionViewController.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 200, 200) collectionViewLayout:[[UICollectionViewLayout alloc] init]];
    [collectionViewController.collectionView registerClass:[CalendarDayCell class] forCellWithReuseIdentifier:@"CalendarDayCell"];
    [self.navigationController pushViewController:collectionViewController animated:YES];
}

@end
