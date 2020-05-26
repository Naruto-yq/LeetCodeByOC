//
//  main.m
//  螺旋矩阵
//
//  Created by yuqin on 2020/5/26.
//  Copyright © 2020 yuqin. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 给定一个包含 m x n 个元素的矩阵（m 行, n 列），请按照顺时针螺旋顺序，返回矩阵中的所有元素。

 示例 1:

 输入:
 [
  [ 1, 2, 3 ],
  [ 4, 5, 6 ],
  [ 7, 8, 9 ]
 ]
 输出: [1,2,3,6,9,8,7,4,5]
 示例 2:

 输入:
 [
   [1, 2, 3, 4],
   [5, 6, 7, 8],
   [9,10,11,12]
 ]
 输出: [1,2,3,4,8,12,11,10,9,5,6,7]
 */

NSArray* spiralOrder(NSArray* matrix) {
    if (matrix == nil || matrix.count < 1) {
        return nil;
    }
    
    NSMutableArray *resultArray = [NSMutableArray array];
    
    int dir = 1;
    int row = 0,col = 0;
    NSArray *firstRowArray = matrix[0];
    int left = 0, right = firstRowArray.count-1, bottom = matrix.count-1, top = 0;
    
    while (left <= right && top <= bottom) {
        [resultArray addObject:matrix[row][col]];
        switch (dir) {
                
            case 1:
            {
                if (col == right) {
                    dir = 2;
                    top++;
                    row++;
                    continue;
                }
                col++;
                break;
            }
                
            case 2:
            {
                if (row == bottom) {
                    dir = 3;
                    right--;
                    col--;
                    continue;
                }
                row++;
                break;
            }
                
            case 3:
            {
                if (col == left) {
                    dir = 4;
                    bottom--;
                    row--;
                    continue;
                }
                col--;
                break;
            }
                
            case 4:
            {
                if (row == top) {
                    dir = 1;
                    left++;
                    col++;
                    continue;
                }
                row--;
                break;
            }
                
            default:
                break;
        }
    }
    
    return resultArray;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *matrix =  @[
                             @[ @1, @2, @3 ],
                             @[ @4, @5, @6 ],
                             @[ @7, @8, @9 ]
                            ];
        
        NSArray *resultArr = spiralOrder(matrix);
        
        NSLog(@"%@", [resultArr description]);
    }
    return 0;
}
