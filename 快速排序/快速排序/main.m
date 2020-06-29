//
//  main.m
//  快速排序
//
//  Created by yuqin on 2020/6/29.
//  Copyright © 2020 Sort. All rights reserved.
//

#import <Foundation/Foundation.h>

void quickSort(int arr[], int left,int right){
    int i,j,key,temp;
    if(left>right){
        return;
    }
    key = arr[left];
    i = left;
    j = right;
    
    while(i!=j){
        
        while(arr[j]>=key && i<j){
            j--;
        }
        
        while(arr[i]<=key && i<j){
            i++;
        }
        
        if(i!=j){
            temp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
        }
        
        for(int index = 0; index < 7; index++)
            printf("%d ", arr[index]);
        printf("\n");
    }
    arr[left] = arr[i];
    arr[i] = key;
   
    quickSort(arr, left,i-1);
    quickSort(arr, i+1,right);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int i;
        int arr[10] = {49, 38, 65, 97, 76, 13, 27};

        for(i = 0; i < 7; i++)
            printf("%d ", arr[i]);
        printf("\n");

        quickSort(arr, 0, 6);

        for(i = 0; i < 7; i++)
            printf("%d ", arr[i]);
        printf("\n");
    }
    return 0;
}


