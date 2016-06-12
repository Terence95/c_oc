//
//  main.c
//  File_operation
//
//  Created by Terence on 16/6/12.
//  Copyright © 2016年 Terence. All rights reserved.
//

#include <stdio.h>
#define FILE_NAME "/Users/terence/Desktop/sparknote.txt"

void writeFile(){
    // 定义文件类型的指针
    FILE *fp = fopen(FILE_NAME, "wr");
    if (fp != NULL) {
        
        char ch;
        printf("Please input a char input '#' end input\n");
        while ((ch = getchar()) != '#') {
            fputc(ch, fp);
        }
    }else{
        printf("Open file failed!");
    }
    
    fclose(fp);
    
}

// read file
void readFile(){
    FILE *fp = fopen(FILE_NAME, "wr");
    
    if (fp != NULL) {
        
    }else{
        printf("\nOpen File Failed!");
    }
}

int main(int argc, const char * argv[]) {
    writeFile();
    return 0;
}
