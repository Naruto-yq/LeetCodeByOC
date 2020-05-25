//
//  main.m
//  盛最多水的容器
//
//  Created by yuqin on 2020/5/25.
//  Copyright © 2020 yuqin. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

 说明：你不能倾斜容器，且 n 的值至少为 2。


 图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。

 
 示例：

 输入：[1,8,6,2,5,4,8,3,7]
 输出：49
 */

/*
 使用双指针遍历，O(n),O(1)
 */

long maxArea(NSArray* height, int heightSize){
    if (height == nil || heightSize < 2) {
        return 0;
    }
    int l=0,r=heightSize-1;
    int maxArea = 0;
    while (l<r) {
        maxArea = MAX(maxArea, (MIN([height[l] intValue], [height[r] intValue]) *(r-l)));
        if ([height[l] intValue] < [height[r] intValue]) {
            l++;
        }else {
            r--;
        }
    }
    
    return maxArea;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *arr1 = @[@1,@8,@6,@2,@5,@4,@8,@3,@7];
        NSLog(@"max area:%ld", maxArea(arr1, arr1.count));
    }
    return 0;
}
