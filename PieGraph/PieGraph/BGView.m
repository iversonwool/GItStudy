//
//  BGView.m
//  PieGraph
//
//  Created by 李浩 on 16/8/18.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "BGView.h"

@interface BGView ()

@property (nonatomic, assign) CGFloat imgY;


@end

@implementation BGView


// 图片滑落效果

- (void)awakeFromNib {

    self.imgY = 0;
#warning 使用定时器会造成屏幕卡顿
    // iPhone屏幕每秒刷新60次
    
    
//    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];
    
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)];
    
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
//    [self stringEdit];
    [self imageEdit];
    
}

- (void)imageEdit {
    
    UIImage *image = [UIImage imageNamed:@"IMG_0008.jpg"];
    
//    CGRect frame = CGRectMake(0, 0, 100, 100);
    
//    UIRectClip(frame);
    
//    [image drawInRect:frame];
    [image drawAtPoint:CGPointMake(0, self.imgY)];
    
    self.imgY += 10;
    if (self.imgY >= 200) {
        self.imgY = 0;
    }
    
//    [image drawAsPatternInRect:frame];
}

- (void)stringEdit {

    NSString *string = @"hello worldrrrrrrrrrrrrrr";
    
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:40], NSForegroundColorAttributeName:[UIColor redColor]};
    // 会自动换行
//    [string drawInRect:self.bounds withAttributes:dict];
    
    // 不会换行，当字数超出会显示不全
    [string drawAtPoint:CGPointZero withAttributes:dict];
}

@end
