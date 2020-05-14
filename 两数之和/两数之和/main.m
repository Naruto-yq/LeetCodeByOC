//
//  main.m
//  两数之和
//
//  Created by yuqin on 2020/5/14.
//  Copyright © 2020 yuqin. All rights reserved.
//

#import <Foundation/Foundation.h>

//给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
//
//你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。
//示例:
//
//给定 nums = [2, 7, 11, 15], target = 9
//
//因为 nums[0] + nums[1] = 2 + 7 = 9
//所以返回 [0, 1]


NSArray* twoNumSum(NSArray *array, int target) {
    if (!array || ![array isKindOfClass:[NSArray class]] || !array.count) {
        return nil;
    }
    
    int index1 = 0, index2 = 0;
    for (int i=0; i<array.count; i++) {
        if ([array[i] intValue] >= target) {
            return nil;
        }
        int num = target - [array[i] intValue];
        index1 = i;
        if (i == array.count-1) {
            return nil;
        }
        for (int j=i+1; j<array.count; j++) {
            if (num == [array[j] intValue]) {
                index2 = j;
                break;
            }
        }
        if (index2 > index1) {
            break;
        }
    }
    
    if (index2 > index1) {
        return @[@(index1), @(index2)];
    }
    return nil;
}

NSArray* twoNumSumWithDic(NSArray *array, int target) {
    if (!array || ![array isKindOfClass:[NSArray class]] || !array.count) {
        return nil;
    }
    
    NSMutableDictionary *mDic = [NSMutableDictionary dictionary];
    for (int i=0; i<array.count; i++) {
        [mDic setValue:@(i) forKey:[array[i] stringValue]];
    }
    
    for (int i=0; i<array.count; i++) {
        int num = target - [array[i] intValue];
        if (i == array.count-1) {
            return nil;
        }
        NSNumber *index2 = [mDic valueForKey:[NSString stringWithFormat:@"%d", num]];
        if (index2 && [index2 intValue] > i) {
            return @[@(i), index2];
        }
    }
    
    return nil;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSArray *array = @[@2, @7, @11, @15, @20];
        NSLog(@"%@", twoNumSumWithDic(array, 9));
    }
    return 0;
}

