//
//  NSString+YX.m
//  TRProject
//
//  Created by Yang Xiong on 12/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import "NSString+YX.h"

@implementation NSString (YX)
-(NSURL *)yx_URL
{
    return [NSURL  URLWithString:self];
}
@end
