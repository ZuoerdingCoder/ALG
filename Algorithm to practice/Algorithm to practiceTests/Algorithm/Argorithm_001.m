//
//  Argorithm_001.m
//  Algorithm to practiceTests
//
//  Created by apple on 2018/12/24.
//  Copyright © 2018年 ZuoerdingCoder. All rights reserved.
//

#import "Argorithm_001.h"

@implementation Argorithm_001

#pragma mark - 一、反转字符串
- (void)testReverseChar {
    
    char a[] = "123456789";
    char_reverse(a);
    printf("reverse result:%s \n",a);
}

#pragma mark - 二、有序数组归并
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

#pragma mark - 三、在一个字符串中找到第一个只出现一次的字符
- (void)testFindFirstChar {
    
    char a[] = "saegasdgp'kgasgk mpah";
    char result = findFirstChar(a);
    printf("result:%c \n",result);
}

#pragma mark - 四、幼畜数组二分查找
- (void)testBinarySearch {
    int a[7] = {2,5,7,10,12,23,245};
    int index = binarySearch(a,23,7);
    printf("index:%d \n",index);
}


#pragma mark - 五、选择排序
- (void)testSelectSort {
    
    int a[13] = {12,235,17,101,12,23,2435,2,4,890,234,25,23513};
    int *b = selectSort(a, 13);
    printf("select sort result: \n");
    for (int i = 0; i<13; i++) {
        printf("%d \n",b[i]);
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

int binarySearch(int list[],int item,int len) {
    
    //二分查找
    //通过每次限定低位与高位的边界，然后求取中间位的值与item对比,如果不相等，重新设定高位与低位的值,来逐渐缩小item的范围，直至找到它
    
    //初始化低位下标
    int low = 0;
    
    //初始化高位下标
    int high = len-1;
    
    //循环停止条件就是高位值大于低位值时
    while (low <= high) {
        
        //计算此时的中位下标
        int mid = (low + high)/2;
        
        //本次查找到的值
        int currentItem = list[mid];
        
        //找到了
        if (currentItem == item) {
            return mid;
            
        //小了
        } else if (currentItem < item) {
            //重置low的值，用于重新计算中位值
            low = mid+1;
        //大了
        } else {
            //重置high的值，用于重新计算中位值
            high = mid-1;
        }
    }
    
    //返回-1表示在该数组中未找到item
    return -1;
}

int *selectSort(int a[],int len) {
    
    //选择排序
    //每次从数组中,通过逐一对比查找出当时最小的值，放入到新的容器数组,然后修改这个最小的值为INT_MAX
    
    //初始化一个用于存放排序后数据的数组
    int *sortedArr = (int *)malloc(sizeof(int)*len);
    
    //使用len,每次都从原数组中查找最小的值，然后将这个值置为INT_MAX
    for (int i = 0; i<len; i++) {
        
        int smallIndex = findSmallest(a, len);
        int smallValue = a[smallIndex];
        
        sortedArr[i] = smallValue;
        
        a[smallIndex] = INT_MAX;
    }
    
    return sortedArr;
}


int findSmallest(int *arr,int len) {
    
    //记录最小值的下标
    int index = 0;
    
    //记录最小值
    int smallValue = arr[0];
    
    //从i为1时，开始与smallValue对比，如果比它小，则将该值重新赋给smallValue
    for (int i = 1; i<len; i++) {
        int item = arr[i];
        if (item < smallValue) {
            smallValue = item;
            index = i;
        }
    }
    
    return index;
}


@end
