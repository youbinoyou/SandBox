//
//  AnimalViewModel.h
//  SandBox
//
//  Created by 大島 曜 on 2017/08/17.
//  Copyright © 2017年 大島 曜. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class AnimalModel;
@class AnimalView;
@interface AnimalViewModel : NSObject

@property NSString *viewID;
@property NSString *segueID;

@property AnimalModel *animalModel;

- (instancetype)initWithViewId:(NSString *)viewId animalModel:(AnimalModel *)animalModel;

@property void (^selectedBlock)(void);
- (void)updateAnimalView:(AnimalView *)animalView;
- (void)selected;

@end
