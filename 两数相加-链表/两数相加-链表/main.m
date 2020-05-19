//
//  main.m
//  两数相加-链表
//
//  Created by yuqin on 2020/5/19.
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
        scanf("%i", &num);
        ListNode *p = [[ListNode alloc] init];
        p->value = num;
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
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。

 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。

 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 示例：

 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 */

ListNode* listSum(ListNode *list1, ListNode *list2) {
    if (!list1->next && !list2->next) {
        return nil;
    }

    ListNode *resultList = [[ListNode alloc] init];
    ListNode *p1 = list1->next;
    ListNode *p2 = list2->next;
    ListNode *curr = resultList;
    int carry = 0;
    while (p1 || p2) {
        
        int sum = carry + (p1?p1->value:0) + (p2?p2->value:0);
        carry = sum/10;
        ListNode *node = [[ListNode alloc] init];
        node->value = sum%10;
        node->next = nil;
        curr->next = node;
        curr = node;
        p1 = p1?p1->next:nil;
        p2 = p2?p2->next:nil;
    }
    if (carry) {
        ListNode *node = [[ListNode alloc] init];
        node->value = carry;
        node->next = nil;
        curr->next = node;
        curr = node;
    }
    return resultList;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ListNode *list1 = [[ListNode alloc] init];
        createListNode(list1, 5);
        printList(list1);
        
        ListNode *list2 = [[ListNode alloc] init];
        createListNode(list2, 3);
        printList(list2);
        
        ListNode *resultList = listSum(list1, list2);
        printList(resultList);
        
    }
    return 0;
}
