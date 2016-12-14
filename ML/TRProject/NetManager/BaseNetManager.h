//
//  BaseNetManager.h
//  TRProject
//
//  Created by Yang Xiong on 12/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseNetManager : NSObject
+(id)getWithPath:(NSString *)path pragrameters:(NSDictionary *)pragrameters completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;
@end
