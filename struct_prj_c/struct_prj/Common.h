//
//  Common.h
//  struct_prj
//
//  Created by 中软国际018 on 16/6/8.
//  Copyright (c) 2016年 中软国际018. All rights reserved.
//

#ifndef struct_prj_Common_h
#define struct_prj_Common_h

// 定义学生结构体
struct student{
    int num_id;
    char name[20];
    int age;
    int sex;
    char address[50];
    
    struct student *next;
};
// 定义一个typedef
typedef struct student stu;
#endif
