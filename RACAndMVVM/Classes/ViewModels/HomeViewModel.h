//
//  HomeViewModel.h
//  RACAndMVVM
//
//  Created by quanjunt on 2018/10/10.
//  Copyright © 2018年 quanjunt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactiveObjC.h"
#import "TKViewModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewModel : NSObject<TKViewModelProtocol>

{
    RACCommand *_loadHomeDataCommand;
}

@property (nonatomic, strong, readonly) RACCommand *loadHomeDataCommand;


- (void)loadData;
@end

NS_ASSUME_NONNULL_END
