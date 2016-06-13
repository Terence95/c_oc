//
//  main.m
//  practice_1
//
//  Created by Terence on 16/6/13.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 1、设计程序，练习自加，自减运算符（++，- -）
        NSLog(@"1、-----------------------");
        int a = 0;
        int b = 0;
        NSLog(@"a++ = %d", a++);
        NSLog(@"a-- = %d", a--);
        NSLog(@"++b = %d", ++b);
        NSLog(@"--b = %d", --b);
        
        // 2、设计程序，练习逻辑运算符（!,&，^,||,&&,!=)
        NSLog(@" 2、----------------------");
        int i = 0;
        int j = 10;
        int k = 9;
        if ((j>k) && (i++ == 1)) {
            NSLog(@"j > k");
        }else{
            NSLog(@"j < k");
        }
        
        // 3、设计程序，练习赋值扩展运算符（+=，-=，*=，/=）
        NSLog(@"3、-----------------------");
        int d_1 = 1;
        int d_2 = 2;
        d_1+=d_2;
        NSLog(@"d_1+=d_2 : %d", d_1); // d_1+=d_2 -> d=d+d_1
        
        int d_3 = 1;
        int d_4 = 2;
        d_3-=d_4;
        NSLog(@"d_3-=d_4 : %d", d_3); // d_3-=d_4 -> d_3 = d_3 - d_4
        
        
        int d_5 = 1;
        int d_6 = 2;
        d_5 *= d_6;
        NSLog(@"d_5 *= d_6 : %d", d_5); //d_5 *= d_6 -> d_5 = d_5 * d_6
        
        float d_7 = 1;
        float d_8 = 2;
        d_7 /= d_8;
        NSLog(@"d_7 /= d_8 : %f", d_7); // d_7 /= d_8 -> d_7 = d_7 / d_8
        
        
        // 4、设计程序，练习三目操作符（ ？ ：）
        NSLog(@"4、-----------------------");
        int e = 6;
        int f = 7;
        int result;
        result = e > f ? e : f;
        NSLog(@"result: %d", result);
        
        // 5、设计程序，练习循环语句（for，while， do while）
        NSLog(@"5、-----------------------");
        NSLog(@"for -----------------------");
        int i_1 = 0;
        for (int i = 0; i < 10; i++) {
            i_1++;
            NSLog(@"i = %d", i_1);
        }
        
        
        NSLog(@"\nWhile -----------------------");
        int i_2 = 1;
        while (i_2  < 5) {
            NSLog(@"这是第%d个数字", i_2);
            i_2++;
        }
        
        
        
        NSLog(@"\nDo While -----------------------");
        int i_3 = 1;
        do{
            NSLog(@"这是第%d个数字", i_3);
            i_3++;
        }while (i_3 < 5);
        
        
        
        // 6、设计程序，练习switch语句
        int l = 1;
        switch (l) {
            case 1:
                NSLog(@"l = %d", l);
                break;
            case 2:
                NSLog(@"l = %d", l);
                break;
            default:
                break;
        }
        
        // 7、设计程序，打印OC基本数据类型占用内存的大小
        NSLog(@"7、------------------------------");
        NSLog(@"sizeof int : %lu", sizeof(int));
        NSLog(@"sizeof float: %lu", sizeof(float));
        NSLog(@"sizeof double: %lu", sizeof(double));
        NSLog(@"sizeof char: %lu", sizeof(char));
        NSLog(@"sizeof id: %lu", sizeof(id));
        NSLog(@"sizeof long: %lu", sizeof(long));
        NSLog(@"sizeof short: %lu", sizeof(short));
        NSLog(@"sizeof unsigned: %lu", sizeof(unsigned));
        
    }
    return 0;
}
