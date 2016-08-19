//
//  UIView+TransformFrame.m
//  TransformFrame
//
//  Created by 李浩 on 5/27/16.
//  Copyright © 2016 李浩. All rights reserved.
//

#import "UIView+TransformFrame.h"

CGPoint CGRectGetCenter(CGRect frame) {
    CGPoint pt;
    pt.x = CGRectGetMidX(frame);
    pt.y = CGRectGetMidY(frame);
    return pt;
}

@implementation UIView (TransformFrame)

- (void)setLh_origin:(CGPoint)lh_origin {
    CGRect frame = self.frame;
    frame.origin = lh_origin;
    self.frame = frame;
}

- (CGPoint)lh_origin {
    return self.frame.origin;
}

- (void)setLh_size:(CGSize)lh_size {
    CGRect frame = self.frame;
    frame.size = lh_size;
    self.frame = frame;
}

- (CGSize)lh_size {
    return self.frame.size;
}

- (void)setLh_top:(CGFloat)lh_top {

    CGRect frame = self.frame;
    frame.origin.y = lh_top;
    self.frame = frame;
}

- (CGFloat)lh_top {

    return self.frame.origin.y;
}

- (void)setLh_left:(CGFloat)lh_left {
    CGRect frame = self.frame;
    frame.origin.x = lh_left;
    self.frame = frame;
}

- (CGFloat)lh_left {
    return self.frame.origin.x;
}

- (void)setLh_bottom:(CGFloat)lh_bottom {
    CGRect frame = self.frame;
    frame.origin.y = lh_bottom - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)lh_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setLh_right:(CGFloat)lh_right {
    CGRect frame = self.frame;
    frame.origin.x = lh_right - self.frame.size.width;
    self.frame = frame;
}

- (CGFloat)lh_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setLh_width:(CGFloat)lh_width {
    CGRect frame = self.frame;
    frame.size.width = lh_width;
    self.frame = frame;
}

- (CGFloat)lh_width {
    return self.frame.size.width;
}

- (void)setLh_height:(CGFloat)lh_height {
    CGRect frame = self.frame;
    frame.size.height = lh_height;
    self.frame = frame;
}

- (CGFloat)lh_height {
    return self.frame.size.height;
}

- (CGPoint)lh_leftBottom {
    CGPoint pt;
    pt.x = self.frame.origin.x;
    pt.y = self.frame.origin.y + self.frame.size.height;
    return pt;
}

- (CGPoint)lh_rightTop {
    CGPoint pt;
    pt.x = self.frame.origin.x + self.frame.size.width;
    pt.y = self.frame.origin.y;
    return pt;
}

- (CGPoint)lh_rightBottom {
    CGPoint pt;
    pt.x = self.frame.origin.x + self.frame.size.width;
    pt.y = self.frame.origin.y + self.frame.size.height;
    return pt;
}

- (void)setLh_centerX:(CGFloat)lh_centerX {
    self.center = CGPointMake(lh_centerX, self.center.y);
}

- (CGFloat)lh_centerX {
    return self.center.x;
}

- (void)setLh_centerY:(CGFloat)lh_centerY {
    self.center = CGPointMake(self.center.x, lh_centerY);
}

- (CGFloat)lh_centerY {
    return self.center.y;
}

- (void)moveByDelta:(CGPoint)delta {
    CGPoint center = self.center;
    center.x += delta.x;
    center.y += delta.y;
    self.center = center;
}

- (void)fitSize:(CGSize)newSize {
    CGRect frame = self.frame;
    CGFloat scale;
    if (newSize.width&&(newSize.width<frame.size.width)) {
        scale = newSize.width/frame.size.width;
        frame.size.width *= scale;
        frame.size.height *= scale;
    }
    if (newSize.height&&(newSize.height<frame.size.height)) {
        scale = newSize.height/frame.size.height;
        frame.size.width *= scale;
        frame.size.height *= scale;
    }
    self.frame = frame;
}

@end
