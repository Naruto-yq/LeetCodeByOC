//
//  main.m
//  有效的括号
//
//  Created by yuqin on 2020/5/25.
//  Copyright © 2020 yuqin. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 注意空字符串可被认为是有效字符串。

 示例 1:

 输入: "()"
 输出: true
 示例 2:

 输入: "()[]{}"
 输出: true
 示例 3:

 输入: "(]"
 输出: false
 示例 4:

 输入: "([)]"
 输出: false
 示例 5:

 输入: "{[]}"
 输出: true
 */

/*
 解法一：使用栈, O(n), O(n)
 */
BOOL isValidBracketsByStack(NSString *str) {
    NSDictionary *dic = @{@")":@"(",
                           @"]":@"[",
                           @"}":@"{"
                          };
    NSMutableArray *stackArray = [NSMutableArray array];
    
    for(int i =0; i < [str length]; i++) {
        if (stackArray.count == 0) {
            [stackArray addObject:[NSString stringWithFormat:@"%c", [str characterAtIndex:i]]];
        }else {
            NSString *left = dic[[NSString stringWithFormat:@"%c", [str characterAtIndex:i]]];
            if ([left isEqualToString:stackArray[0]]) {
                [stackArray removeObjectAtIndex:0];
            }else {
                [stackArray insertObject:[NSString stringWithFormat:@"%c", [str characterAtIndex:i]] atIndex:0];
            }
        }
    }
    if (stackArray.count) {
        return NO;
    }
    return YES;
}

/*
 解法一：替换法
 */

BOOL isValidBrackets(NSString *str) {
    NSMutableString *mStr = [NSMutableString stringWithString:str];
    if ([str containsString:@"()"] || [str containsString:@"[]"] || [str containsString:@"{}"]) {
        mStr = [[mStr stringByReplacingOccurrencesOfString:@"()" withString:@""] mutableCopy];
        mStr = [[mStr stringByReplacingOccurrencesOfString:@"[]" withString:@""] mutableCopy];
        mStr = [[mStr stringByReplacingOccurrencesOfString:@"{}" withString:@""] mutableCopy];
    }
    
    if (mStr.length) {
        return NO;
    }
    return YES;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *str1 = @"{[()]}";
        NSString *str2 = @"{{{{[()]}";
        if (isValidBrackets(str2)) {
            NSLog(@"有效括号");
        }else {
            NSLog(@"无效括号");
        }
    }
    return 0;
}
