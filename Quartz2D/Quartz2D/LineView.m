//
//  LineView.m
//  Quartz2D
//
//  Created by 李浩 on 16/8/17.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "LineView.h"

@implementation LineView

// 当视图第一次显示的时候调用该方法
// rect == self.bounds

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //[self drawLine];
    
    [self drawBezierLine];
}



- (void)drawBezierLine {


    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGPoint startPoint = CGPointMake(10, 125);
    CGPoint endPoint = CGPointMake(240, 125);
    CGPoint controlPoint = CGPointMake(125, 10);
    
    [path moveToPoint:startPoint];
    [path addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    
    CGContextAddPath(currentContext, path.CGPath);
    
    CGContextSetLineWidth(currentContext, 2);
    [[UIColor redColor] setStroke];
    
    CGContextStrokePath(currentContext);
}

- (void)drawLine {
    // 1.获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 2.设置路径 Bezier曲线
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 3.设置起点
    [path moveToPoint:CGPointMake(10, 10)];
    
    // 画到某个点
    [path addLineToPoint:CGPointMake(125, 125)];
    
    // 4.把路径添加到上下文
    CGContextAddPath(context, path.CGPath);
    
    // 5.渲染到界面
    CGContextStrokePath(context);
}


@end
