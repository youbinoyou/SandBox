//
//  AppDelegate.m
//  SandBox
//
//  Created by 大島 曜 on 2015/04/10.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import "AppDelegate.h"
#import "MembershipModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    MembershipModel *membershipModel = [MembershipModel getInstance];
    [membershipModel infoDisplay];
    
    // Let the device know we want to receive push notifications
    if ([[UIApplication sharedApplication] isRegisteredForRemoteNotifications]) {
        /*
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
         (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
         */
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeNone|UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil]];
    }
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(windowDidBecomeVisible:)
//                                                 name:UIWindowDidBecomeVisibleNotification
//                                               object:nil];
    // Override point for customization after application launch.
    NSString *exceptionLog = [[NSUserDefaults standardUserDefaults] stringForKey:@"exceptionLog"];
    if (exceptionLog) {
        UIAlertView *alertController = [UIAlertView new];
        alertController.title = @"前回のエラー";
        alertController.message = exceptionLog;
        [alertController addButtonWithTitle:@"OK"];
        [alertController show];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"exceptionLog"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    // エラー追跡用の機能を追加する。
    NSSetUncaughtExceptionHandler(&exceptionHandler);
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    NSLog(@"My token is: %@", deviceToken);
    UIAlertView *alertController = [UIAlertView new];
    alertController.title = @"トークン";
    alertController.message = [NSString stringWithFormat:@"%@",deviceToken];
    [alertController addButtonWithTitle:@"OK"];
    [alertController show];

}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
    NSLog(@"Failed to get token, error: %@", error);
}


-(void)windowDidBecomeVisible:(NSNotification*)noti
{
    UIWindow *window = noti.object;
    NSLog(@"window = %@, windowLevel = %@", window, @(window.windowLevel));
    NSLog(@"app's windows = %@", [UIApplication sharedApplication].windows);
}

- (void)dealloc
{
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

// 異常終了を検知した場合に呼び出されるメソッド
void exceptionHandler(NSException *exception) {
    // ここで、例外発生時の情報を出力します。
    // NSLog関数でcallStackSymbolsを出力することで、
    // XCODE上で開発している際にも、役立つスタックトレースを取得できるようになります。
    NSLog(@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
    NSLog(@"exception.name : %@", exception.name);
    NSLog(@"exception.reason : %@", exception.reason);
    NSLog(@"exception.callStackSymbols : %@", exception.callStackSymbols);
    
    // ログをUserDefaultsに保存しておく。
    // 次の起動の際に存在チェックすれば、前の起動時に異常終了したことを検知できます。
    //NSString *log = [NSString stringWithFormat:@"%@, %@, %@", exception.name, exception.reason, exception.callStackSymbols];
    [[NSUserDefaults standardUserDefaults] setValue:
     [NSString stringWithFormat:@"name : [%@]\nreason : [%@]\ncallStackSymbols : [%@]",
      exception.name,
      exception.reason,
      exception.callStackSymbols] forKey:@"exceptionLog"];
}

@end
