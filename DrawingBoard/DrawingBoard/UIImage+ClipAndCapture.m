//
//  UIImage+ClipAndCapture.m
//  ImageClipped
//
//  Created by 李浩 on 16/8/19.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "UIImage+ClipAndCapture.h"

@implementation UIImage (ClipAndCapture)

+ (instancetype)imageWithCaptureView:(UIView *)captureView {

    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(captureView.bounds.size, NO, 1);
    
    // 渲染控制器的view到上下文，注意：：：图层只能用渲染，不能用draw
    [captureView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *captureImg = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return captureImg;
}

+ (instancetype)imageWithName:(NSString *)name borderWith:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {

    UIImage *oldImg = [UIImage imageNamed:name];
    
    CGFloat imgW = oldImg.size.width+2*borderWidth;
    CGFloat imgH = oldImg.size.height+2*borderWidth;
    
    
    CGFloat biggerRadius = imgW<=imgH?imgW:imgH;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(biggerRadius, biggerRadius), NO, 1);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, biggerRadius, biggerRadius)];
    
    CGContextRef currentCtx = UIGraphicsGetCurrentContext();
    CGContextAddPath(currentCtx, path.CGPath);
    
    [borderColor setFill];
    CGContextFillPath(currentCtx);
    
    
    CGRect clipRect = CGRectMake(borderWidth, borderWidth, oldImg.size.width, oldImg.size.height);
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:clipRect];
    [clipPath addClip];
    [oldImg drawAtPoint:CGPointMake(borderWidth, borderWidth)];
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    
    // 6.销毁上下文
    UIGraphicsEndImageContext();
    
    return newImg;
}

@end
