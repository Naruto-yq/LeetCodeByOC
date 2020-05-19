//
//  main.m
//  合并两个有序链表
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
 将两个升序链表合并为一个新的升序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

 示例：

 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
*/

ListNode *mergeTwoList(ListNode *list1, ListNode *list2) {
    if ((list1 == nil && list2 == nil) || (list1->next == nil && list2->next == nil)) {
        return nil;
    }
    
    ListNode *mergeList = [[ListNode alloc] init];
    ListNode *p1 = list1->next;
    ListNode *p2 = list2->next;
    ListNode *p = mergeList;
    while (p1 && p2) {
        int value1 = p1->value;
        int value2 = p2->value;
        if (value1 <= value2) {
            p->next = p1;
            p = p1;
            p1 = p1->next;
        }else {
            p->next = p2;
            p = p2;
            p2 = p2->next;
        }
    }
    
    p->next = p1?p1:p2;
    
    return mergeList;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ListNode *list1 = [[ListNode alloc] init];
        createListNode(list1, 3);
        printList(list1);
        
        ListNode *list2 = [[ListNode alloc] init];
        createListNode(list2, 3);
        printList(list2);
        
        ListNode *mergeList = mergeTwoList(list1, list2);
        printList(mergeList);
        
    }
    return 0;
}
