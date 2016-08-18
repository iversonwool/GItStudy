//
//  BarBgView.m
//  PieGraph
//
//  Created by 李浩 on 16/8/18.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "BarBgView.h"
#import "NSNumber+RandomNumber.h"

@implementation BarBgView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    // 虚拟数据
    NSArray *array = @[[NSNumber randomNumber], [NSNumber randomNumber], [NSNumber randomNumber]];
    
    CGFloat sum = 0;
    for (NSNumber *num in array) {
        sum+=num.intValue;
    }
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGFloat viewH = rect.size.height;
    
    CGFloat width = rect.size.width/(2*array.count-1);
    CGFloat height = 0;
    CGFloat x = 0;
    CGFloat y = 0;
    
    for (int i=0; i<array.count; i++) {
        NSNumber *num = array[i];
        
        height = viewH * num.intValue/sum;
        x = 2*i*width;
        y = viewH - height;
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, width, height)];
        
        CGContextAddPath(currentContext, path.CGPath);
        [[UIColor blueColor] setFill];
        
    }
    CGContextFillPath(currentContext);
    
}


@end
