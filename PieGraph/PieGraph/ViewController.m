//
//  ViewController.m
//  PieGraph
//
//  Created by 李浩 on 16/8/18.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "ViewController.h"

#import "ImitateIMGView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ImitateIMGView *imgV = [[ImitateIMGView alloc] initWithFrame:CGRectMake(5, 200, 50, 50)];
    imgV.image = [UIImage imageNamed:@"IMG_0008.jpg"];
    [self.view addSubview:imgV];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
