//
//  ViewController.m
//  ImageClipped
//
//  Created by 李浩 on 16/8/18.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ClipAndCapture.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor = [UIColor blackColor];
    
    
    //[self clipImage];
    
//    [self clipCircleImage];
    
//    [self captureScreen];
    
    
//    UIImage *newImg = [UIImage imageWithCaptureView:self.view];
    
    UIImage *newImg = [UIImage imageWithName:@"IMG_0008.png" borderWith:8 borderColor:[UIColor magentaColor]];
    
    NSData *data = UIImagePNGRepresentation(newImg);
    [data writeToFile:@"/Users/LeeHow/Desktop/clip0.png" atomically:YES];
}


- (void)captureScreen {

    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 1);
    
    // 渲染控制器的view到上下文，注意：：：图层只能用渲染，不能用draw
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *capture = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    NSData *data = UIImagePNGRepresentation(capture);
    [data writeToFile:@"/Users/LeeHow/Desktop/capture.png" atomically:YES];
}

- (void)clipCircleImage {

    UIImage *oldImg = [UIImage imageNamed:@"IMG_0008.jpg"];
    
    CGFloat borderWidth = 5;
    CGFloat imgW = oldImg.size.width+2*borderWidth;
    CGFloat imgH = oldImg.size.height+2*borderWidth;

    
    CGFloat biggerRadius = imgW<=imgH?imgW:imgH;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(biggerRadius, biggerRadius), NO, 1);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, biggerRadius, biggerRadius)];
    
    CGContextRef currentCtx = UIGraphicsGetCurrentContext();
    CGContextAddPath(currentCtx, path.CGPath);
    
    [[UIColor whiteColor] setFill];
    CGContextFillPath(currentCtx);


//    CGRect clipRect = CGRectMake(borderWidth, borderWidth, oldImg.size.width, oldImg.size.height);
//    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:clipRect];
//    [clipPath addClip];
    
    [oldImg drawAtPoint:CGPointMake(borderWidth, borderWidth)];
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    
    // 6.销毁上下文
    UIGraphicsEndImageContext();
    
    // 7.展示
    UIImageView *imgView = [[UIImageView alloc] initWithImage:newImg];
    imgView.frame = CGRectMake(10, 64, 200, 200);
    [self.view addSubview:imgView];
}

- (void)clipImage {

    UIImage *oldImg = [UIImage imageNamed:@"IMG_0008.jpg"];
    
    // 1.新建上下文
    UIGraphicsBeginImageContextWithOptions(oldImg.size, NO, 1);
    
    // 2.裁剪路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, oldImg.size.width, oldImg.size.height)];
    
    // 3.裁剪
    [path addClip];
    
    // 4.画图片
    [oldImg drawAtPoint:CGPointZero];
    
    // 5.新图片
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    
    // 6.销毁上下文
    UIGraphicsEndImageContext();
    
    // 7.展示
    UIImageView *imgView = [[UIImageView alloc] initWithImage:newImg];
    imgView.frame = CGRectMake(10, 64, 200, 200);
    [self.view addSubview:imgView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

@end
