//
//  HomeViewModel.m
//  RACAndMVVM
//
//  Created by quanjunt on 2018/10/10.
//  Copyright © 2018年 quanjunt. All rights reserved.
//

#import "HomeViewModel.h"
#import "MJExtension.h"
#import "HomeModel.h"
#import "TKHttpManager.h"
#import "TKNetworkManager.h"
#import "HomeCellViewModel.h"
#import "HomeTableViewCell.h"


#define homeUrl @"https://www.yunke.com/interface/main/home"

@interface HomeViewModel ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *CellVMArr;

@end
@implementation HomeViewModel

- (RACCommand *)loadHomeDataCommand {
    if (_loadHomeDataCommand == nil) {
        // 请求数据
        @weakify(self)
        _loadHomeDataCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                // 发送请求
                @strongify(self)
                NSDictionary *params = [TKNetworkManager paramWithHome];
                [TKHttpManager POST:homeUrl parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                    // 数据处理
                    NSDictionary *result = responseObject[@"result"];
                    NSDictionary *recommendsDict = result[@"recommends"];
                    
                    NSArray *recommends;
                    // 字段转模型
                    recommends = [HomeModel mj_objectArrayWithKeyValuesArray:recommendsDict[@"courses"]];
                    
                    // 模型转视图模型
                    self.CellVMArr = [[recommends.rac_sequence map:^id _Nullable(id  _Nullable value) {
                        // 创建cell视图模型
                        HomeCellViewModel *cellVM = [[HomeCellViewModel alloc]init];
                        cellVM.model = value;
                        return cellVM;
                    }] array];
                    
                    // 请求成功
                    [subscriber sendNext:recommends];
                    [subscriber sendCompleted];
                } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                    [subscriber sendError:error];
                }];
                
                return nil;
            }];
        }];
    }
    
    return _loadHomeDataCommand;
}


#pragma mark - UITableView数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.CellVMArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    // 视图模型
    HomeCellViewModel *cellVM = self.CellVMArr[indexPath.row];
    
    // 绑定视图模型
    [cellVM bindViewModel:cell];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

#pragma mark - 视图模型绑定
- (void)bindViewModel:(UIView *)bindView {
    UITableView *tableView = (UITableView *)bindView;
    // 注册
    [tableView registerNib:[UINib nibWithNibName:@"HomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    tableView.delegate = self;
    tableView.dataSource = self;
}
@end
