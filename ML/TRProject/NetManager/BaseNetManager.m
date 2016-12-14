//
//  BaseNetManager.m
//  TRProject
//
//  Created by Yang Xiong on 12/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import "BaseNetManager.h"

@implementation BaseNetManager
+(id)getWithPath:(NSString *)path pragrameters:(NSDictionary *)pragrameters completionHandler:(void (^)(id, NSError *))completionHandler
{
    AFHTTPSessionManager  *manager  =  [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes  =  [NSSet setWithObjects:@"text/html", @"text/plain",@"text/javascript",@"text/json",@"application/json",nil];
    return [manager GET:path parameters:pragrameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        !completionHandler  ?:  completionHandler(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        !completionHandler  ?:  completionHandler(nil, error);
    }];
}
@end
