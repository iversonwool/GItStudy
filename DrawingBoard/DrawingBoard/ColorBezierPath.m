//
//  ColorBezierPath.m
//  DrawingBoard
//
//  Created by 李浩 on 16/8/20.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "ColorBezierPath.h"

@implementation ColorBezierPath

+ (instancetype)colorBezierPathWithColor:(UIColor *)color lineWidth:(CGFloat)lineWidth startPoint:(CGPoint)startPoint {

    ColorBezierPath *colorPath = [[self alloc] init];
    colorPath.lineWidth = lineWidth;
    colorPath.color = color;
    [colorPath moveToPoint:startPoint];
    return colorPath;
}

@end
