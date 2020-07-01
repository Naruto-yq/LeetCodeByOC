//
//  main.m
//  最长公共前缀
//
//  Created by yuqin on 2020/7/1.
//  Copyright © 2020 string. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString* longestCommonPrefix(NSArray* strs) {
    if (strs == nil || strs.count == 0) {
        return @"";
    }
    NSString *str0 = strs[0];
    int length = str0.length;
    int count = strs.count;
    char *cStr = (char *)[str0 cStringUsingEncoding:NSUTF8StringEncoding];
    for (int i = 0; i < length; i++) {
        char c = cStr[i];
        for (int j = 1; j < count; j++) {
            NSString *strJ = strs[j];
            char *cStrJ = (char *)[strJ cStringUsingEncoding:NSUTF8StringEncoding];
            if (i == strJ.length || cStrJ[i] != c) {
                return [str0 substringWithRange:NSMakeRange(0, i)];
            }
        }
    }
    return strs[0];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSArray *strs = @[@"leets", @"leetCode", @"leed", @"lee"];
        NSString *str =  longestCommonPrefix(strs);
        NSLog(@"");
    }
    return 0;
}
