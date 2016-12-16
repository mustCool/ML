//
//  RankingListMainViewModel.m
//  TRProject
//
//  Created by tarena15 on 2016/12/15.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "RankingListMainViewModel.h"

@implementation RankingListMainViewModel
-(NSMutableArray<RankingListMainModel *> *)dataList
{
    if (!_dataList)
    {
        _dataList   =  [NSMutableArray  new];
    }
    return _dataList;
}

-(void)getDataWithRequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler
{
    NSInteger  tmpPages  =  1;
    if (requestMode  ==  RequestModeMore)
    {
        tmpPages  =  _pages  +  1;
    }
    [NetManager  getRankingListCompletionHandel:^(RankingListMainModel *model, NSError *error) {
        if (requestMode  ==  RequestModeRefresh)
        {
            [self.dataList removeAllObjects];
        }
        [self.dataList   addObjectsFromArray:model];
    
    }];
}

//-(NSArray *)topButton
//{
//    
//}
@end
