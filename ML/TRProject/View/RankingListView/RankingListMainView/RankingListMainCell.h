//
//  RankingListMainCell.h
//  TRProject
//
//  Created by tarena15 on 2016/12/15.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RankingListMainCell;

@protocol RankingListMainCellDelegate <NSObject>
// 通过此代理方法得到有多少个按钮
- (NSInteger)numberOfItemInRankingListMainCell:(RankingListMainCell  *)rankingListMainCell;

// 通过此代理方法可以得到每个按钮的背景图片网络地址是什么？
- (NSURL  *)rankinglistMainCell:(RankingListMainCell *)rankingListMainCell iconAtIndex:(NSInteger)index;
@end

@interface RankingListMainCell : UITableViewCell <UICollectionViewDelegate,  UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout>
@property (nonatomic) NSArray<UIButton *>  *topButton;


@property (nonatomic) UICollectionView  *collecitonView;
@property (nonatomic) UIPageControl  *pc;
@property (nonatomic) NSIndexPath  *indexPath;

@property (nonatomic) UILabel  *totalDes;



// 把代理协议属性化
@property(nonatomic,  weak)  id<RankingListMainCellDelegate>  delegate;
@end
