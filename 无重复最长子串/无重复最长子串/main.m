//
//  main.m
//  无重复最长子串
//
//  Created by yuqin on 2020/5/14.
//  Copyright © 2020 yuqin. All rights reserved.
//

#import <Foundation/Foundation.h>

void longestSubString(NSString *str) {
    if (!str || !str.length) {
        return;
    }

    int len = 1;
    char *cStr = (char *)[str cStringUsingEncoding:NSUTF8StringEncoding];

    int start = 0;
    int end = start+1;
    while (start < str.length && end < str.length) {
        NSString *subStr = [str substringWithRange:NSMakeRange(start, end-start)];
        if ([subStr containsString:[NSString stringWithFormat:@"%c",cStr[end]]]) {
            len = MAX(len, end-start);
            start++;
            end = start+1;
        }else {
            end++;
            len = MAX(len, end-start);
        }
    }
    NSLog(@"%d", len);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        longestSubString(@"bbaecdd");
    }
    return 0;
}
