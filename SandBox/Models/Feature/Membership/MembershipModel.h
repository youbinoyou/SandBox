//
//  MembershipModel.h
//  SandBox
//
//  Created by 大島 曜 on 2017/08/17.
//  Copyright © 2017年 大島 曜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MembershipModel : NSObject

@property (nonatomic,retain) NSString *name; //名前
@property (nonatomic,retain) NSString *english; //英語表記

@property (nonatomic,retain) NSString *sex; //性別

@property (nonatomic,retain) NSString *birthday; //誕生日
@property (nonatomic,retain) NSString *initialRegistrationDay; //初回登録

@property (nonatomic,retain) NSString *lastLoginDay; //ログインした日の登録

//会員識別
@property (nonatomic,retain) NSString *type; //会員識別

//instance作成
+ (instancetype)getInstance;

//MARK: conform
- (void)infoDisplay;
- (BOOL)isLogin;

//MARK: input
+ (MembershipModel *)setModelDictionary:(NSDictionary *)dic;

//MARK: startUp
+ (NSDictionary *)startUpMembershipInfo;

//MARK: action
- (BOOL)login;
- (BOOL)logout;

@end
