//
//  TKViewModelProtocol.h
//  RACAndMVVM
//
//  Created by quanjunt on 2018/10/10.
//  Copyright © 2018年 quanjunt. All rights reserved.
//



// 能组合就尽量使用组合:设计思想
@protocol TKViewModelProtocol <NSObject>

@optional
- (void)bindViewModel:(UIView *)bindView;

@end
