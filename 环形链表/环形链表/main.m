//
//  main.m
//  环形链表
//
//  Created by yuqin on 2020/5/20.
//  Copyright © 2020 yuqin. All rights reserved.
//

#import <Foundation/Foundation.h>

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
* 设置链表环
*/
void setListCycle(ListNode *list) {
    if (!list->next) {
        return;
    }
    ListNode *node = list->next;
    int index = 0;
    ListNode *cycleNode = list->next;
    while (node) {
        index++;
        if (index == 2) {
            cycleNode = node;
        }
        if (node->next == nil) {
            node->next = cycleNode;
            break;
        }
        node = node->next;
    }
    
}

/*
给定一个链表，判断链表中是否有环。

为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。

示例 1：

输入：head = [3,2,0,-4], pos = 1
输出：true
解释：链表中有一个环，其尾部连接到第二个节点。
*/

/*
 方法一：使用一个数组来存储每一个被人引用的节点，如果一个节点被引用两次了，就存在环
 O(n),O(n)
 */
BOOL hasCycleByArray(ListNode *list) {
    NSMutableArray *mArr = [NSMutableArray array];
    ListNode *node = list->next;
    
    while (node) {
        if ([mArr containsObject:node]) {
            return YES;
        }else {
            [mArr addObject:node];
        }
        node = node->next;
    }
    return NO;
}

/*
方法一：使用快慢指针来判断
O(n),O(1)
*/
BOOL hasCycleBySlowFastPointer(ListNode *list) {
    if (list == nil || list->next == nil) {
        return NO;
    }
    ListNode *slowNode = list->next;
    ListNode *fastNode = list->next->next;
    while (slowNode != fastNode) {
        if (slowNode == nil || fastNode == nil || fastNode->next == nil) {
            return NO;
        }
        slowNode = slowNode->next;
        fastNode = fastNode->next->next;
    }
    return YES;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ListNode *list = [[ListNode alloc] init];
        createListNode(list, 4);
        
        BOOL bHasCycle1 =  hasCycleByArray(list);
        NSLog(@"hasCycleByArray:%d", bHasCycle1);
        
        BOOL bHasCycle3 =  hasCycleBySlowFastPointer(list);
        NSLog(@"hasCycleBySlowFastPointer:%d", bHasCycle3);
        
        printList(list);
        
        setListCycle(list);
        
        BOOL bHasCycle2 =  hasCycleByArray(list);
        NSLog(@"hasCycleByArray:%d", bHasCycle2);
        
        BOOL bHasCycle4 =  hasCycleBySlowFastPointer(list);
        NSLog(@"hasCycleBySlowFastPointer:%d", bHasCycle4);
    }
    return 0;
}
