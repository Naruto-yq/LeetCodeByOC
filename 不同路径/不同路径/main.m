//
//  main.m
//  不同路径
//
//  Created by yuqin on 2020/7/1.
//  Copyright © 2020 dp. All rights reserved.
//

#import <Foundation/Foundation.h>

int uniquePaths(int m, int n){
    int **dp = (int **)malloc(sizeof(int *) * m);
    for (int i = 0; i < m; i++) {
        dp[i] = (int *)malloc(sizeof(int) * n);
    }
    
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            if (i == 0 || j == 0) {   //  最上面一行跟最左边一列只有一种走法
                dp[i][j] = 1;
            }
            else {
                dp[i][j] = dp[i-1][j] + dp[i][j-1];
            }
        }
    }
    
    for (int i = 0; i < m; i++) {
        for (int j=0; j<n; j++) {
            
            printf("%d ", dp[i][j]);
        }
        printf("\n");
    }
    
    return dp[m-1][n-1];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"%d", uniquePaths(7, 3));
    }
    return 0;
}
