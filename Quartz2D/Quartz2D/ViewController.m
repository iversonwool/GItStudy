//
//  ViewController.m
//  Quartz2D
//
//  Created by 李浩 on 16/8/17.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "ViewController.h"
#import "LineView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    LineView *lineView = [[LineView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 250)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:lineView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
