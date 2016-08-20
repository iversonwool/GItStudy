//
//  DrawingBoardView.m
//  DrawingBoard
//
//  Created by 李浩 on 16/8/20.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "DrawingBoardView.h"
#import "ColorBezierPath.h"

@interface DrawingBoardView ()

@property (nonatomic, strong) UIBezierPath *path;
/** 保存绘制路径 */
@property (nonatomic, strong) NSMutableArray *paths;

@end

@implementation DrawingBoardView

- (void)awakeFromNib {
    // initialize line width
    self.lineW = 2;
}


- (NSMutableArray *)paths {
    if (!_paths) {
        _paths = [NSMutableArray array];
        
    }
    return _paths;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // start point
    // 由于bezier path没有颜色设置 所以自定义ColorBezierPath继承BezierPath 添加颜色属性
    
    ColorBezierPath *path = [ColorBezierPath colorBezierPathWithColor:self.color lineWidth:self.lineW startPoint:[self getPointFromTouches:touches]];
    self.path = path;
    [self.paths addObject:self.path];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    // end point
    [self.path addLineToPoint:[self getPointFromTouches:touches]];
    
    [self setNeedsDisplay];
    
}

- (CGPoint)getPointFromTouches:(NSSet<UITouch *> *)touches {
    
    UITouch *touch = [touches anyObject];
    
    return [touch locationInView:self];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
// 会把之前全部清空， 重新绘制
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self.paths enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ColorBezierPath *path = obj;
        [path.color setStroke];
        [path stroke];
    }];
    
}


@end
