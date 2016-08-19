//
//  UIView+TransformFrame.h
//  TransformFrame
//
//  Created by 李浩 on 5/27/16.
//  Copyright © 2016 李浩. All rights reserved.
//

#import <UIKit/UIKit.h>
// center
CGPoint CGRectGetCenter(CGRect frame);

@interface UIView (TransformFrame)
// origin
@property (nonatomic, assign) CGPoint lh_origin;
// size
@property (nonatomic, assign) CGSize lh_size;
// top
@property (nonatomic, assign) CGFloat lh_top;
// left
@property (nonatomic, assign) CGFloat lh_left;
// bottom
@property (nonatomic, assign) CGFloat lh_bottom;
// right
@property (nonatomic, assign) CGFloat lh_right;
// width
@property (nonatomic, assign) CGFloat lh_width;
// height
@property (nonatomic, assign) CGFloat lh_height;
// centerX
@property (nonatomic, assign) CGFloat lh_centerX;
// centerY
@property (nonatomic, assign) CGFloat lh_centerY;

// left_bottom
@property (nonatomic, assign, readonly) CGPoint lh_leftBottom;
// right_top
@property (nonatomic, assign, readonly) CGPoint lh_rightTop;
// right_bottom
@property (nonatomic, assign, readonly) CGPoint lh_rightBottom;

// move
- (void)moveByDelta:(CGPoint)delta;
// scale
- (void)fitSize:(CGSize)newSize;

@end
