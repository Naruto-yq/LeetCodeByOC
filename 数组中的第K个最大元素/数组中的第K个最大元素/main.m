//
//  main.m
//  数组中的第K个最大元素
//
//  Created by yuqin on 2020/5/25.
//  Copyright © 2020 yuqin. All rights reserved.
//

/*
在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。

示例 1:
输入: [3,2,1,5,6,4] 和 k = 2
输出: 5
 
示例 2:
输入: [3,2,3,1,2,4,5,5,6] 和 k = 4
输出: 4
说明:

你可以假设 k 总是有效的，且 1 ≤ k ≤ 数组的长度。
*/

#import <Foundation/Foundation.h>

/*
 解法一：排序，直接去数组第k大的。
 */

/*
解法二：使用堆来存储前面k个数据
*/
void swap(NSMutableArray *nums, int n, int m) {
    [nums exchangeObjectAtIndex:n withObjectAtIndex:m];
}

void heapify(NSMutableArray *a, int k, int i) {
        //临时变量 minPos 用于存储最小值的下标，先假设父节点最小
    int minPos = i;
    while (true) {
        //和左子节点比较
        if (i*2+1 < k && [a[i*2+1] intValue] < [a[i] intValue]) minPos = i*2+1;
        //和右子节点比较
        if (i*2+2 < k && [a[i*2+2] intValue] < [a[minPos] intValue]) minPos = i*2+2;
        //如果minPos没有发生变化，说明父节点已经是最小了，直接跳出
        if (minPos == i) break;
        //否则交换
        swap(a, i, minPos);
        //父节点下标进行更新，继续堆化
        i = minPos;
    }
}

void build(NSMutableArray *nums, int k) {
    NSArray *arr = [NSArray array];
    for (int i = k/2 - 1; i >= 0; i--) {
        heapify(nums, k, i);
    }
}

int findKthLargest(NSMutableArray *nums, int k){
    build(nums, k);
    //遍历剩下元素，比堆顶小，跳过；比堆顶大，交换后重新堆化
    for (int i = k; i < nums.count; i++) {
        if ([nums[i] intValue] < [nums[0] intValue]) continue;
        swap(nums, i, 0);
        heapify(nums, k, 0);
    }
    
    NSLog(@"%@", nums);
    //K个元素的小顶堆的堆顶即是第K大元素
    return [nums[0] intValue];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *arr1 = @[@3,@2,@3,@1,@2,@4,@5,@5,@6];
        NSArray *arr2 = @[@3,@2,@1,@5,@6,@4];
        int kthNum = findKthLargest([NSMutableArray arrayWithArray:arr2], 3);
        NSLog(@"kthNum : %d", kthNum);
    }
    return 0;
}
