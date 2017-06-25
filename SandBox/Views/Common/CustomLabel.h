//
//  CustomLabel.h
//  SandBox
//
//  Created by 大島 曜 on 2015/04/24.
//  Copyright (c) 2015年 大島 曜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (CustomLabelDrawing)

- (CGSize)sizeWithFont:(UIFont *)font
           minFontSize:(CGFloat)minFontSize
        actualFontSize:(CGFloat *)actualFontSize
              forWidth:(CGFloat)width
         lineBreakMode:(NSLineBreakMode)lineBreakMode
      characterSpacing:(CGFloat)characterSpacing
          kerningTable:(NSDictionary *)kerningTable;

- (CGSize)drawAtPoint:(CGPoint)point
             forWidth:(CGFloat)width
             withFont:(UIFont *)font
          minFontSize:(CGFloat)minFontSize
       actualFontSize:(CGFloat *)actualFontSize
        lineBreakMode:(NSLineBreakMode)lineBreakMode
   baselineAdjustment:(UIBaselineAdjustment)baselineAdjustment
     characterSpacing:(CGFloat)characterSpacing
         kerningTable:(NSDictionary *)kerningTable;

- (CGSize)sizeWithFont:(UIFont *)font
     constrainedToSize:(CGSize)size
         lineBreakMode:(NSLineBreakMode)lineBreakMode
           lineSpacing:(CGFloat)lineSpacing
      characterSpacing:(CGFloat)characterSpacing
          kerningTable:(NSDictionary *)kerningTable
          allowOrphans:(BOOL)allowOrphans;

- (CGSize)drawInRect:(CGRect)rect
            withFont:(UIFont *)font
       lineBreakMode:(NSLineBreakMode)lineBreakMode
           alignment:(NSTextAlignment)alignment
         lineSpacing:(CGFloat)lineSpacing
    characterSpacing:(CGFloat)characterSpacing
        kerningTable:(NSDictionary *)kerningTable
        allowOrphans:(BOOL)allowOrphans;
@end


@interface CustomLabel : UILabel

@property (nonatomic) CGFloat shadowBlur;
@property (nonatomic) CGFloat innerShadowBlur;
@property (nonatomic) CGSize innerShadowOffset;
@property (nonatomic, strong) UIColor *innerShadowColor;
@property (nonatomic, strong) UIColor *gradientStartColor;
@property (nonatomic, strong) UIColor *gradientEndColor;
@property (nonatomic, copy) NSArray *gradientColors;
@property (nonatomic) CGPoint gradientStartPoint;
@property (nonatomic) CGPoint gradientEndPoint;
@property (nonatomic) NSUInteger oversampling;
@property (nonatomic) UIEdgeInsets textInsets;
@property (nonatomic) CGFloat lineSpacing;
@property (nonatomic) CGFloat characterSpacing;
@property (nonatomic) CGFloat baselineOffset;
@property (nonatomic, copy) NSDictionary *kerningTable;
@property (nonatomic) BOOL allowOrphans;

- (void)setUp;

@end
