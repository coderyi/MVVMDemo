//
//  TableViewModel.m
//  MVVMDemo
//
//  Created by coderyi on 15/6/28.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "TableViewModel.h"
#import "CustomModel.h"
@interface TableViewModel ()

@end

@implementation TableViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)headerRefreshRequestWithCallback:(callback)callback
{
        //  后台执行：
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            sleep(2);
            dispatch_async(dispatch_get_main_queue(), ^{
                //               主线程刷新视图
                NSMutableArray *arr=[NSMutableArray array];
                for (int i=0; i<16; i++) {
                    int x = arc4random() % 100;
                    NSString *string=[NSString stringWithFormat:@"    (random%d) 君子性非异也，善假于物也！",x];
                    CustomModel *model=[[CustomModel alloc] init];
                    model.title=string;
                    [arr addObject:model];
                }
                callback(arr);
            });
        });
}

- (void )footerRefreshRequestWithCallback:(callback)callback
{
        //  后台执行：
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            sleep(2);
            dispatch_async(dispatch_get_main_queue(), ^{
                //               主线程刷新视图
                NSMutableArray *arr=[NSMutableArray array];
                for (int i=0; i<16; i++) {
                    int x = arc4random() % 100;
                    NSString *string=[NSString stringWithFormat:@"    (random%d) 君子性非异也，善假于物也！",x];
                    CustomModel *model=[[CustomModel alloc] init];
                    model.title=string;
                    [arr addObject:model];
                }
                callback(arr);
            });
        });
}

@end
