//
//  main.m
//  LRU缓存机制
//
//  Created by yuqin on 2020/5/26.
//  Copyright © 2020 yuqin. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制。它应该支持以下操作： 获取数据 get 和 写入数据 put 。

 获取数据 get(key) - 如果关键字 (key) 存在于缓存中，则获取关键字的值（总是正数），否则返回 -1。
 写入数据 put(key, value) - 如果关键字已经存在，则变更其数据值；如果关键字不存在，则插入该组「关键字/值」。当缓存容量达到上限时，它应该在写入新数据之前删除最久未使用的数据值，从而为新的数据值留出空间。

  

 进阶:

 你是否可以在 O(1) 时间复杂度内完成这两种操作？

 
 示例:

 MyLRUCache cache = new MyLRUCache(2); //缓存容量

 cache.put(1, 1);
 cache.put(2, 2);
 cache.get(1);       // 返回  1
 cache.put(3, 3);    // 该操作会使得关键字 2 作废
 cache.get(2);       // 返回 -1 (未找到)
 cache.put(4, 4);    // 该操作会使得关键字 1 作废
 cache.get(1);       // 返回 -1 (未找到)
 cache.get(3);       // 返回  3
 cache.get(4);       // 返回  4
*/

typedef struct Node {
    int key;
    int value;
    struct Node * pre;
    struct Node * next;
} LRUNode;

typedef struct hashNode {
    int key;
    LRUNode * pNode;
    struct hashNode * next;
} HashNode;

typedef struct {
    int capacity;
    int size;
    LRUNode *head;
    LRUNode *tail;
    HashNode *hashtable;
} LRUCache;

int hash(int key, int capacity)
{
    return key & (capacity - 1);
}

LRUCache* lRUCacheCreate(int capacity) {
    LRUCache * obj = malloc(sizeof(LRUCache));
    obj->capacity = capacity;
    obj->size = 0;
    obj->head = malloc(sizeof(LRUCache));
    obj->tail = malloc(sizeof(LRUCache));
    obj->hashtable = malloc(sizeof(HashNode) * capacity);
    memset(obj->hashtable, 0, sizeof(HashNode) * capacity);
    // 循环双链表
    obj->head->next = obj->tail;
    obj->head->pre = obj->tail;
    obj->tail->pre = obj->head;
    obj->tail->next = obj->head;
    return obj;
}

void add(HashNode * hashtable, int key, int capacity, LRUNode * pNode)
{
    HashNode * head = &hashtable[hash(key, capacity)];
    HashNode * tail = head->next;
    while(tail){
        if(tail->key == pNode->key){
            tail->pNode = pNode;
            return;
        }
        tail = tail->next;
    }
    // 头插建表
    HashNode * q = malloc(sizeof(HashNode));
    q->key = key;
    q->pNode = pNode;
    q->next = head->next;
    head->next = q;
}

void del(HashNode * hashtable, int capacity, LRUNode * pNode)
{
    HashNode * head = &hashtable[hash(pNode->key, capacity)];
    HashNode * tail = head->next;
    while (tail) {
        if (tail->key == pNode->key) {
            tail->pNode = NULL; // 删除链接
            return;
        }
        tail = tail->next;
    }
}

LRUNode * containKey(HashNode * hashtable, int key, int capacity)
{
    HashNode * head = &hashtable[hash(key, capacity)];
    HashNode * tail = head->next;
    while (tail) {
        if (tail->key == key) return tail->pNode;
        tail = tail->next;
    }
    return NULL;
}

int lRUCacheGet(LRUCache* obj, int key)
{
    LRUNode * q = containKey(obj->hashtable, key, obj->capacity); // 返回索引的结点指针
    if (q != NULL) { // key存在
        // 挪动节点到表头
        LRUNode * pre = q->pre;
        LRUNode * next = q->next;
        pre->next = next;
        next->pre = pre;
        // 头插节点
        q->next = obj->head->next;
        q->pre = obj->head;
        obj->head->next = q;
        q->next->pre = q;
        return q->value;
    }
    return -1;
}

void lRUCachePut(LRUCache* obj, int key, int value)
{
    if (obj->size >= obj->capacity && containKey(obj->hashtable, key, obj->capacity) == NULL) { // 满了
        LRUNode * q = obj->tail->pre;
        LRUNode * pre = q->pre;
        // 删除最久未用
        pre->next = obj->tail;
        obj->tail->pre = pre;
        obj->size--;
        // 删除哈希表链接
        del(obj->hashtable, obj->capacity, q);
        free(q); // 释放空间
        // 插入新的节点
        LRUNode * p = malloc(sizeof(LRUNode));
        p->key = key;
        p->value = value;
        p->next = obj->head->next;
        p->pre = obj->head;
        obj->head->next = p;
        p->next->pre = p;
        obj->size++;
        // 创建索引
        add(obj->hashtable, key, obj->capacity, p);

    }
    else {
        LRUNode * q = containKey(obj->hashtable, key, obj->capacity);
        if (q != 0) {
            q->value = value;
            LRUNode * pre = q->pre;
            LRUNode * next = q->next;
            pre->next = next;
            next->pre = pre;
            q->next = obj->head->next;
            q->pre = obj->head;
            obj->head->next = q;
            q->next->pre = q;
        }
        else {
            LRUNode * q = malloc(sizeof(LRUNode));
            q->key = key;
            q->value = value;
            q->next = obj->head->next;
            q->pre = obj->head;
            obj->head->next = q;
            q->next->pre = q;
            add(obj->hashtable, key, obj->capacity, q);
            obj->size++;
        }
    }
}

void lRUCacheFree(LRUCache* obj)
{
    free(obj); // 不想写了

}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        LRUCache *cache = lRUCacheCreate(2);
        lRUCachePut(cache, 1, 1);
        lRUCachePut(cache, 2, 2);
        NSLog(@"%d", lRUCacheGet(cache, 1));       // 返回  1
        lRUCachePut(cache, 3, 3);    // 该操作会使得关键字 2 作废
        NSLog(@"%d", lRUCacheGet(cache, 2)); // 返回 -1 (未找到)
        lRUCachePut(cache, 4, 4);
        NSLog(@"%d", lRUCacheGet(cache, 1));         // 返回 -1 (未找到)
        NSLog(@"%d", lRUCacheGet(cache, 3));         // 返回  3
        NSLog(@"%d", lRUCacheGet(cache, 4));        // 返回  4
    }
    return 0;
}
