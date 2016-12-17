//
//  RankingListMainViewModel.m
//  TRProject
//
//  Created by tarena15 on 2016/12/15.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "RankingListMainViewModel.h"

@implementation RankingListMainViewModel
-(RankingListMainModel *)dataList
{
    if (!_dataList)
    {
        _dataList   =  [RankingListMainModel  new];
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
        self.dataList  =  model;
    }];
}

-(NSArray *)topButton
{
    NSMutableArray  *tmpArr  =  [NSMutableArray  new];
    for (NSInteger  i  =  0; i  <  2; i  ++)
    {
        NSURL  *url  =  [NSString stringWithFormat: kRanKingListPath,  self.dataList.data.top.custom[i].img.img].yx_URL;
        [tmpArr  addObject:url];
    }
    
    return tmpArr.copy;
}
@end
