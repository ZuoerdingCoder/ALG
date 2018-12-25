//
//  Argorithm_001.m
//  Algorithm to practiceTests
//
//  Created by apple on 2018/12/24.
//  Copyright © 2018年 ZuoerdingCoder. All rights reserved.
//

#import "Argorithm_001.h"

@implementation Argorithm_001

#pragma mark - 反转字符串
- (void)testReverseChar {
    
    char a[] = "123456789";
    char_reverse(a);
    printf("reverse result:%s \n",a);
}

#pragma mark - 有序数组归并
- (void)testMergeSortedList {
    int a[4] = {1,3,8,9};
    int b[7] = {2,5,7,10,12,23,245};
    
    int result[13];
    
    mergeSortedList(a, 4, b, 7, result);
    
    printf("merge result: \n");
    for (int i = 0; i < 11; i++) {
        int c = result[i];
        printf("%d \n",c);
    }
}

#pragma mark - 在一个字符串中找到第一个只出现一次的字符
- (void)testFindFirstChar {
    
    char a[] = "saegasdgp'kgasgk mpah";
    char result = findFirstChar(a);
    printf("result:%c \n",result);
}

#pragma mark - Private
void char_reverse(char *cha) {
    //指向第一个字符
    char *begin = cha;
    //指向最后一个字符
    char *end = cha + strlen(cha) - 1;
    
    while (begin < end) {
        //交换两个字符
        char temp = *begin;
        *begin = *end;
        *end = temp;
        
        //begin指针往后移动一位
        //end指针往前移动一位
        begin ++;
        end --;
    }
}

void mergeSortedList(int a[], int aLength, int b[], int bLength, int result[]) {

    //创建一个新的数组，然后从首部位置对比2个数组中的值，小的那一个存入到新数组中，这样循环遍历，直到某一个数组已经被全部遍历完
    //如果a,b两个数组中还有没有被遍历完的，将剩余部分拼接到合并结果的后面
    
    int x = 0; //x:遍历数组a的指针
    int y = 0; //y:遍历数组b的指针
    int i = 0; //i:记录归并数组当前存储位置
    
    //遍历2个数组
    while (x < aLength && y < bLength) {
        //如果a数组对应的值小于b数组对应的值，则存储a数组的值，然后移动遍历a数组的指针
        if (a[x] < b[y]) {
            result[i] = a[x];
            x++;
        } else {
            //存储b数组的值，然后移动遍历b数组的指针
            result[i] = b[y];
            y++;
        }
        //新数组当前存储位置++
        i++;
    }
    
    //如果a数组还有剩余,将a数组剩余值并入到新数组
    while (x < aLength) {
        result[i] = a[x];
        x++;
        i++;
    }
    
    //如果b数组还有剩余,将b数组剩余值并入到新数组
    while (y < bLength) {
        result[i] = b[y];
        y++;
        i++;
    }
}

char findFirstChar(char *cha) {
    
    //ASCII 0~255,代表所有的字符,使用一个数组来记录字符出现的次数,通过ASCII码的映射，可以使用字符的ASCII码作为数组下标快速找到对应次数值，遍历字符串，修改数组中字符出现次数，然后遍历字符串，找到第一个出现次数为1的字符
    
    //定义一个空字符'\0','\0'字符标志字符串的结束
    char result = '\0';
    
    //定义一个数组，用于存放字符出现的次数
    int a[256];
    
    //将各个字符出现次数置为0
    for (int i = 0; i < 256; i++) {
        a[i] = 0;
    }
    
    //定义一个指向字符串首部的指针
    char *x = cha;
    
    //遍历字符串中的每个字符,通过字符ASCII码,修改数组中字符存放次数值，然后移动指针
    while (*x != '\0') {
        a[*x]++;
        x++;
    }
    
    //重新遍历字符串中每个字符，通过ASCII码映射的下标，查找第一个存放次数为1的字符
    x = cha;
    while (*x != '\0') {
        if (a[*x] == 1) {
            result = *x;
            break;
        }
        x++;
    }
    
    return result;
}

@end
