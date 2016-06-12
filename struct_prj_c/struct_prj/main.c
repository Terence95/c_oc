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


//void initStu(stu* st){
//    if (st != NULL) {
//        st -> num_id = 10001;
//        st -> name = (char*)malloc(16*sizeof(char));
//
//        strcpy(st->name, "terence");
//    }
//}

void createList(stu* head) {
    if (head != NULL) {
        int i;
        int n;
        stu *current,*q;
        printf("输入学生人数：\n");
        scanf("%d", &n);
        for (i = 0; i < n; i++) {
            printf("输入第%d个学生信息:\n", i+1);
            current = (stu*)malloc(sizeof(stu));
            printf("input num id:\n");
            scanf("%d", &current->num_id);
            printf("input name\n");
            scanf("%s", &current->name);
            printf("input age\n");
            scanf("%d", &current->age);
            printf("input sex\n");
            scanf("%d", &current->sex);
            printf("input address:\n");
            scanf("%s", &current->address);
            printf("第%d个学生信息输入完成", i+1);
            printf("\n");
            
            if (0 == i) {
                printf("go in if\n");
                head->next = current;
            }else{
                q->next = current;
            }
            q = current;
        }
        current->next = NULL;
    }
}
void printStuInfo(stu* head){
    stu* x;
    x = head->next;
    printf("学生信息如下:\n");
    while (x) {
        printf("id：%d name:%s age:%d sex:%d address:%s\n", x->num_id, x->name,x->age,x->sex,x->address);
        x = x->next;
    }
    printf("\n");
}

stu* findStu(stu* head, int idex){
    stu *p;
    int i=1;
    p = head->next ;
    while(p )
    {
        if(i<idex)
        {
            p = p->next ;
            i++;
        }
        else
            return p;
    }
    return p;
}

stu* insert(stu* head) {
    stu *newstu,*p;
    int i = 1;
    int index;
    printf("输入插入的index");
    scanf("%d", &index);
    p = head->next;
    newstu = (stu*)malloc(sizeof(stu));
    printf("input num id:\n");
    scanf("%d", &newstu->num_id);
    printf("input name\n");
    scanf("%s", &newstu->name);
    printf("input age\n");
    scanf("%d", &newstu->age);
    printf("input sex\n");
    scanf("%d", &newstu->sex);
    printf("input address:\n");
    scanf("%s", &newstu->address);
    printf("\nnew stu info input done");
    
    if ( index == 1) {
        stu *temp = head->next;
        head->next = newstu;
        newstu->next = temp;
    }else {
        while (p) {
            if (i == (index - 1)) {
                stu *temp = p->next;
                p->next = newstu;
                newstu->next = temp;
            }
            p = p->next;
            i++;
        }
    }
    return p;
    
}

int main(int argc, const char * argv[]) {
    int a;//用于选择
    int index;
    
    // start
    stu *head = NULL;
    stu *p = NULL;
    // 分配指针头空间
    head = (stu*)malloc(sizeof(stu));
    do
    {
        printf("***********链表操作************\n");
        printf("********请选择你的操作*********\n");
        printf("1) 创建链表 2) 增加节点****\n");
        printf("3) 删除节点 4) 改正节点****\n");
        printf("5) 查找节点 6) 输出链表****\n");
        printf("*********0) 退出系统***********\n");
        scanf( "%d",&a);
        if(0 == a){//用户选择9 就退出系统
            break;
        }
        else {
            switch (a) {
                case 1:
                    createList(head);
                    break;
                case 5:
                    printf("输入你要查找第几位学生:");
                    scanf("%d",&index);
                    p = findStu(head,index);//查找学生信息并返回 地址
                    if (p != NULL) {
                        printf("id：%d name:%s age:%d sex:%d address:%s\n\n", p->num_id, p->name,p->age,p->sex,p->address);
                    }else{
                        printf("Empty List!\n\n");
                    }
                    break;
                case 6://打印信息
                    printStuInfo(head);
                    break;
                    
                default:
                    break;
            }
        }
    }while (1);
    free(head);
    return 0;
}
