//
//  main.m
//  搜索旋转排序数组
//
//  Created by yuqin on 2020/5/25.
//  Copyright © 2020 yuqin. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 假设按照升序排序的数组在预先未知的某个点上进行了旋转。

 ( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。

 搜索一个给定的目标值，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。

 你可以假设数组中不存在重复的元素。

 你的算法时间复杂度必须是 O(log n) 级别。

 示例 1:

 输入: nums = [4,5,6,7,0,1,2], target = 0
 输出: 4
 示例 2:

 输入: nums = [4,5,6,7,0,1,2], target = 3
 输出: -1
 */

/*
 二分查找法
 */
int search(NSArray* nums, int target) {
    int l=0,r=nums.count-1;
    
    while (l<=r) {
        int mid = (l+r)/2;
        if (target == [nums[mid] intValue]) {
            return mid;
        }
        
        if ([nums[0] intValue] <= [nums[mid] intValue]) {
            if (target >= [nums[0] intValue] && target < [nums[mid] intValue]) {
                r = mid-1;
            }else {
                l = mid+1;
            }
        }else {
            if (target > [nums[mid] intValue] && target <= [nums[nums.count-1] intValue]) {
                l = mid+1;
            }else {
                r = mid-1;
            }
        }
    }
    
    return -1;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *arr1 = @[@4,@5,@6,@7,@0,@1,@2];
        NSArray *arr2 = @[@2,@2,@2,@2,@0,@1,@2,@2,@2,@2,@2,@2,@2,@2,@2,@2,@2,@2,@2,@2,@2,@2,@2,@2,@2,@2,@2,@2,@2,@2];
        NSLog(@"position: %d", search(arr1, 1));
    }
    return 0;
}
