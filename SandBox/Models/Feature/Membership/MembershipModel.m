//
//  MembershipModel.m
//  SandBox
//
//  Created by 大島 曜 on 2017/08/17.
//  Copyright © 2017年 大島 曜. All rights reserved.
//  https://github.com/youbinoyou/SandBox/issues/58
//

#import "MembershipModel.h"

@implementation MembershipModel

static MembershipModel *sharedInstance = nil;

//MARK: public
+ (instancetype)getInstance {
    @synchronized(self) {
        if (!sharedInstance) {
            sharedInstance = [MembershipModel setModelDictionary:[MembershipModel startUpMembershipInfo]];
        }
    }
    return sharedInstance;
}

//MARK: conform
/**
 * 表示
 */
- (void)infoDisplay {
    NSLog(@"%@\n*******\n"
          @"name = %@\n"
          @"english = %@\n"
          @"sex = %@\n"
          @"birthday = %@\n"
          @"initialRegistrationDay = %@\n"
          @"lastLoginDay = %@\n"
          @"type = %@\n"
          ,
          self.class,
          self.name,
          self.english,
          self.sex,
          self.birthday,
          self.initialRegistrationDay,
          self.lastLoginDay,
          self.type
          );
    if ([self isLogin]) {
        NSLog(@"こちらの会員はログインしています");
    } else {
        NSLog(@"こちらの会員はログインしていません");
    }
}

/**
 * ログインしているかの判定
 */
- (BOOL)isLogin {
    return self.lastLoginDay;
}

//MARK: input

/**
 * モデル化
 */
+ (MembershipModel *)setModelDictionary:(NSDictionary *)dic {
    MembershipModel *membershioModel = [MembershipModel new];
    membershioModel.name = dic[@"name"];
    membershioModel.english = dic[@"english"];
    membershioModel.sex = dic[@"sex"];
    membershioModel.birthday = dic[@"birthday"];
    membershioModel.initialRegistrationDay = dic[@"initialRegistrationDay"];
    membershioModel.lastLoginDay = dic[@"lastLoginDay"];
    membershioModel.type = dic[@"type"];
    [membershioModel checkModel];
    return membershioModel;
}

//MARK: startUp

/**
 * 初回会員情報情報
 */
+ (NSDictionary *)startUpMembershipInfo {
    return @{
             @"name":@"名無しのごんべい",
             @"english":@"nanashinogonbei",
             @"sex":@"1",
             @"birthday":@"1985/10/10",
             };
}

/**
 * 内容確認
 */
- (void)checkModel {
    if (!self.name) {
        self.name = @"名無しのごんべい";
    }
    if (!self.english) {
        self.english = @"nanashinogonbei";
    }
    if (!self.sex) {
        self.sex = @"1";
    }
    if (!self.birthday) {
        self.birthday = @"1985/10/10";
    }
    //これで初回登録かどうかを確認できる
    if (!self.initialRegistrationDay) {
        self.initialRegistrationDay = [self stringDate:[NSDate new]];
    }
    if (!self.type) {
        self.type = @"0";
    }
}

//MARK: action
- (BOOL)login {
    NSError *loginError = nil;
    if (![self isLogin]) {
        self.lastLoginDay = [self stringDate:[NSDate new]];
        if (self.lastLoginDay) {
            NSLog(@"ログインに成功しました");
            return YES;
        }
    }
    loginError = [NSError errorWithDomain:@"logoutError" code:1 userInfo:@{@"model":self}];
    if (loginError) {
        NSLog(@"なんらかの原因でログインに失敗しました\n\n%@",loginError);
    }
    return NO;

}

- (BOOL)logout {
    NSError *logoutError = nil;
    if ([self isLogin]) {
        self.lastLoginDay = nil;
        if (!self.lastLoginDay) {
            NSLog(@"ログアウトに成功しました");
            return YES;
        }
    }
    logoutError = [NSError errorWithDomain:@"logoutError" code:1 userInfo:@{@"model":self}];
    if (logoutError) {
        NSLog(@"なんらかの原因でログアウトに失敗しました\n\n%@",logoutError);
    }
    return NO;
}

//MARK: private
// TODO: 共通化
- (NSString *)stringDate:(NSDate *)inputDate {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formatter stringFromDate:inputDate];
}

@end
