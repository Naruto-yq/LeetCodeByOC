//
//  main.m
//  最长回文
//
//  Created by yuqin on 2020/5/14.
//  Copyright © 2020 yuqin. All rights reserved.
//

#import <Foundation/Foundation.h>

//给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。
//
//示例 1：
//
//输入: "babad"
//输出: "bab"
//注意: "aba" 也是一个有效答案。
//示例 2：
//
//输入: "cbbd"
//输出: "bb"

/*
中心扩展算法
事实上，只需使用恒定的空间，我们就可以在 O(n^2)O(n
2
 ) 的时间内解决这个问题。

我们观察到回文中心的两侧互为镜像。因此，回文可以从它的中心展开，并且只有 2n - 12n−1 个这样的中心。

你可能会问，为什么会是 2n - 12n−1 个，而不是 nn 个中心？原因在于所含字母数为偶数的回文的中心可以处于两字母之间（例如 \textrm{“abba”}“abba” 的中心在两个 \textrm{‘b’}‘b’ 之间）
 
 先来解释一下为什么中心是2n-1而不是n 比如有字符串abcba，这时回文子串是abcda，中心是c；又有字符串adccda，这时回文子串是adccda，中心是cc。 由此可见中心点既有可能是一个字符，也有可能是两个字符，当中心为一个字符的时候有n个中心，当中心为两个字符的时候有n-1个中心，所以一共有2n-1个中心。 然后for循环开始从左到右遍历，为什么会有两次expandAroundCenter，一次是i和i本身，一次是i和i+1，这就是上面说到的一个中心与两个中心。 而后会去判断这两种情况下谁的回文子串最长，并标记出这个子串在原字符串中的定位，即start和end
*/

int expandAroundCenter(NSString *str, int left, int right) {
    int L = left, R = right;
    char *cStr = (char *)[str cStringUsingEncoding:NSUTF8StringEncoding];
    while (L>=0 && R<str.length && cStr[L] == cStr[R]) {
        L--;
        R++;
    }
    
    return R-L-1;
}

NSString* longestPalindrome(NSString *str ) {
    if (!str || !str.length) {
        return nil;
    }
    int start = 0, end = 0;
    for (int i=0; i<str.length; i++) {
        int len1 = expandAroundCenter(str, i, i);
        int len2 = expandAroundCenter(str, i, i+1);
        
        int len = MAX(len1, len2);
        if (len > (end-start+1)) {
            start = i - (len - 1) / 2;
            end = i + len / 2;
        }
//        if (len > (str.length/2 -1)) {
//            break;
//        }
    }
    
    return [str substringWithRange:NSMakeRange(start, (end-start+1))];
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *palindromeStr = longestPalindrome(@"babac");
        NSLog(@"%@", palindromeStr);
    }
    return 0;
}
