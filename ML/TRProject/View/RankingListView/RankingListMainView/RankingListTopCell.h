//
//  RankingListTopCell.h
//  TRProject
//
//  Created by Yang Xiong on 22/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RankingListFeatureCell;

@protocol RankingListTopCellDelegate <NSObject>
// 通过此代理方法可以获取到这个 collectionView 中有多少个 item
-(NSInteger)numberOfItemInRankingListTopCell:(RankingListFeatureCell  *)rankingListTopCell;

// 通过此代理方法可以获取 imageIV 的 url
- (NSURL  *)rankinglistTopCellImageIV:(RankingListFeatureCell *)rankingListTopCell iconAtIndex:(NSInteger)index;

// 通过此代理方法可以获取 topLevel 的图片名称
- (UIImage  *)rankinglistTopCellTopLevel:(RankingListFeatureCell *)rankingListTopCell topLevelIndex:(NSInteger)index;

// 通过此代理方法可以获取 topText 的 url
- (NSString  *)rankinglistTopCellTopText:(RankingListFeatureCell *)rankingListTopCell topTextIndex:(NSInteger)index;
@end


@interface RankingListTopCell : UITableViewCell <UICollectionViewDelegate,  UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout>
@property (nonatomic)  UICollectionView  *collectionView;

@property (nonatomic)  NSIndexPath  *indexPath;

@property (nonatomic,  weak)  id<RankingListTopCellDelegate>  delegate;


@end
