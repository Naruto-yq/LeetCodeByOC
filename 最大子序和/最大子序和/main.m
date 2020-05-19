//
//  main.m
//  最大子序和
//
//  Created by yuqin on 2020/5/19.
//  Copyright © 2020 yuqin. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

示例:

输入: [-2,1,-3,4,-1,2,1,-5,4],
输出: 6
解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
进阶:

如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的分治法求解。
*/

/*
 最简单的方法，其实思路就是前面遇到负数就抛弃，遇到正数就拿住，但是还是要比较连续的数值
 O(n),O(1)
 */
int maxSubArray(NSArray *array) {
    if (array == nil || array.count < 1) {
        return 0;
    }
    int pre = 0;
    int start = 0;
    int end = array.count-1;
    int maxSum = [array[0] intValue];
    
    for (int i=0; i<array.count; i++) {
        int curNum = [array[i] intValue];
        if (pre+curNum <= curNum) {
            start = i;
        }
        pre = MAX(pre+curNum, curNum);
        if (pre >= maxSum) {
            end = i;
        }
        maxSum = MAX(maxSum, pre);
    }
    
    if (end < start) {
        start = 0;
    }
    NSLog(@"max sum array:%@", [array subarrayWithRange:NSMakeRange(start, end-start+1)]);
    return maxSum;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSArray *array = @[@(-2), @1, @(-3), @4, @(-1), @2, @1, @(-5), @4];
        NSArray *array1 = @[@1];
        NSArray *array2 = @[@1, @2, @3, @1, @2, @3];
        NSArray *array3 = @[@(-2), @(-3), @(-5)];
        NSLog(@"max subarray sum:%d", maxSubArray(array));
    }
    return 0;
}
