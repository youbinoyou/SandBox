//
//  KeyNames.h
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/11/17.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyNames : NSObject

#define KEY_TITLE @"title"
#define KEY_LINL @"link"
#define KEY_ACTION @"action"
#define KEY_LIST_VIEW_CONTROLLER @"listViewController:"

extern const NSString *keyTitle;
extern const NSString *keySetTitle;
extern const NSString *keyItems;
extern const NSString *keySectionStyle;
extern const NSString *keyLink;
extern const NSString *keyLinkURL;
extern const NSString *keyAction;
extern const NSString *keyActionItem;
extern const NSString *keyListViewController;

#define SETTING_CELL @"settingCell"

@end
