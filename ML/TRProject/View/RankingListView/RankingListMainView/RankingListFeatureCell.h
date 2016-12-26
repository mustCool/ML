//
//  RankingListFeatureCell.h
//  TRProject
//
//  Created by Yang Xiong on 22/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RankingListFeatureCell;

@protocol RankingListFeatureCelllDelegate <NSObject>
// 通过此代理方法可以获取到这个 collectionView 中有多少个 item
-(NSInteger)numberOfItemInRankingListFeatureCell:(RankingListFeatureCell  *)rankingListFeatureCell;

// 通过此代理方法可以获取 imageIV 的 url
- (NSURL  *)rankingListFeatureCellImageIV:(RankingListFeatureCell *)rankingListFeatureCell iconAtIndex:(NSInteger)index;

// 通过此代理方法可以获取 topLevel 的图片名称
- (NSString  *)rankingListFeatureCellTopLevel:(RankingListFeatureCell *)rankingListFeatureCell topLevelIndex:(NSInteger)index;

// 通过此代理方法可以获取 topText 的 url
- (NSString  *)rankingListFeatureCellTopText:(RankingListFeatureCell *)rankingListFeatureCell topTextIndex:(NSInteger)index;
@end


@interface RankingListFeatureCell : UITableViewCell<UICollectionViewDelegate,  UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout>
@property (nonatomic)  UICollectionView  *collectionView;

@property (nonatomic)  NSIndexPath  *indexPath;
@property (nonatomic)  NSInteger  sectionIndex;

@property (nonatomic,  weak)  id<RankingListFeatureCelllDelegate>  delegate;


@property (nonatomic) UIButton  *featureIV;
@property (nonatomic) UIImageView  *littleTriangle;
@end
