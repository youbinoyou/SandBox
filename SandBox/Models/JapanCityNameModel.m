//
//  JapanCityNameModel.m
//  SandBox
//
//  Created by YouOhshima on 2017/08/02.
//  Copyright © 2017年 大島 曜. All rights reserved.
//

#import "JapanCityNameModel.h"

@implementation JapanCityNameModel

+ (NSArray *)JapanCityModels {
    NSMutableArray *models = [NSMutableArray new];
    for (NSDictionary *item in [self JapanCityItems]) {
        [models addObject:[JapanCityNameModel setModelDictionary:item]];
    }
    return [models copy];
}

+ (JapanCityNameModel *)setModelDictionary:(NSDictionary *)dic {
    JapanCityNameModel *jcnModel = [JapanCityNameModel new];
    jcnModel.number = dic[@"number"];
    jcnModel.title = dic[@"title"];
    jcnModel.prefecturalCapitalTitle = dic[@"prefecturalCapitalTitle"];
    return jcnModel;
}

+ (NSArray *)JapanCityItems {
    return @[
             /*県番号	都道府県名	県庁所在地*/
             @{@"number":@0,@"title":@"都道府県名",@"prefecturalCapitalTitle":@"県庁所在地"},
             @{@"number":@1,@"title":@"北海道(ほっかいどう)",@"prefecturalCapitalTitle":@"札幌(さっぽろ)"},
             @{@"number":@2,@"title":@"青森県(あおもり)",@"prefecturalCapitalTitle":@"青森(あおもり)"},
             @{@"number":@3,@"title":@"岩手県(いわて)",@"prefecturalCapitalTitle":@"盛岡(もりおか)"},
             @{@"number":@4,@"title":@"宮城県(みやぎ)",@"prefecturalCapitalTitle":@"	仙台(せんだい)"},
             @{@"number":@5,@"title":@"秋田県(あきた)",@"prefecturalCapitalTitle":@"	秋田(あきた)"},
             @{@"number":@6,@"title":@"山形県(やまがた)",@"prefecturalCapitalTitle":@"山形(やまがた)"},
             @{@"number":@7,@"title":@"福島県(ふくしま)",@"prefecturalCapitalTitle":@"福島(ふくしま)"},
             @{@"number":@8,@"title":@"茨城県(いばらき)",@"prefecturalCapitalTitle":@"水戸(みと)"},
             @{@"number":@9,@"title":@"栃木県(とちぎ)	",@"prefecturalCapitalTitle":@"宇都宮(うつのみや)"},
             @{@"number":@10,@"title":@"群馬県(ぐんま)",@"prefecturalCapitalTitle":@"前橋(まえばし)"},
             @{@"number":@11,@"title":@"埼玉県(さいたま)",@"prefecturalCapitalTitle":@"さいたま"},
             @{@"number":@12,@"title":@"千葉県(ちば)",@"prefecturalCapitalTitle":@"千葉(ちば)"},
             @{@"number":@13,@"title":@"東京都(とうきょう)",@"prefecturalCapitalTitle":@"東京(とうきょう)"},
             @{@"number":@14,@"title":@"神奈川県(かながわ)",@"prefecturalCapitalTitle":@"横浜(よこはま)"},
             @{@"number":@15,@"title":@"新潟県(にいがた)",@"prefecturalCapitalTitle":@"新潟(にいがた)"},
             @{@"number":@16,@"title":@"富山県(とやま)",@"prefecturalCapitalTitle":@"富山(とやま)"},
             @{@"number":@17,@"title":@"石川県(いしかわ)",@"prefecturalCapitalTitle":@"金沢(かなざわ)"},
             @{@"number":@18,@"title":@"福井県(ふくい)",@"prefecturalCapitalTitle":@"福井(ふくい)"},
             @{@"number":@19,@"title":@"山梨県(やまなし)",@"prefecturalCapitalTitle":@"甲府(こうふ)"},
             @{@"number":@20,@"title":@"長野県(ながの)",@"prefecturalCapitalTitle":@"長野(ながの)"},
             @{@"number":@21,@"title":@"岐阜県(ぎふ)",@"prefecturalCapitalTitle":@"岐阜(ぎふ)"},
             @{@"number":@22,@"title":@"静岡県(しずおか)",@"prefecturalCapitalTitle":@"静岡(しずおか)"},
             @{@"number":@23,@"title":@"愛知県(あいち)",@"prefecturalCapitalTitle":@"名古屋(なごや)"},
             @{@"number":@24,@"title":@"三重県(みえ)",@"prefecturalCapitalTitle":@"津(つ)"},
             @{@"number":@25,@"title":@"滋賀県(しが)",@"prefecturalCapitalTitle":@"大津(おおつ)"},
             @{@"number":@26,@"title":@"京都府(きょうと)",@"prefecturalCapitalTitle":@"京都(きょうと)"},
             @{@"number":@27,@"title":@"大阪府(おおさか)",@"prefecturalCapitalTitle":@"大阪(おおさか)"},
             @{@"number":@28,@"title":@"兵庫県(ひょうご)",@"prefecturalCapitalTitle":@"神戸(こうべ)"},
             @{@"number":@29,@"title":@"奈良県(なら)",@"prefecturalCapitalTitle":@"奈良(なら)"},
             @{@"number":@30,@"title":@"和歌山県(わかやま)",@"prefecturalCapitalTitle":@"和歌山(わかやま)"},
             @{@"number":@31,@"title":@"鳥取県(とっとり)",@"prefecturalCapitalTitle":@"鳥取(とっとり)"},
             @{@"number":@32,@"title":@"島根県(しまね)",@"prefecturalCapitalTitle":@"松江(まつえ)"},
             @{@"number":@33,@"title":@"岡山県(おかやま)",@"prefecturalCapitalTitle":@"岡山(おかやま)"},
             @{@"number":@34,@"title":@"広島県(ひろしま)",@"prefecturalCapitalTitle":@"広島(ひろしま)"},
             @{@"number":@35,@"title":@"山口県(やまぐち)",@"prefecturalCapitalTitle":@"山口(やまぐち)"},
             @{@"number":@36,@"title":@"徳島県(とくしま)",@"prefecturalCapitalTitle":@"徳島(とくしま)"},
             @{@"number":@37,@"title":@"香川県(かがわ)",@"prefecturalCapitalTitle":@"高松(たかまつ)"},
             @{@"number":@38,@"title":@"愛媛県(えひめ)",@"prefecturalCapitalTitle":@"松山(まつやま)"},
             @{@"number":@39,@"title":@"高知県(こうち)",@"prefecturalCapitalTitle":@"高知(こうち)"},
             @{@"number":@40,@"title":@"福岡県(ふくおか)",@"prefecturalCapitalTitle":@"福岡(ふくおか)"},
             @{@"number":@41,@"title":@"佐賀県(さが)",@"prefecturalCapitalTitle":@"佐賀(さが)"},
             @{@"number":@42,@"title":@"長崎県(ながさき)",@"prefecturalCapitalTitle":@"長崎(ながさき)"},
             @{@"number":@43,@"title":@"熊本県(くまもと)",@"prefecturalCapitalTitle":@"熊本(くまもと)"},
             @{@"number":@44,@"title":@"大分県(おおいた)",@"prefecturalCapitalTitle":@"大分(おおいた)"},
             @{@"number":@45,@"title":@"宮崎県(みやざき)",@"prefecturalCapitalTitle":@"宮崎(みやざき)"},
             @{@"number":@46,@"title":@"鹿児島県(かごしま)",@"prefecturalCapitalTitle":@"鹿児島(かごしま)"},
             @{@"number":@47,@"title":@"沖縄県(おきなわ)",@"prefecturalCapitalTitle":@"那覇(なは)"},
             ];
}

@end