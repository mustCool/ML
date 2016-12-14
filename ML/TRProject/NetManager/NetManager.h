//
//  NetManager.h
//  TRProject
//
//  Created by Yang Xiong on 12/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetManager : BaseNetManager

#pragma mark  -m  RankingListNetworkRequest
+(id)getRankingListCompletionHandel:(void(^)(RankingListMainModel *model, NSError *error))completionHandel;

@end
