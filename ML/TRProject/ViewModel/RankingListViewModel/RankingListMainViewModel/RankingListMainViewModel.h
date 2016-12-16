//
//  RankingListMainViewModel.h
//  TRProject
//
//  Created by tarena15 on 2016/12/15.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef   NS_ENUM(NSUInteger,  RequestMode)
{
    RequestModeRefresh,
    RequestModeMore,
};

@interface RankingListMainViewModel : NSObject
-(NSArray *)topButton;

@property (nonatomic) NSMutableArray<RankingListMainModel *>   *dataList;
@property (nonatomic) NSInteger pages;

-(void)getDataWithRequestMode:(RequestMode)requestMode  completionHandler:(void(^)(NSError  *error))completionHandler;
@end
