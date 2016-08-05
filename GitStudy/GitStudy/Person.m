//
//  Person.m
//  GitStudy
//
//  Created by 李浩 on 16/8/5.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "Person.h"


@implementation Person


- (void)encodeWithCoder:(NSCoder *)aCoder {


    unsigned int count = 0;
    
    Ivar *ivars = class_copyIvarList([Person class], &count);
    
    for (int i=0; i<count; i++) {
        Ivar ivar = ivars[i];
        
        // 查看成员变量
        const char *ivar_name = ivar_getName(ivar);
        NSLog(@"%s", ivar_name);
        
        // 归档
        // 取值用kvc
        // ivar_name是C字符串
        NSString *key = [NSString stringWithUTF8String:ivar_name];
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
        
    }
    
    // 释放， 有copy字眼
    free(ivars);

}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {

    if (self = [super init]) {
        unsigned int count = 0;
        
        Ivar *ivars = class_copyIvarList([Person class], &count);
        
        for (int i=0; i<count; i++) {
            Ivar ivar = ivars[i];
            
            // 查看成员变量
            const char *ivar_name = ivar_getName(ivar);
            NSLog(@"%s", ivar_name);
            
            // 解档
            // 取值用kvc
            // ivar_name是C字符串
            NSString *key = [NSString stringWithUTF8String:ivar_name];
            
            // 设置到成员变量身上
            [self setValue:[aDecoder decodeObjectForKey:key] forKey:key];
        }
        
        // 释放， 有copy字眼
        free(ivars);
    }
    return self;
}


@end
