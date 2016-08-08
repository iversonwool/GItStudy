//
//  Student.m
//  GitStudy
//
//  Created by 李浩 on 16/8/5.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "Student.h"
#import <objc/runtime.h>

@implementation Student

ARCHIVE(Student)

UNARCHIVE(Student)


// alloc 方法内部会掉用allocWithZone
+ (instancetype)alloc {
    NSLog(@"%s", __func__);
    return [super alloc];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    return [super allocWithZone:zone];
}

@end
