//
//  UnlockView.m
//  GestureUnlock
//
//  Created by 李浩 on 16/8/19.
//  Copyright © 2016年 李浩. All rights reserved.
//


#import "UnlockView.h"
#import "UIView+TransformFrame.h"

const int dotWidth = 74;

@implementation UnlockView


// 加载xib完成时调用
//- (void)awakeFromNib {
//
//}


// 解析xib时调用
- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)configUI {

    for (int i=0; i<9; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        
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
        btn.lh_width = 74;
        btn.lh_height = 74;
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
    for (UIButton *btn in self.subviews) {
        bool contains = CGRectContainsPoint(btn.frame, point);
        if (contains) {
            return btn;
        }
    }
    return nil;
}

// 改变button的状态
- (void)changeButtonStateWithTouches:(NSSet<UITouch *> *)touches {
    CGPoint point = [self getPointFromTouches:touches];
    
    UIButton *btn = [self getButtonFromPoint:point];
    if (btn) {
        btn.selected = YES;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    
    [self changeButtonStateWithTouches:touches];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self changeButtonStateWithTouches:touches];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//}


@end
