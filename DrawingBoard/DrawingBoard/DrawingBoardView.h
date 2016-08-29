//
//  DrawingBoardView.h
//  DrawingBoard
//
//  Created by 李浩 on 16/8/20.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawingBoardView : UIView

/** 线宽*/
@property (nonatomic, assign) CGFloat lineW;

/** color*/
@property (nonatomic, strong) UIColor *color;

@property (nonatomic, strong) UIImage *image;


/** 清屏功能*/
// 清屏功能交给自己来做 不让外部操作我的paths 数组
- (void)clear;

/** 撤销*/
- (void)undo;


- (void)save;
@end
