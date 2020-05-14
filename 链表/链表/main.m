//
//  main.m
//  链表
//
//  Created by yuqin on 2020/5/14.
//  Copyright © 2020 yuqin. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark -- 单向链表
/*
 * 数据结构，使用了OC的对象
 */
@interface ListNode : NSObject
{
    @public
    int value;
    ListNode *next;
}
@end

@implementation ListNode

@end

/*
 * 链表的创建，有两种方法，头插法和尾插法
 */
void createListNode(ListNode *list, int lenght) {
    //头插法
//    list->next = nil;
    for (int i=1; i<=lenght; i++) {
        int num = 0;
//        scanf("%i", &num);
        ListNode *p = [[ListNode alloc] init];
        p->value = i;
        p->next = nil;
        //头插法
//        p->next = list->next;
//        list->next = p;
        
        list->next = p;
        list = p;
    }
    list->next = nil;
}

/*
* 打印链表
*/
void printList(ListNode *list) {
    if (!list->next) {
        return;
    }
    ListNode *node = list->next;
    NSMutableString *listStr = [NSMutableString string];
    while (node) {
        [listStr appendFormat:@"%d", node->value];
        [listStr appendFormat:@"->"];
        node = node->next;
    }
    [listStr appendFormat:@"nil"];
    NSLog(@"%@", listStr);
}

/*
* 反转链表，时间复杂度：O(n),空间复杂度：O(1)
*/
void reveseList(ListNode *list) {
    if (!list->next) {
        return;
    }
    ListNode *preNode = nil;
    ListNode *node = list->next;
    while (node) {
        list->next = node;
        ListNode *nextNode = node->next;
        node->next = preNode;
        preNode = node;
        node = nextNode;
    }
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ListNode *list = [[ListNode alloc] init];
        createListNode(list, 5);
        
        printList(list);
        
        reveseList(list);
        
        printList(list);
    }
    return 0;
}
