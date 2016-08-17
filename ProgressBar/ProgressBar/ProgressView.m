//
//  ProgressView.m
//  ProgressBar
//
//  Created by 李浩 on 16/8/17.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "ProgressView.h"

@interface ProgressView ()

@property (nonatomic, strong) UILabel *label;


@end


@implementation ProgressView


- (UILabel *)label {

    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:self.bounds];
        _label.textAlignment =NSTextAlignmentCenter;
        [self addSubview:_label];
    }
    return _label;
}

- (void)setValue:(CGFloat)value {

    _value = value;
    self.label.text = [NSString stringWithFormat:@"%.2f%%", self.value*100];
    [self setNeedsDisplay];
}

// 默认只会调用一次
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGPoint center = CGPointMake(rect.size.width/2, rect.size.height/2);
    CGFloat radius = rect.size.width/2-5;
    CGFloat startA = -M_PI_2;
    CGFloat endA = self.value*M_PI*2 + -M_PI_2;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    CGContextAddPath(currentContext, path.CGPath);
    [[UIColor redColor] setStroke];
    CGContextStrokePath(currentContext);
    
    
}


@end
