
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

typedef struct student
{
    int age;
    int score;
    char name[10];
    struct student *next;
}st1;

void create(st1 *head);//创建链表
void print(st1* head);//打印链表
st1* find(st1 *head,int index);//链表查找
st1* insert(st1 *head);//插入信息
void dele(st1 *head);//删除信息
void change(st1 *head);//修改信息
void reverse(st1 *head);//反序输入信息
void sort(st1* head);//链表排序(用值交换的方式)
int main ()
{
    int a;//用于选择选择
    int index;
    st1 *head=NULL,*p;
    head = (st1*)malloc(sizeof(st1));//分配头指针空间
    do
    {
        printf("***********链表操作************\n");
        printf("********请选择你的操作*********\n");
        printf("1) 创建链表 2) 增加节点****\n");
        printf("3) 删除节点 4) 改正节点****\n");
        printf("5) 查找节点 6) 链表排序****\n");
        printf("7) 链表逆序 8) 输出链表****\n");
        printf("*********9) 退出系统***********\n");
        scanf( "%d",&a);
        if(9 == a)//用户选择9 就退出系统
            break;
        else
            switch(a)//选择9以外的数字 进行链表操作
        {
            case 1://创建链表
                create(head);
                break;
            case 2://插入学生信息
                insert(head);
                break;
            case 3://删除学生信息
                dele(head);
                break;
            case 4://修改信息
                change(head);
                break;
            case 5://查找学生信息
                printf("输入你要查找第几位学生:");
                scanf("%d",&index);
                p = find(head,index);//查找学生信息并返回 地址
                printf("姓名:%s 年龄:%d 分数:%d\n",p->name,p->age,p->score);
                break;
            case 6: //排序
                sort(head);
                printf("成绩排序后");
                print(head);//打印排序后的学生信息
                break;
            case 7://链表反转
                reverse(head);
                break;
            case 8://打印信息
                print(head);
                break;
            default :
                break;
        }
    }while(1);
}
void create(st1* head)
{
    int i;
    int n;
    st1 *p,*q;
    printf("输入学生人数:\n");
    scanf("%d",&n);
    for(i=0;i<n;i++)
    {
        printf("输入第%d个学生信息:\n",i+1);
        p = (st1*)malloc(sizeof(st1));
        printf("输入姓名:\n");
        scanf("%s",&p->name);
        printf("输入年龄:\n");
        scanf("%d",&p->age);
        printf("输入分数:\n");
        scanf("%d",&p->score);
        printf("输入第%d个学生信息完成\n",i+1);
        printf("\n");
        if(0 == i)
        {
            head->next = p;
        }
        else
        {
            q->next = p;
        }
        q = p;
    }
    p->next = NULL;
}
void print(st1* head)
{
    st1* x;
    x = head->next ;
    printf("学生信息如下:\n");
    while(x)
    {
        printf("姓名:%s 年龄:%d 分数:%d\n",x->name,x->age,x->score);
        x = x->next ;
    }
    printf("\n");
}
st1* find(st1 *head,int idex)
{
    st1 *p;
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
st1* insert(st1* head)
{
    st1 *newst,*p;
    int i = 1;
    int index;
    printf("要插入的位置:");
    scanf("%d",&index);//所要插入第几位学生信息
    p = head->next ;
    newst = (st1*)malloc(sizeof(st1));
    printf("输入姓名:\n");
    scanf("%s",&newst->name);
    printf("输入年龄:\n");
    scanf("%d",&newst->age);
    printf("输入分数:\n");
    scanf("%d",&newst->score);
    printf("输入学生信息完成\n");
    if(1 == index)
    {
        st1 *q = head->next ;
        head->next = newst;
        newst->next = q;
    }
    else
        while( p )
        {
            if(i == (index-1))
            {
                st1 *q = p->next ;
                p->next = newst;
                newst->next = q;
            }
            p = p->next ;
            i++;
        }
    return p;
}
void dele(st1* head)
{
    st1 *p,*q;
    int i =1 ;
    int index;
    printf("输入删除第几位学生信息:");
    scanf("%d",&index);//所要删除第几位学生信息
    p = head->next ;
    if(1 == index)
    {
        p = head->next ;
        head->next = p->next;
        free(p);
        p = NULL;
    }
    else
        while(p)
        {
            if(i ==(index-1))
            {
                q = p->next ;
                p->next = q->next ;
                free(q);
            }
            p = p->next ;
            i++;
        }
    printf("第%d位学生信息已经删除\n",index);
}
void change(st1 *head)
{
    st1 *p = NULL;
    int a ;
    printf("输入修改第几位学生信息:\n");
    scanf("%d",&a);
    p =find(head ,a);//修改之前调用find函数找到该学生信息
    printf("输入姓名:\n");
    scanf("%s",&p->name);
    printf("输入年龄:\n");
    scanf("%d",&p->age);
    printf("输入分数:\n");
    scanf("%d",&p->score);
    printf("输入学生信息完成\n");
}
void reverse(st1 *head)
{
    st1 *p = head->next,*q;
    head->next = NULL;
    while(p != NULL)
    {
        q = p->next;
        p->next = head->next;
        head->next = p;
        p = q;
    }
    print(head);//打印学生信息
}
void sort(st1 *head)
{
    st1 *p,*q;
    int m ;
    int temp;//交换score临时变量
    int temp1;//交换age临时变量
    char temp2[10];//交换name临时变量
    printf("选择1)按成绩,2)按年龄排序\n");
    scanf("%d",&m);
    switch(m)
    {
        case 1:
            for(p = head;p != NULL; p = p-> next)
            {
                for (q = p->next;q != NULL; q = q-> next )
                {
                    if(p->score>q->score)
                    {
                        temp = q->score;
                        q->score = p->score;
                        p->score =temp;
                        temp1 = q->age;
                        q->age = p->age;
                        p->age =temp1;
                        strcpy(temp2,q->name);
                        strcpy(q->name,p->name);
                        strcpy(p->name,temp2);
                    }
                }
            }
            break;
        case 2:
            for(p = head;p != NULL; p = p-> next)
            {
                for (q = p->next;q != NULL; q = q-> next )
                {
                    if(p->age>q->age)
                    {
                        temp = q->score;
                        q->score = p->score;
                        p->score =temp;
                        temp1 = q->age;
                        q->age = p->age;
                        p->age =temp1;
                        strcpy(temp2,q->name);
                        strcpy(q->name,p->name);
                        strcpy(p->name,temp2);
                    }
                }
            }
            break;
    }
}
