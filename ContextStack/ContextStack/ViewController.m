//
//  ViewController.m
//  ContextStack
//
//  Created by 李浩 on 16/8/18.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 创建图片水印
    
    UIImage *oldImage = [UIImage imageNamed:@"IMG_0008.jpg"];
    
    // 1.创建上下文
    // size  新图片的大小
    // YES －－不透明    NO－－透明
    UIGraphicsBeginImageContextWithOptions(oldImage.size, NO, 1);
    
    [oldImage drawAtPoint:CGPointZero];
    
    // 添加文字
    NSString *str = @"WHO'S";
    [str drawAtPoint:CGPointMake(120, 170) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15], NSForegroundColorAttributeName:[UIColor redColor]}];
    // 拿到新图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 4.销毁上下文
    UIGraphicsEndImageContext();
    
    
    // 展示
    self.imageView.image = newImage;
    
    // 写入桌面
    NSData *data = UIImagePNGRepresentation(newImage);
    [data writeToFile:@"/Users/LeeHow/Desktop/skateboard.png" atomically:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
