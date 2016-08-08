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
#import "Student.h"
#import "StudentManager.h"

#define PATHP [NSHomeDirectory() stringByAppendingPathComponent:@"persons.arc"]
#define PATHS [NSHomeDirectory() stringByAppendingPathComponent:@"students.arc"]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    
//    NSLog(@"%s", __func__);
//    printf("%s\n", __func__);
    
//    [self getIvarList];
    [self archivePerson];
    [self unarchivePerson];
    [self archiveStudents];
    [self unarchiveStudents];
    
    // 创建person单例
    Person *per0 = [Person sharedPerson];
    Person *per1 = [Person sharedPerson];
    NSLog(@"%@, %@", per0, per1);
    
    // 创建studentManager单例
    [self createStudentManagerSingleton];
}

- (void)createStudentManagerSingleton {
    StudentManager *manager0 = [[StudentManager alloc] init];
    StudentManager *manager1 = [[StudentManager alloc] init];
    NSLog(@"%p, %p", manager0, manager1);
}

- (void)archivePerson {

    Person *per0 = [[Person alloc] init];
    per0.name = @"LeeHow";
    
    Person *per1 = [[Person alloc] init];
    per1.name = @"leehow";
    
    NSArray *array = @[per0, per1];
    NSLog(@"%d", [NSKeyedArchiver archiveRootObject:array toFile:PATHP]);
    
    
}

- (void)unarchivePerson {

    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:PATHP];
    
    NSLog(@"%lu", array.count);
    for (Person *per in array) {
        NSLog(@"%@", per.name);
    }
}


- (void)archiveStudents {
    Student *stu0 = [[Student alloc] init];
    stu0.name = @"abc";
    
    Student *stu1 = [[Student alloc] init];
    stu1.name = @"123";
    
    NSArray *array = @[stu0, stu1];
    NSLog(@"%d", [NSKeyedArchiver archiveRootObject:array toFile:PATHS]);
}


- (void)unarchiveStudents {
    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:PATHS];
    NSLog(@"%lu", array.count);
    for (Student *stu in array) {
        NSLog(@"%@", stu.name);
    }
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
