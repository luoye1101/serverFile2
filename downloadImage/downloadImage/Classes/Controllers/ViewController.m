//
//  ViewController.m
//  downloadImage
//
//  Created by 黄跃奇 on 16/8/22.
//  Copyright © 2016年 itheima. All rights reserved.
//  https://raw.githubusercontent.com/luoye1101/serverFile2/master/apps.json

#import "ViewController.h"
#import "AFNetworking.h"
#import "AppModel.h"

@interface ViewController () <UITableViewDataSource>

@end

@implementation ViewController {
    
    //定义数据源数组
    NSArray *_appList;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadJsonData];
    
}

#pragma mark - TableView的数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _appList.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"appsCell" forIndexPath:indexPath];
    
    AppModel *app = _appList[indexPath.row];
    
    cell.textLabel.text = app.name;
    cell.detailTextLabel.text = app.download;
    
    return cell;
    
}


#pragma mark - 加载Json数据
- (void)loadJsonData {
    
    //1. 创建网络请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 获取Json数据地址
    NSString *URLString = @"https://raw.githubusercontent.com/luoye1101/serverFile2/master/apps.json";
    
    //2. 管理者发送网络请求
    [manager GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray *responseObject) {
        
//        NSLog(@"%@", responseObject);
        
        //定义临时可变数组，要改泛型才能 responseObject.count
        NSMutableArray *tempM = [NSMutableArray arrayWithCapacity:responseObject.count];
        
        [responseObject enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            AppModel *app = [[AppModel alloc] init];
            
            [app setValuesForKeysWithDictionary:obj];
            
            [tempM addObject:app];
            
        }];
        
        _appList = tempM.copy;
        
        NSLog(@"%@",_appList);
        
        //刷新列表
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        
    }];
    
}

@end
















