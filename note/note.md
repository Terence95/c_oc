#IOS 开发OC 基础     

[![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome)

###类及对象


- ####面向对象概念

	类、对象、封装、继承
	
	对象是类的实例化
	
	类是对象的原型
- ####定义类

	接口部分：声明类的特征和行为(.h文件中)，在oc中类的声明文件用于声明成员变量、方法，类的声明使用关键字 `@interface` 和 `@end`，方法只是做一个声明，并不对方法进行实现，要加分号 ";"

例子：

![Smaller icon](https://github.com/Terence95/c_oc/blob/master/note/img/%E5%A3%B0%E6%98%8E.png)

	
实现部分：实现行为及方法的实现(.m文件中)

例子：

![show1-2](https://github.com/Terence95/c_oc/blob/master/note/img/%E5%AE%9E%E7%8E%B0.png)
	

- ####类的成员变量
	
	类的成员变量的作用域有3种
	
	1. `@public` 全局都可以访问
	
	2. `@protected` 只能在内部类和子类中访问
	
	3. `@private` 只能在类内部访问
	

- ####类方法
	
	1. 方法的声明和实现必须以 + 或者 - 开头
		- \+  表示类方法（静态方法）
		
		- \-  表示对象方法（动态方法）
	
	2. 在.h 类声明文件中所有方法的作用域都是public类型，不能修改
	

- ####成员变量及方法

