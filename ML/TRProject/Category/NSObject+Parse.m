//
//  NSObject+Parse.m
//  TRProject
//
//  Created by Yang Xiong on 12/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import "NSObject+Parse.h"

@implementation NSObject (Parse)
+(id)parse:(id)JSON
{
    if ([JSON isKindOfClass:[NSDictionary class]])
    {
        return [self modelWithJSON:JSON];
    }
    if ([JSON isKindOfClass:[NSArray class]])
    {
        return [NSArray modelArrayWithClass:[self class] json:JSON];
    }
    return JSON;
}
@end
