//
//  Argorithm_002.m
//  Algorithm to practiceTests
//
//  Created by apple on 2018/12/26.
//  Copyright © 2018年 ZuoerdingCoder. All rights reserved.
//

#import "Argorithm_002.h"

typedef struct Node {
    int data;
    struct Node *next;
} Node;

@implementation Argorithm_002

#pragma mark - 一、反转单链表
- (void)testReverseSinglyLinkedNode {
    
    Node *head = NULL;
    insertNode(&head, 8);
    insertNode(&head, 7);
    insertNode(&head, 6);
    insertNode(&head, 5);
    insertNode(&head, 4);
    insertNode(&head, 3);
    
    reverse(&head);
    
    printLinkedList(head);
}


#pragma mark - Private
void reverse(Node **head_ref) {
    
    //判断是否是空链表
    if (*head_ref == NULL) {
        return;
    }
    
    Node *prev = NULL;
    Node *current = *head_ref;
    while (current) {
        Node *next = current->next;
        if (!next) {
            //到达尾结点,将地址存入head_ref
            *head_ref = current;
        }
        
        //将当前结点next指向前一个结点，null时即为尾结点
        current->next = prev;
        
        //修改完current->next之后，往下移动一个结点，prev-current-next,整体往右移动一个结点，所以，这里需要做结点的重新赋值
        prev = current;
        current = next;
    }
}


/* 插入新结点到链表头部 */
void insertNode(Node **head_ref,int data) {
    Node *newNode = malloc(sizeof(Node));
    newNode->data = data;
    newNode->next = *head_ref;
    *head_ref = newNode;
}

/* 打印链表中的数据 */
void printLinkedList(Node *node) {
    printf("**** start **** \n");
    while (node) {
        printf("%d \n",node->data);
        node = node->next;
    }
    printf("**** end **** \n");
}


@end
