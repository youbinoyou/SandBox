//
//  Store.h
//  SandBox
//
//  Created by 大島 曜 on 2015/05/15.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * お店情報クラス
 */
@interface Store : NSObject

/**
 * 店舗名
 */
@property(nonatomic, strong) NSString *branchName;

/**
 * 発音ガイド
 */
@property(nonatomic, strong) NSString *phoneticGuides;

/**
 * 都道府県
 */
@property(nonatomic, strong) NSString *prefecture;

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
              prefecture:(NSString *)sPrefecture;

@end
