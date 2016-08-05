//
//  runtime.h
//  GitStudy
//
//  Created by 李浩 on 16/8/5.
//  Copyright © 2016年 李浩. All rights reserved.
//

#ifndef runtime_h
#define runtime_h

学习笔记

runtime: 运行时机制
1.是什么
1》 runtime是一套比较底层的纯C语言API， 属于1个C语言库， 包含了很多底层的C语言API
2》平时编写的OC代码， 在程序运行过程中， 其实最终都是转成了runtime的C语言代码， runtime算是OC的幕后工作者
3》举例
OC:
[[Person alloc] init]

runtime:
objc_msgSend(objc_msgSend("Person", "alloc"), "init")


2.怎么用
1》runtime是属于OC的底层， 可以进行一些非常底层的操作（用OC是不好实现， 很难实现）
＊在程序运行过程中， 动态创建一个类（KVO的底层实现）
＊在程序运行过程中， 动态的为类添加属性／添加方法， 修改属性值／修改方法
* 遍历一个类的所有属性（成员变量）／方法

3.相关的头文件和方法

1》 头文件
＊ <objc/runtime.h>
* <objc/message.h>

2》 相关应用
＊ NSCoding（归档和解档）
＊ 字典－－－》模型（利用runtime便利模型对象的所有属性， 根据属性的名字从字典中取出对应的值， 设置到模型的属性上）
＊ KVO利用runtime动态产生一个类
* 用于封装框架

3》 相关函数
＊ objc_msgSend： 给对象发送消息
＊ class_copyMethodList
* class_copyIvarList

4》必备常识
Ivar： 成员变量
Method： 成员方法

#endif /* runtime_h */

