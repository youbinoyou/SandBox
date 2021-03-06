//
//  ListUIViewObjectViewController.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2015/12/03.
//  Copyright © 2015年 大島 曜. All rights reserved.
//

#import "ListUIViewObjectViewController.h"

@interface ListUIViewObjectViewController () {
    
    // レスポンス情報を格納する変数
    NSMutableData *receivedData;
    
    
    //   通信終了後に呼び出すコールバック関数情報を格納する変数
    id  client;
    SEL method;
}

-(void)loadWithURL:(NSString *)urlStr target:(id)t method:(SEL)m;

@end

@implementation ListUIViewObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setListButtons];
}

- (void)setListButtons {
    self.buttons = @[
                     @{
                         keyTitle : @"NSURLResponseからステータスコードやHTTPヘッダを取り出す方法",
                         keyAction : @"start",
                         },
                     ];
    [self setButtons];
}

- (void)start {
    [self loadWithURL:@"http://yahoo.co.jp" target:self method:@selector(test)];
}

-(void)loadWithURL:(NSString *)urlStr target:(id)t method:(SEL)m {
    
    client = t;
    method = m;
    
    // 通信を開始する
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (conn == nil)
        NSLog(@"request failed.");
}

#pragma mark - NSURLConnectionDelegate
// サーバーからの戻りが始まった際に呼び出されるメソッド。
- (void) connection:(NSURLConnection *) connection didReceiveResponse:(NSURLResponse *)response {
    receivedData = [[NSMutableData alloc] init];
}
// サーバーからデータを受信するたびに呼び出されるメソッド。
- (void) connection:(NSURLConnection *) connection didReceiveData:(NSData *)data {
    [receivedData appendData:data];
}

// 通信が終了したら呼び出されるメソッド。
- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    NSString *retValue = [[NSString alloc] initWithBytes:receivedData.bytes length:receivedData.length encoding:NSUTF8StringEncoding];
    
    if (client && method) {
        // [client performSelector:method withObject:nil withObject:retValue];
        [client performSelector:method withObject:retValue afterDelay:0.0];
    }
}
// 通信が失敗したら呼び出されるメソッド。
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    /*
    rsslog(@"request failed. code=%d, %@ - %@",
           error.code,
           [error localizedDescription],
           [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
     */
    
    if (client && method) {
        //[client performSelector:method withObject:error withObject:nil];
        [client performSelector:method withObject:error afterDelay:0.0];
    }
}

- (void)test {
    
}

@end
