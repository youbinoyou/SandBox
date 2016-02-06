//
//  ContentsSettingTableViewCell.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/12/22.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import "ContentsSettingTableViewCell.h"

@interface ContentsSettingTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *settingTableLabel;
@property (weak, nonatomic) IBOutlet UISwitch *settingTableSwitch;

@end

@implementation ContentsSettingTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _settingTableLabel.text = @"";
    _settingTableSwitch.on = NO;
}

/**
 * 属性を設定
 *
 * @param attributeDictionary 属性ディクショナリ
 */
- (void)setAttribute:(NSDictionary *)attributeDictionary
{
    NSLog(@"attributeDictionary : %@",attributeDictionary);
    self.backgroundColor = attributeDictionary[@"backgroundColor"];
    self.settingTableLabel.textColor = attributeDictionary[@"textColor"];
    if (attributeDictionary) {
        self.settingTableSwitch.on = [attributeDictionary[@"switch.on"] boolValue];
        self.settingTableSwitch.hidden = !self.settingTableSwitch.on;
    } else {
        self.settingTableSwitch.hidden = YES;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/**
 * モデルの設定
 *
 * @param modelDictionary モデルディクショナリ
 */
- (void)setModelDictionary:(NSDictionary *)modelDictionary
{
    NSLog(@"modelDictionary : %@",modelDictionary);
    [self setAttribute:modelDictionary[@"attribute"]];
    self.settingTableLabel.text = modelDictionary[@"text"];
}

- (IBAction)settingTableSwitchAction:(id)sender {
    UISwitch *sendSwitch = (UISwitch *)sender;
    if (sendSwitch.on) {
        NSLog(@"ON");
    } else {
        NSLog(@"OFF");
    }
}

@end
