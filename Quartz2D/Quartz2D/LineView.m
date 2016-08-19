//
//  LineView.m
//  Quartz2D
//
//  Created by 李浩 on 16/8/17.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "LineView.h"

@interface LineView ()

@property (nonatomic, weak) UILabel *label;


@end

@implementation LineView

// 当视图第一次显示的时候调用该方法
// rect == self.bounds

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self drawLine];
    
    //[self drawBezierLine];
    
    //[self drawTriangle];
    
//    [self drawRectangle];
//    [self drawOval];
//    [self drawArc];
}


#pragma mark - 画圆弧
- (void)drawArc {
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGPoint center = CGPointMake(125, 125);
    CGFloat radius = 100;
    CGFloat startAngle = 0;
    CGFloat endAngle = M_PI_2;

    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    [path addLineToPoint:center];
    
    [[UIColor redColor] setFill];
    
    CGContextAddPath(currentContext, path.CGPath);
    CGContextFillPath(currentContext);
//    CGContextStrokePath(currentContext);
}

#pragma mark - 画矩形
- (void)drawRectangle {
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, 200, 200) cornerRadius:10];
    CGContextAddPath(currentContext, path.CGPath);
    CGContextStrokePath(currentContext);
}

#pragma mark - 画圆形（椭圆形）
- (void)drawOval {

    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 200, 200)];
    CGContextAddPath(currentContext, path.CGPath);
    CGContextStrokePath(currentContext);
}


#pragma mark - 画三角形

- (void)drawTriangle {

    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint startPoint = CGPointMake(10, 10);
    [path moveToPoint:startPoint];
    [path addLineToPoint:CGPointMake(125, 125)];
    [path addLineToPoint:CGPointMake(240, 10)];
    
    [path closePath];
    [[UIColor blueColor] setFill];
    [[UIColor redColor] setStroke];
    
    CGContextSetLineWidth(currentContext, 8);
    
    CGContextAddPath(currentContext, path.CGPath);
    //CGContextFillPath(currentContext);
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    
    [self addLabel];
}

- (void)addLabel {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 250, 120)];
    label.text = @"S";
    label.font = [UIFont systemFontOfSize:60];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor yellowColor];
    [self addSubview:label];
    _label = label;
    
}


#pragma mark - 画曲线
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

#pragma mark - 画直线

- (void)drawLine {
//    // 1.获取上下文
//    // CGContextRef CoreGraphics Ref 引用
//    // 获取当前上下文
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    // 2.设置路径 Bezier曲线
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    
//    // 3.设置起点
//    [path moveToPoint:CGPointMake(10, 10)];
//    
//    // 画到某个点
//    [path addLineToPoint:CGPointMake(125, 125)];
//    
//    // 4.把路径添加到上下文
//    CGContextAddPath(context, path.CGPath);
//    
//    // 5.渲染到界面
//    CGContextStrokePath(context);
//    
    
    // 简易画法
    UIBezierPath *path0 = [UIBezierPath bezierPath];
    [path0 moveToPoint:CGPointMake(10, 10)];
    [path0 addLineToPoint:CGPointMake(100, 100)];
    [path0 stroke];
}


@end
