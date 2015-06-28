//
//  TableViewController.m
//  YiRefresh
//
//  Created by coderyi on 15/3/5.
//  Copyright (c) 2015年 coderyi. All rights reserved.
//

#import "TableViewController.h"
#import "YiRefreshHeader.h"
#import "YiRefreshFooter.h"
#import "TableViewModel.h"
#import "TableViewDataSource.h"
#import "TableViewDelegate.h"
@interface TableViewController (){

    YiRefreshHeader *refreshHeader;
    YiRefreshFooter *refreshFooter;
    NSMutableArray *totalSource;
    TableViewModel *tableViewModel;
    UITableView *tableView;
    TableViewDataSource *tableViewDataSource;
    TableViewDelegate *tableViewDelegate;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (iOS7) {
        self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
        
    }
    self.title=@"MVVMDemo With TableView";
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, WScreen, HScreen-64) style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableViewDataSource=[[TableViewDataSource alloc] init];
    tableViewDelegate=[[TableViewDelegate alloc] init];
    tableView.dataSource=tableViewDataSource;
    tableView.delegate=tableViewDelegate;
    tableViewModel=[[TableViewModel alloc] init];
    totalSource=0;
    
    
//    YiRefreshHeader  头部刷新按钮的使用
    refreshHeader=[[YiRefreshHeader alloc] init];
    refreshHeader.scrollView=tableView;
    [refreshHeader header];
    __weak typeof(self) mySelf = self;
    refreshHeader.beginRefreshingBlock=^(){

     
          [mySelf headerRefreshAction];
       
    };
    
//    是否在进入该界面的时候就开始进入刷新状态
    
    [refreshHeader beginRefreshing];
    
    
    
    
    
    
    
    
//    YiRefreshFooter  底部刷新按钮的使用
    
    refreshFooter=[[YiRefreshFooter alloc] init];
    refreshFooter.scrollView=tableView;
    [refreshFooter footer];
    
    refreshFooter.beginRefreshingBlock=^(){
        [mySelf footerRefreshAction];
    };

   
    
}

- (void)headerRefreshAction
{
   
    [tableViewModel headerRefreshRequestWithCallback:^(NSArray *array){
        
        totalSource=array;
        tableViewDataSource.array=totalSource;
        tableViewDelegate.array=totalSource;
        
        [refreshHeader endRefreshing];
        [tableView reloadData];
    }];
    
    

}

- (void)footerRefreshAction
{
    
    [tableViewModel footerRefreshRequestWithCallback:^(NSArray *array){
        [totalSource addObjectsFromArray:array] ;
        tableViewDataSource.array=totalSource;
        tableViewDelegate.array=totalSource;

        [refreshFooter endRefreshing];
        [tableView reloadData];
    
    }];
    
    
    
  
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
