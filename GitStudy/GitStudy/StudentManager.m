//
//  StudentManager.m
//  GitStudy
//
//  Created by 李浩 on 16/8/8.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "StudentManager.h"

@implementation StudentManager

+ (instancetype)allocWithZone:(struct _NSZone *)zone {

    static StudentManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [super allocWithZone:zone];
    });
    return manager;
}

@end
