//
//  HomeViewController.m
//  RACAndMVVM
//
//  Created by quanjunt on 2018/10/10.
//  Copyright © 2018年 quanjunt. All rights reserved.
//

#import "HomeViewController.h"
#import "ReactiveObjC.h"
#import "HomeViewModel.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) HomeViewModel *homeVM;


@end

@implementation HomeViewController

- (HomeViewModel *)homeVM {
    if (_homeVM == nil) {
        _homeVM = [[HomeViewModel alloc] init];
    }
    return _homeVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    [self.homeVM loadData];
    
    @weakify(self)
    [[self.homeVM.loadHomeDataCommand execute:nil] subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        
        // 刷新表格
        [self.tableView reloadData];
    } error:^(NSError * _Nullable error) {
        NSLog(@"%@", error);
    }];
    
    // 绑定视图模型,对控件的设置
    [self.homeVM bindViewModel:self.tableView];
}

@end
