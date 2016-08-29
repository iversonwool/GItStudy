//
//  PaddingView.h
//  DrawingBoard
//
//  Created by 李浩 on 16/8/20.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaddingView : UIView
@property (nonatomic, strong) UIImage *img;
@property (nonatomic, copy) void(^passImgBlock)(UIImage *);

@end
