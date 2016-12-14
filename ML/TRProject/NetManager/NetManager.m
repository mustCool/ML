//
//  NetManager.m
//  TRProject
//
//  Created by Yang Xiong on 12/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager

#pragma mark   -m  RankingListNetworkRequest
+(id)getRankingListCompletionHandel:(void (^)(RankingListMainModel *, NSError *))completionHandel
{
    return  [self  getWithPath:kRankingListModelPath pragrameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandel  ?:  completionHandel ([RankingListMainModel  parse:responseObj],  error);
    }];
}
@end
