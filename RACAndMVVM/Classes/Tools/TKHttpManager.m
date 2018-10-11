//
//  TKHttpManager.m
//  RACAndMVVM
//
//  Created by quanjunt on 2018/10/10.
//  Copyright © 2018年 quanjunt. All rights reserved.
//

#import "TKHttpManager.h"
#import "AFNetworking.h"


@implementation TKHttpManager


+ (void)POST:(NSString *)URLString parameters:(id)parameters success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nonnull))success failure:(void (^)(NSURLSessionDataTask * _Nonnull, NSError * _Nonnull))failure {
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    // 自定义请求，为JSON格式
    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    
    // 自定义响应
    AFHTTPResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];
    
    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    
    mgr.responseSerializer = responseSerializer;
    
    [mgr POST:URLString parameters:parameters progress:nil success:success failure:failure];
}





@end
