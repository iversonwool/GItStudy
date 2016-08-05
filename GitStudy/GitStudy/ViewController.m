//
//  ViewController.m
//  GitStudy
//
//  Created by 李浩 on 16/8/3.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "ViewController.h"

#import <objc/runtime.h>
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    
//    NSLog(@"%s", __func__);
//    printf("%s\n", __func__);
    
    [self getIvarList];
    
}

- (void)getIvarList {

    unsigned int count = 0;
    
    Ivar *ivars = class_copyIvarList([Person class], &count);
    
    for (int i=0; i<count; i++) {
        Ivar ivar = ivars[i];
        
        // 查看成员变量
        const char *ivar_name = ivar_getName(ivar);
        NSLog(@"%s", ivar_name);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
