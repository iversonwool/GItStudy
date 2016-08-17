//
//  BackgroundView.m
//  PieGraph
//
//  Created by 李浩 on 16/8/18.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "BackgroundView.h"
#import "NSNumber+RandomNumber.h"
#import "UIColor+RandomColor.h"

@implementation BackgroundView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
    NSArray *array = @[[NSNumber randomNumber], [NSNumber randomNumber], [NSNumber randomNumber]];
    
    
    CGFloat sum = 0.;
    for (NSNumber *number in array) {
        sum += number.intValue;
    }
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGPoint center = CGPointMake(rect.size.width/2, rect.size.height/2);
    CGFloat radius = rect.size.width/2-3;
    
    CGFloat startAngle = 0;
    CGFloat endAngle = 0;
    CGFloat angle = 0;

    for (NSNumber *number in array) {
    
        startAngle = endAngle;
    
//    NSNumber *num = array.firstObject;
        angle = number.intValue/sum*M_PI*2;
        endAngle = startAngle + angle;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
        
        [path addLineToPoint:center];
        CGContextAddPath(currentContext, path.CGPath);
        [[UIColor randomColor] setFill];
        CGContextFillPath(currentContext);

    }
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self setNeedsDisplay];
}

@end
