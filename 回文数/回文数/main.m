//
//  main.m
//  回文数
//
//  Created by yuqin on 2020/5/25.
//  Copyright © 2020 yuqin. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。

 示例 1:
 输入: 121
 输出: true
 
 示例 2:
 输入: -121
 输出: false
 解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
 
 示例 3:
 输入: 10
 输出: false
 解释: 从右向左读, 为 01 。因此它不是一个回文数。
 进阶:

 你能不将整数转为字符串来解决这个问题吗？
 */

/*
 解法一：转为字符串，两个指针从头和从尾开始遍历，不写了
 */

/*
解法二：每次都比较第一个数字和最后一个数字，在去掉第一个数字和最后一个数字
*/
BOOL isPalindrome(int x){
    if (x < 0 || x >= INT_MAX) {
        return NO;
    }
    
    int digit = 1;
    int tmp = x;
    while (tmp >= 10) {
        digit *= 10;
        tmp /= 10;
    }
    
    while (x != 0) {
        if (x%10 != x/digit) {
            return NO;
        }
        
        x = (x%digit)/10;
        digit /= 100;
    }
    
    return YES;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        if (isPalindrome(1000021)) {
            NSLog(@"是回文数");
        }else {
            NSLog(@"不是回文数");
        }
    }
    return 0;
}
