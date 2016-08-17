//
//  UIColor+RandomColor.m
//  PieGraph
//
//  Created by 李浩 on 16/8/18.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "UIColor+RandomColor.h"

@implementation UIColor (RandomColor)


+ (UIColor *)randomColor {
    
    CGFloat red = arc4random_uniform(256)/255.;
    CGFloat green = arc4random_uniform(256)/255.;
    CGFloat blue = arc4random_uniform(256)/255.;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1];
}
@end
