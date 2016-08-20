//
//  ColorBezierPath.h
//  DrawingBoard
//
//  Created by 李浩 on 16/8/20.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorBezierPath : UIBezierPath

@property (nonatomic, strong) UIColor *color;
+ (instancetype)colorBezierPathWithColor:(UIColor *)color lineWidth:(CGFloat)lineWidth startPoint:(CGPoint)startPoint;

@end
