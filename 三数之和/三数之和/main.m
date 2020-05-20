//
//  main.m
//  三数之和
//
//  Created by yuqin on 2020/5/20.
//  Copyright © 2020 yuqin. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有满足条件且不重复的三元组。

 注意：答案中不可以包含重复的三元组。

 示例：

 给定数组 nums = [-1, 0, 1, 2, -1, -4]，

 满足要求的三元组集合为：
 [
   [-1, 0, 1],
   [-1, -1, 2]
 ]
*/

/*
 方法一：最简单的方法，三重for循环求解，就不写了
 */

/*
 方法二：现排序，在使用两个指针，同时向中间遍历
 */
NSArray* findThreeNumSum(NSArray *array) {
    if (array==nil || array.count < 3) {
        return nil;
    }
    
    array = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    
    NSMutableArray *resultArr = [NSMutableArray array];
    
    for (int i=0; i<array.count-2; i++) {
        if ([array[i] intValue] > 0) {
            return nil;
        }
        
        int start = i+1;
        int end = array.count-1;
        
        while (start < end) {
            int sum = -([array[start] intValue]+[array[end] intValue]);
            if (sum == [array[i] intValue]) {
                NSMutableArray *mArr = [NSMutableArray arrayWithObjects:array[i], array[start], array[end], nil];
                [resultArr addObject:mArr];
            }
            
            if (sum <= [array[i] intValue]) {
                end--;
            }else {
                start++;
            }            
        }
    }
    return resultArr;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *array = @[@(-1), @0, @1, @2, @(-1), @(-4)];
        
        findThreeNumSum(array);
    }
    return 0;
}
