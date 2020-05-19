//
//  main.m
//  寻找两个正序数组的中位数
//
//  Created by yuqin on 2020/5/19.
//  Copyright © 2020 yuqin. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
给定两个大小为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。

请你找出这两个正序数组的中位数，并且要求算法的时间复杂度为 O(log(m + n))。

你可以假设 nums1 和 nums2 不会同时为空。
*/
double findMiddleNum(NSArray *array1, NSArray *array2) {
    if (array1 == nil && array2 == nil) {
        return 0;
    }
    
    if (array1 == nil && array2 != nil) {
        int count = array2.count;
        if (count & 1) {
            return [array2[count/2] intValue];
        }else {
            return ([array2[count/2] intValue] + [array2[count/2 -1] intValue])/2.0;
        }
    }
    
    if (array2 == nil && array1 != nil) {
        int count = array1.count;
        if (count & 1) {
            return [array1[count/2] intValue];
        }else {
            return ([array1[count/2] intValue] + [array1[count/2 -1] intValue])/2.0;
        }
    }
    
    int index1 = 0, index2 = 0;
    int length1 = array1.count, length2 = array2.count;
    int middleIndex = (length1 + length2)/2;
    int currentIndex = 0;
    int oddMiddleNum = 0, evenMiddleNum = 0;
    
    while (currentIndex <= middleIndex) {
        currentIndex++;
        evenMiddleNum = oddMiddleNum;
        
        if (index1 == length1) {
            oddMiddleNum = [array2[index2] intValue];
            index2++;
            continue;
        }
        
        if (index2 == length2) {
            oddMiddleNum = [array1[index1] intValue];
            index1++;
            continue;
        }
        
        if ([array1[index1] intValue] <= [array2[index2] intValue]) {
            oddMiddleNum = [array1[index1] intValue];
            index1++;
        }else {
            oddMiddleNum = [array2[index2] intValue];
            index2++;
        }
    }
    
    if ((length1+length2) & 1 ) {
        return oddMiddleNum;
    }else {
        return (oddMiddleNum+evenMiddleNum)/2.0;
    }
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSArray *array1 = @[@1, @3, @4, @5];
        NSArray *array2 = @[@3, @7, @9];

        double middleNum = findMiddleNum(array1, array2);
        NSLog(@"%.1f", middleNum);
        
    }
    return 0;
}
