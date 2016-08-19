//
//  UnlockView.m
//  GestureUnlock
//
//  Created by 李浩 on 16/8/19.
//  Copyright © 2016年 李浩. All rights reserved.
//


#import "UnlockView.h"
#import "UIView+TransformFrame.h"

@interface UnlockView ()

/** 保存滑动过程中选中的按钮*/
@property (nonatomic, strong) NSMutableArray *btns;
/** 记录滑动的位置*/
@property (nonatomic, assign) CGPoint movePoint;

@end

const int dotWidth = 74;

@implementation UnlockView

// 加载xib完成时调用
//- (void)awakeFromNib {
//
//}

- (NSMutableArray *)btns {

    if (!_btns) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}

// 解析xib时调用
- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self configUI];
        self.movePoint = CGPointZero;
    }
    return self;
}

- (void)configUI {

    for (int i=0; i<9; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        btn.tag = 100 + i;
        // 关闭button响应事件的功能
        btn.userInteractionEnabled = NO;
        [self addSubview:btn];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat margin = (self.bounds.size.width - 3*dotWidth) / 4;
    for (int i=0; i<self.subviews.count; i++) {
        UIButton *btn = self.subviews[i];
        btn.lh_width = btn.lh_height = dotWidth;
        btn.lh_left = margin + (margin + dotWidth) * (i % 3);
        btn.lh_top = (margin + dotWidth) * (i / 3);
    }
}

// 获得当前点
- (CGPoint)getPointFromTouches:(NSSet<UITouch *> *)touches {
    
    UITouch *touch = [touches anyObject];
    
    return [touch locationInView:self];
}

// 获得当前触摸到的button
- (UIButton *)getButtonFromPoint:(CGPoint)point {
    
    CGFloat radius = 30;
    for (UIButton *btn in self.subviews) {
        
        // 缩小选中范围
        CGFloat x = btn.center.x - radius / 2;
        CGFloat y = btn.center.y - radius / 2;
        CGRect frame = CGRectMake(x, y, radius, radius);
        bool contains = CGRectContainsPoint(frame, point);
        if (contains) {
            
            return btn;
        }
    }
    return nil;
}

// 改变button的状态
- (void)changeButtonStateWithTouches:(NSSet<UITouch *> *)touches {
    CGPoint point = [self getPointFromTouches:touches];
    self.movePoint = point;
    UIButton *btn = [self getButtonFromPoint:point];
    if (btn&&btn.selected==NO) {
        btn.selected = YES;
        [self.btns addObject:btn];

    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    
    [self changeButtonStateWithTouches:touches];

}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self changeButtonStateWithTouches:touches];

    [self setNeedsDisplay];

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    // 将用户的路径用按钮的tag值拼接成字符串保存起来
    NSMutableString *mString = [NSMutableString string];
    for (UIButton *btn in self.btns) {
        [mString appendFormat:@"%lu", btn.tag];
        
    }
    NSLog(@"%@", mString);
    
    // 将字符串写入沙盒保存用于比对
    
    // 取消btn的选中状态
    [self.btns enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = obj;
        btn.selected = NO;
    }];
    
    // 清空数组
    [self.btns removeAllObjects];
    
//    [self.btns makeObjectsPerformSelector:@selector(setSelected:) withObject:@NO];
    [self setNeedsDisplay];
    
    
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    if (_btns.count==0) {
        return;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (int i=0; i<self.btns.count; i++) {
        
        UIButton *btn = self.btns[i];
        if (i==0) {
            [path moveToPoint:btn.center];
        } else {
            [path addLineToPoint:btn.center];
        }
    }
    
    if (_movePoint.x||_movePoint.y) {
        // 消除点的存在的警告
        [path addLineToPoint:self.movePoint];

    }
    [[UIColor greenColor] setStroke];
    path.lineWidth = 8;
    path.lineJoinStyle = kCGLineJoinRound;
    
    [path stroke];
    
}


@end
