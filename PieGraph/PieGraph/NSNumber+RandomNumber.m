//
//  NSNumber+RandomNumber.m
//  PieGraph
//
//  Created by 李浩 on 16/8/18.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "NSNumber+RandomNumber.h"

@implementation NSNumber (RandomNumber)

+ (NSNumber *)randomNumber {

    return @(arc4random_uniform(100)+1);
}

@end
