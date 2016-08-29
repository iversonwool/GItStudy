//
//  PaddingView.m
//  DrawingBoard
//
//  Created by 李浩 on 16/8/20.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "PaddingView.h"
#import "UIImage+ClipAndCapture.h"

@interface PaddingView ()
@property (nonatomic, weak) UIImageView *imgView;

@end
@implementation PaddingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addImgView];
    }
    return self;
}

- (void)addImgView {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    imageView.userInteractionEnabled = YES;
    self.imgView = imageView;
    [self addGestures];

    [self addSubview:imageView];
}

- (void)setImg:(UIImage *)img {
    _img = img;
    self.imgView.image = img;
}

- (void)addGestures {
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self.imgView addGestureRecognizer:longPress];
}

- (void)longPress:(UILongPressGestureRecognizer *)longPress {
    __weak typeof(self) weakSelf = self;
    if (longPress.state==UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.3 animations:^{
            weakSelf.imgView.alpha = 0.5;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3 animations:^{
                self.imgView.alpha = 1;
            } completion:^(BOOL finished) {
                // 1.将图片截屏
                UIImage *newImg = [UIImage imageWithCaptureView:self];
                // 2.将图片传给控制器
                if (weakSelf.passImgBlock) {
                    weakSelf.passImgBlock(newImg);
                }
                // 3.销毁自己（这样就又可以画东西了）
                [weakSelf removeFromSuperview];
            }];
        }];
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


@end
