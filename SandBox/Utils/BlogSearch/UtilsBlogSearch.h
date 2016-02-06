//
//  UtilsBlogSearch.h
//  SandBox
//
//  Created by CatenaRentalSystem on 2016/01/04.
//  Copyright © 2016年 大島 曜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UtilsBlogSearch : NSObject <NSXMLParserDelegate>
{
    BOOL isManyoshuTag;
    BOOL isMakiTag;
    NSMutableArray *xmltoArrayList;

    NSMutableArray *arrayList;
    NSMutableArray *arrayStack;
    NSString *textInProgress;
    NSString *elementTitleStr;
    NSString *elements;
    NSInteger shift;
}


- (id)init;

- (void)dealloc;

- (NSArray *)titleList;
- (BOOL)requestXml: (NSString *) urlstr;

@end