//
//  BGView.m
//  PieGraph
//
//  Created by 李浩 on 16/8/18.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "BGView.h"

@implementation BGView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
//    [self stringEdit];
    [self imageEdit];
    
}

- (void)imageEdit {
    
    UIImage *image = [UIImage imageNamed:@"IMG_0008.jpg"];
    
    CGRect frame = CGRectMake(0, 0, 100, 100);
    
//    UIRectClip(frame);
    
//    [image drawInRect:frame];
//    [image drawAtPoint:CGPointZero];
    
    [image drawAsPatternInRect:frame];
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
