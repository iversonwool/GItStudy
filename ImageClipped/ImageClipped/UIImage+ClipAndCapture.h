//
//  UIImage+ClipAndCapture.h
//  ImageClipped
//
//  Created by 李浩 on 16/8/19.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ClipAndCapture)

+ (instancetype)imageWithName:(NSString *)name borderWith:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

+ (instancetype)imageWithCaptureView:(UIView *)captureView;

@end
