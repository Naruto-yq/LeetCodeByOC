//
//  main.m
//  爬楼梯
//
//  Created by yuqin on 2020/5/19.
//  Copyright © 2020 yuqin. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

 注意：给定 n 是一个正整数。

 示例 1：

 输入： 2
 输出： 2
 解释： 有两种方法可以爬到楼顶。
 1.  1 阶 + 1 阶
 2.  2 阶
 示例 2：

 输入： 3
 输出： 3
 解释： 有三种方法可以爬到楼顶。
 1.  1 阶 + 1 阶 + 1 阶
 2.  1 阶 + 2 阶
 3.  2 阶 + 1 阶
 */

/*
 递归求解：O(n),O(n)
 */
int climbingStairs(int n) {
    if (n == 0) {
        return 0;
    }
    
    if (n == 1) {
        return 1;
    }
    
    return climb_stairs(0, n);
}

int climb_stairs(int i, int n) {
    if (n == 0) {
        return 0;
    }
    
    if (i > n) {
        return 0;
    }
    
    if (i == n) {
        return 1;
    }

    return climb_stairs(i+1, n) + climb_stairs(i+2, n);
}

/*
斐波那契数解法：O(n),O(1)
*/
int climbingStairsByFib(int n) {
    if (n == 0) {
        return 0;
    }
    
    if (n == 1) {
        return 1;
    }
    
    int f1 = 1;
    int f2 = 2;
    
    for (int i=3; i<=n; i++) {
        int count = f1 + f2;
        f1 = f2;
        f2 = count;
    }
    
    return f2;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        int count = climbingStairs(4);
//
//        NSLog(@"--->>>%d", count);
        NSLog(@"--->>>%d", climbingStairsByFib(30));
    }
    return 0;
}
