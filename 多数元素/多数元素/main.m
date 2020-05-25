//
//  main.m
//  多数元素
//
//  Created by yuqin on 2020/5/25.
//  Copyright © 2020 yuqin. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 给定一个大小为 n 的数组，找到其中的多数元素。多数元素是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。

 你可以假设数组是非空的，并且给定的数组总是存在多数元素。

 示例 1:
 输入: [3,2,3]
 输出: 3
 
 示例 2:
 输入: [2,2,1,1,1,2,2]
 输出: 2

 */


/*
 解法一：使用哈希表来存每一个元素出现的次数
 O(n),O(n)
 */
int majorityElementByHashmap(NSArray* nums) {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    for (int i=0; i<nums.count; i++) {
        NSString *key = [nums[i] stringValue];
        NSNumber *elementCount = [NSNumber numberWithInt:[dic[key]intValue] +1];
        [dic setObject:elementCount forKey:key];
    }
    
    __block NSString *elemKey = nil;
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj intValue] > nums.count/2) {
            elemKey = key;
            *stop = YES;
        }
    }];
    return [elemKey intValue];
}

/*
解法二：遍历数组遇到相同数字+1，不相同数字-1. 众数的count一定是大于1
O(n),O(1)
*/
int majorityElement(NSArray* nums) {
    int count = 0;
    int majorityElem = [nums[0] intValue];
    for (NSNumber *elem in nums) {
        if (count == 0) {
            majorityElem = [elem intValue];
        }
        count += (majorityElem == [elem intValue])?1:-1;
    }
    return majorityElem;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *arr1 = @[@3,@2,@3];
        NSArray *arr2 = @[@2,@2,@1,@1,@1,@2,@2];
        int elem1 = majorityElementByHashmap(arr2);
        int elem2 = majorityElement(arr1);
        NSLog(@"多数元素 : %d", elem2);
    }
    return 0;
}
