//
//  Argorithm_001.m
//  Algorithm to practiceTests
//
//  Created by apple on 2018/12/24.
//  Copyright © 2018年 ZuoerdingCoder. All rights reserved.
//

#import "Argorithm_001.h"

@implementation Argorithm_001

#pragma mark -
- (void)testReverseChar {
    
    char a[] = "123456789";
    char_reverse(a);
    NSLog(@"reverse result:%s",a);
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
        //end指针忘前移动一位
        begin ++;
        end --;
    }
}

@end
