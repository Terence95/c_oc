//
//  main.c
//  struct_prj
//  target: 标准使用结构体
//  Created by 中软国际018 on 16/6/8.
//  Copyright (c) 2016年 中软国际018. All rights reserved.
//

#include <stdio.h>
#include "Common.h"
#include "linklist.h"
#include <stdlib.h>
#include <string.h>


void initStu(stu* st){
    if (st != NULL) {
        st -> num_id = 10001;
        st -> name = (char*)malloc(16*sizeof(char));
        
        strcpy(st->name, "terence");
    }
}

void creatList(stu* head) {
    if (head != NULL) {
        int i;
        int n;
        stu *p,*q;
        printf("输入学生人数：\n");
        scanf("%d", &n);
        for (i = 0; i < n; i++) {
            printf("输入第%d个学生信息:\n", i+1);
            p = (stu*)malloc(sizeof(stu));
            printf("input num id:\n");
            scanf("%d", &p->num_id);
            printf("input name\n");
            scanf("%s", &p->name);
            printf("input age\n");
            scanf("%d", &p->age);
            printf("input sex\n");
            scanf("%d", &p->sex);
            printf("input address:\n");
            scanf("%s", &p->address);
            printf("第%d个学生信息输入完成", i+1);
            printf("\n");
            
            if (0 == i) {
                head->next = p;
            }else{
                q->next = p;
            }
            
            q = p;
            p->next = NULL;
        }
    }
}

void printStuInfo(stu* head){
    stu* next;
    next = head->next;
    printf("学生信息如下:\n");
    while (next) {
        printf("id：%d name:%s age:%d sex:%d address:%s", next->num_id, next->name, next->age, next->sex, next->address);
        next = next->next;
    }
    printf("\n");
    
    
}

int main(int argc, const char * argv[]) {
    // 结构体声明不分配存储                                                                                                                              空间
    // 结构体定义的形式
    
    // 声明
//    stu* st = (stu*)malloc(sizeof(stu));
//    
//    initStu(st);
//    // printf("%lu\n", sizeof(st));
//    printf("%d\n",  st->num_id);
//    printf("%s",  st->name);
//    
//    // 要进行释放
//    free(st);
//    // 并且把st重置成NULL，防止野指针出现
//    st = NULL;
    
    
    
    // start
    stu* head = NULL;
    stu* p;
    // 分配指针头空间
    head = (stu*)malloc(sizeof(stu));
    creatList(head);
    
    return 0;
}
