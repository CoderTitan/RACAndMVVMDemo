//
//  TKNetworkManager.m
//  RACAndMVVM
//
//  Created by quanjunt on 2018/10/10.
//  Copyright © 2018年 quanjunt. All rights reserved.
//

#import "TKNetworkManager.h"
#import <CommonCrypto/CommonDigest.h>


static NSString * const salt = @"gn1002015";
@implementation TKNetworkManager


/**
 获取首页参数
 */
+ (NSDictionary *)paramWithHome {
    NSDictionary *params = @{
                             @"city":@"中国",
                             @"cityId":@0,
                             @"condition":@"35,33,32,35,34",
                             @"teacherSeach":@"1000,1000,1000"
                             };
    // 获取当前版本号
    NSString *version = [self Version];
    
    // 获取当前时间
    int liTime = [self getDateByInt];
    
    // 参数进行md5加密
    NSString *keyMd5 = [self md5ForParamas:params time:liTime];
    NSDictionary *myparamses =@{
                                @"u":@"i",
                                @"v":version,
                                @"time":@(liTime),
                                @"params":params,
                                @"key":keyMd5
                                };
    return myparamses;
}


#pragma mark - 私有方法
/// Version
+ (NSString *)Version {
    NSString *string = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
    NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:string];
    NSString *version = [dic objectForKey:@"CFBundleVersion"];
    return version;
}

/// 获取当前时间
+ (int)getDateByInt {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *date = [dateFormat dateFromString:[dateFormat stringFromDate:[NSDate date]]];
    NSTimeInterval dateInterval = [date timeIntervalSince1970];
    int liDate = (int) dateInterval;
    return liDate;
}

/// 参数md5 key值
+ (NSString *)md5ForParamas:(NSDictionary *)paramas time:(int) aiTime {
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:paramas options:NSJSONReadingAllowFragments error:nil];
    // NSJSONReadingAllowFragments : 使用这个
    // NSJSONWritingPrettyPrinted 会有\n，不需要
    NSString *jsonParserString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    
    NSString *myString = [NSString stringWithFormat:@"%@%d%@",jsonParserString,aiTime, salt];
    
    NSString *keyMD5 = [self getMd5_32Bit_String:myString];
    NSString *keymd5 = [self getMd5_32Bit_String:keyMD5];
    
    
    return keymd5;
}

///  MD5
+ (NSString *)getMd5_32Bit_String:(NSString *)srcString {
    const char *cStr = [srcString UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest );
    
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    
    return result;
}

@end
