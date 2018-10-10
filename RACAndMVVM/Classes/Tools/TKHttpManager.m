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



/// 封装post请求
+ (void)POST:(NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * progress))uploadProgress success:(void (^)(NSURLSessionDataTask *task , id responseObject))success failure:(void (^)(NSURLSessionDataTask *task , NSError * error))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 自定义请求, 为JSON格式
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    // 自定义响应
    AFHTTPResponseSerializer *response = [AFHTTPResponseSerializer serializer];
    
    response.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    
    manager.responseSerializer = response;
    
    [manager POST:URLString parameters:parameters progress:nil success:success failure:failure];
}




@end
