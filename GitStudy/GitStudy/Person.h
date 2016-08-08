//
//  Person.h
//  GitStudy
//
//  Created by 李浩 on 16/8/5.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <objc/runtime.h>

@interface Person : NSObject <NSCoding>


@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) NSString *height;

+ (instancetype)sharedPerson;


@end
