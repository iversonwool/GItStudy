//
//  MyView.m
//  ContextStack
//
//  Created by 李浩 on 16/8/18.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "MyView.h"

@implementation MyView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef currentCtx = UIGraphicsGetCurrentContext();
#warning 路径一定要放在上下文矩阵操作之后
    
    // 平移变换
    CGContextTranslateCTM(currentCtx, 30, 50);
    
    // 旋转
    CGContextRotateCTM(currentCtx, M_PI_4);
    
    // 缩放
    CGContextScaleCTM(currentCtx, 0.6, 1);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-10, -30, 100, 60)];
    
    CGContextAddPath(currentCtx, path.CGPath);
    
    [[UIColor greenColor] setFill];
    
    CGContextFillPath(currentCtx);
    
    

}


- (void)contextStack {
    CGContextRef currentCtx = UIGraphicsGetCurrentContext();
    
    // 先保存到图形上下文栈
    CGContextSaveGState(currentCtx);
    
    UIBezierPath *path0 = [UIBezierPath bezierPath];
    [path0 moveToPoint:CGPointMake(10, 60)];
    [path0 addLineToPoint:CGPointMake(220, 60)];
    
    CGContextAddPath(currentCtx, path0.CGPath);
    
    [[UIColor redColor] setStroke];
    CGContextSetLineWidth(currentCtx, 5);
    CGContextSetLineCap(currentCtx, kCGLineCapRound);
    
    CGContextStrokePath(currentCtx);
    
    
    // 需要使用两条路径
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(120, 10)];
    [path1 addLineToPoint:CGPointMake(120, 100)];
    
    CGContextAddPath(currentCtx, path1.CGPath);
    
    
    // 再取出栈顶
    CGContextRestoreGState(currentCtx);
    //    [[UIColor blackColor] setStroke];
    //    CGContextSetLineWidth(currentCtx, 1);
    //    CGContextSetLineCap(currentCtx, kCGLineCapButt);
    
    CGContextStrokePath(currentCtx);
}


@end
