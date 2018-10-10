//
//  HomeCellViewModel.h
//  RACAndMVVM
//
//  Created by quanjunt on 2018/10/10.
//  Copyright © 2018年 quanjunt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TKViewModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

// 处理Cell的显示和业务逻辑处理
@class HomeModel;
@interface HomeCellViewModel : NSObject <TKViewModelProtocol>

@property (nonatomic, strong) HomeModel *model;

@end

NS_ASSUME_NONNULL_END
