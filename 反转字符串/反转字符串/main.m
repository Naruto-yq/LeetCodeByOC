//
//  main.m
//  反转字符串
//
//  Created by yuqin on 2020/5/25.
//  Copyright © 2020 yuqin. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 编写一个函数，其作用是将输入的字符串反转过来。输入字符串以字符数组 char[] 的形式给出。

 不要给另外的数组分配额外的空间，你必须原地修改输入数组、使用 O(1) 的额外空间解决这一问题。

 你可以假设数组中的所有字符都是 ASCII 码表中的可打印字符。

  

 示例 1：

 输入：["h","e","l","l","o"]
 输出：["o","l","l","e","h"]
 示例 2：

 输入：["H","a","n","n","a","h"]
 输出：["h","a","n","n","a","H"]

 */

/*
 双指针遍历char数组，实现O(n)时间复杂度，O(1)空间复杂度
 */

void reverseString(char* s, int sSize){
    int l=0,r=sSize-1;
    while (l<r) {
        char tmp = s[l];
        s[l] = s[r];
        s[r] = tmp;
        l++;
        r--;
    }
    
    for (int i=0; i<sSize; i++) {
        printf("%c\n", s[i]);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char s1[] = {'h','e','l','l','o'};
        char s2[] = {'H','a','n','n','a','h'};
        reverseString(s2, sizeof(s2));
    }
    return 0;
}
