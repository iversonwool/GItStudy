//
//  ImitateIMGView.m
//  PieGraph
//
//  Created by 李浩 on 16/8/18.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "ImitateIMGView.h"

@interface ImitateIMGView ()

@end

@implementation ImitateIMGView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
    [self.image drawInRect:rect];

}



@end
