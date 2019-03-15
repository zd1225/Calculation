//
//  ViewController.m
//  TestDemo
//
//  Created by 赵丹 on 2019/3/14.
//  Copyright © 2019 赵丹. All rights reserved.
//

#import "ViewController.h"
#include <stdio.h>
#include "math.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //从数组中找出唯一重复出现两次的数字
    int a[] = {100,121,4433,10000,121,10};
    int find = findRepeatedNumber(a);
    printf("hash:%d\n",find);

    
    //按倒序合并两个排序后的数组
    int a1[] = {1,2,3,4,5};
    int b1[] = {2,3,4,5,6,7};
    int x = sizeof(a1)/sizeof(a1[0]);
    int y = sizeof(b1)/sizeof(b1[0]);
    int N = (sizeof(a1)/sizeof(a1[0])) + (sizeof(b1)/sizeof(b1[0]));
    reverMergeSortArray1(a1,b1,x,y,N);
    [self reverMergeSortArray];
}


//哈希查找,时间复杂度为:O(n),比较耗内存，哈希表的最大长度可能达到数组元素的最大值
int findRepeatedNumber(int a[])
{
    int hash[10001] = {};
    int x= 0;
    for (int i = 0; i < 1001; i++) {
        if ((++hash[a[i]])== 2) {
            x = a[i];
            break;
        }
    }
    return x;
}

//直接查找相等的两个数，时间复杂度为:O(n^2)
int findRepeatedNumber1 (int* num, int start, int end)
{
    int size = end - start + 1;
    int i = 0;
    int j = 0;
    
    if (size <= 1) {
        return -1;
    }
    for(i = 0; i < size; i++){
        for(j = i+1; j < size; j++){
            if(num[i] == num[j])
            printf("%d\n", num[i]);
            return num[i];
        }
    }
    return -1;
}

//OC实现归并排序
- (void)reverMergeSortArray {
    
    NSMutableArray *arrA = [NSMutableArray arrayWithArray:@[@1,@2,@3,@4,@5]];
    NSMutableArray *arrB = [NSMutableArray arrayWithArray:@[@2,@3,@4,@5,@6,@7]];
    NSMutableArray *marr = [NSMutableArray array];
    
    
        while (arrA.count > 0 && arrB.count > 0) {
            
            int a = [arrA.firstObject intValue];
            int b = [arrB.firstObject intValue];
            if ([arrA.firstObject integerValue] < [arrB.firstObject integerValue])
            {
                marr&&marr.count>0 ?
                [marr insertObject:arrA.firstObject atIndex:0]:
                [marr addObject:[NSNumber numberWithInteger:a]];
                
                [arrA removeObject:[NSNumber numberWithInteger:a]];
                
            }else
            {
                marr&&marr.count>0 ?
                [marr insertObject:[NSNumber numberWithInteger:b] atIndex:0]:
                [marr addObject:[NSNumber numberWithInteger:b]];
                
                [arrB removeObject:[NSNumber numberWithInteger:b]];
                
            }
            
        }
       
        
        while (arrA.count != 0 ) {
            
            [marr insertObject:arrA.firstObject atIndex:0];
            [arrA removeObjectAtIndex:0];
        }
        while (arrB.count != 0) {
            
            [marr insertObject:arrB.firstObject atIndex:0];
            [arrB removeObjectAtIndex:0];

        }
    NSLog(@"%@",marr);
}

//C语言方式实现归并算法
int* reverMergeSortArray1 (int a[],int b[],int x, int y, int N)
{
    int * pa , * pb, * pc;
    int * pa_last,* pb_last;
    int add[100] = {};

    pa = &a[0]; pb = &b[0];pc = add + N -1;
    pa_last = pa + x - 1;
    pb_last = pb + y - 1;

    while (pa < pa_last && pb < pb_last) {
        if ((* pa) <= (* pb)) {
            *pc-- = *pa++;
        }else{
            *pc-- = *pb++;
        }
    }
    while (pa <= pa_last) {
        *pc-- = *pa++;
    }
    while (pb <= pb_last) {
        *pc-- = *pb++;
    }
    for (int i = 0; i < N; i++) {
        printf("%d\n",add[i]);
    }
    return pc;
}

@end
