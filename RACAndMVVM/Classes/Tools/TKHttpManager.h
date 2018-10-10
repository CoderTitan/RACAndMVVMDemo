//
//  TKHttpManager.h
//  RACAndMVVM
//
//  Created by quanjunt on 2018/10/10.
//  Copyright © 2018年 quanjunt. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TKHttpManager : NSObject



/// 封装post请求
+ (void)POST:(NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * progress))uploadProgress success:(void (^)(NSURLSessionDataTask *task , id responseObject))success failure:(void (^)(NSURLSessionDataTask *task , NSError * error))failure;

@end

NS_ASSUME_NONNULL_END
