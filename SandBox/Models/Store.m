//
//  Store.m
//  SandBox
//
//  Created by 大島 曜 on 2015/05/15.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "Store.h"

@interface Store()

@end

@implementation Store

/**
 * お店情報の生成
 *
 * @param 店舗名
 * @param 発音ガイド
 * @param 都道府県
 * @return お店情報インスタンス
 */
- (id)initWithBranchName:(NSString *)sBranchName
          phoneticGuides:(NSString *)sPhoneticGuides
              prefecture:(NSString *)sPrefecture
{
    self = [super init];
    if (self != nil) {
        self.branchName = sBranchName;
        self.phoneticGuides = sPhoneticGuides;
        self.prefecture = sPrefecture;
    }
    return self;
}

@end
