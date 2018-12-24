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
    /**
     *  x:遍历数组a的指针
     *  y:遍历数组b的指针
     *  i:记录归并数组当前存储位置
     */
    int x = 0;
    int y = 0;
    int i = 0;
    
    while (x < aLength && y < bLength) {
        if (a[x] < b[y]) {
            result[i] = a[x];
            x++;
        } else {
            result[i] = b[y];
            y++;
        }
        i++;
    }
    
    while (x < aLength) {
        result[i] = a[x];
        x++;
        i++;
    }
    
    while (y < bLength) {
        result[i] = b[y];
        y++;
        i++;
    }
}

@end
