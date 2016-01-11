//
//  UtilsBlogSearch.m
//  SandBox
//
//  Created by CatenaRentalSystem on 2016/01/04.
//  Copyright © 2016年 大島 曜. All rights reserved.
//

#import "UtilsBlogSearch.h"

NSString *const kXMLReaderTextNodeKey = @"万葉集";

@implementation UtilsBlogSearch

- (id)init
{
    self = [super init];
    if (self) {
        shift = 0;
        xmltoArrayList = [NSMutableArray new];
        arrayList = [NSMutableArray new];
        arrayStack = [NSMutableArray new];
        elements = @"";
        textInProgress = @"";
        elementTitleStr = @"";
        NSArray *memo =
        @[
          @{
              @"万葉集":@[
                      @{
                          @"巻":@[
                                  @{
                                      @"歌":@[
                                              @{
                                                  @"歌番号":@"8",
                                                  @"原文":@"熟田津尓 船乗世武登 月待者 潮毛可奈比沼 今者許藝乞菜",
                                                  @"作者":@"額田王(ぬかたのおおきみ)",
                                                  @"読み":@"熟田津(にきたつ)に、船(ふな)乗りせむと、月待てば、潮もかなひぬ、今は漕(こ)ぎ出(い)でな",
                                                  @"イメージ":@"image/m0008.jpg",
                                                  @"意味":@""
                                                  @"熟田津(にきたつ)で、船を出そうと月を待っていると、いよいよ潮の流れも良くなってきた。 さあ、いまこそ船出するのです。"
                                                  }
                                              ]
                                      }
                                  ],
                          @"attributes":
                            @{
                                  @"no":@"1"
                                  }
                          }
                  ]
              }
          ];
        
    }
    return self;
}

- (void)dealloc
{
    [xmltoArrayList removeAllObjects];
    [arrayList removeAllObjects];
    [arrayStack removeAllObjects];
    elements = nil;
    elementTitleStr = nil;
    textInProgress = nil;
}

- (NSArray *)titleList {
    return arrayList;
}

- (BOOL)requestXml:(NSString *) urlstr
{
    NSURL *url = [NSURL URLWithString:urlstr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue
                           completionHandler:^(NSURLResponse *res, NSData *data, NSError *error) {
                               
                               if(error) {
                                   NSLog(@"%@", error);
                               }
                               
                               // 取得したXMLをパース
                               NSXMLParser* parser = [[NSXMLParser alloc] initWithData:data];
                               [parser setDelegate:self];
                               [parser parse];
                               
                           }];
    
    return (YES);
}

// XMLのパース開始
- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    isManyoshuTag = NO;
    isMakiTag = NO;
}

// XMLのパース終了
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    [arrayList removeObjectAtIndex:0];
    xmltoArrayList = [NSMutableArray new];
    for (id status in arrayList) {
        NSLog(@"status : %@", status);
//        NSArray *array = [status copy];
//        NSDictionary *dic = array[0];
//        NSLog(@"elementName : %@", dic[@"elementName"]);
//        NSLog(@"elements : %@", dic[@"elements"]);
//        NSLog(@"attributes : %@", dic[@"attributes"]);
//        NSLog(@"string : %@", dic[@"string"]);
//        NSArray *arrayElements = [dic[@"elements"] componentsSeparatedByString:@"/"];
//        NSLog(@"count : %ld",[arrayElements count] - 1);
//        if ([arrayElements count] - 1 == 0) {
//            [xmltoArrayList addObject:dic];
//        } else if([arrayElements count] - 1 == 1){
//            NSLog(@"%@",xmltoArrayList[xmltoArrayList.count - 1]);
//        }
    }
    NSLog(@"xmltoArrayList : %@",xmltoArrayList);
}

- (void)nextStep{
    
}

// 開始タグを読み込み
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict
{
    if (arrayStack) {
        arrayList[[arrayList count]] = arrayStack;
    }

    NSMutableArray *arrayElements = [[elements componentsSeparatedByString:@"/"] mutableCopy];
    NSMutableArray *arrayDammy = [NSMutableArray new];
    if (shift == 0) {
        arrayElements[shift] = elementName;
    } else {
        arrayElements[shift] = elementName;
        for (int s = 0; s <= shift; s++) {
            arrayDammy[s] = arrayElements[s];
        }
        arrayElements = [arrayDammy mutableCopy];
        //arrayElements[shift] = elementName;
    }
    elements = [arrayElements componentsJoinedByString:@"/"];
//    NSLog(@"elementName : %@",elementName);
//    NSLog(@"namespaceURI : %@",namespaceURI);
//    NSLog(@"attributes : %@",attributeDict);
//    NSLog(@"elements : %@",elements);
//    NSLog(@"shift:%ld",shift);
    shift++;
    
    arrayStack = [NSMutableArray new];
    NSMutableDictionary *dic = [@{
                                  @"elements":elements,
                                  @"elementName":elementName,
                                  @"attributes":attributeDict,
                                  } mutableCopy];
    arrayStack[[arrayStack count]] = dic;
    
    NSLog(@"arrayStack : %@",arrayStack);
    return;

}

// 終了タグを読み込み
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
{
//    NSLog(@"elementName : /%@",elementName);
//    NSLog(@"namespaceURI : %@",namespaceURI);
//    NSLog(@"qualifiedName : %@",qName);
    shift--;
    return;
}

// テキストデータ読み込み
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    

    NSMutableDictionary *dic = [arrayStack[[arrayStack count] - 1] mutableCopy];
    if (dic[@"string"]) {
        textInProgress = dic[@"string"];
    } else {
        textInProgress = @"";
    }
    textInProgress = [textInProgress stringByAppendingString:string];
    dic[@"string"] = textInProgress;
    
    
//    NSLog(@"string : %@",string);
//    NSLog(@"dic : %@",dic);
    arrayStack[[arrayStack count] - 1] = dic;

}
@end
