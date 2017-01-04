//
//  RankingListAdvisersCell.h
//  TRProject
//
//  Created by Yang Xiong on 26/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RankingListAdvisersCell;

@protocol RankingListAdvisersCellDelegate <NSObject>

//  通过此代理方法获得总共有多少个  items
-(NSInteger)numberOfItemInRankingListAdvisersCell:(RankingListAdvisersCell  *)rankingListAdvisersCell;

//  通过此代理方法可以获得榜单评委头像的  URL
-(NSURL  *)rankingListAdvisersCellAvatorIV:(RankingListAdvisersCell  *)rankingListAdvisersCell  iconAtIndex:(NSInteger)index;

//  通过此代理方法可以获得榜单评委的名称
-(NSString  *)rankingListAdvisersCellAdvisersName:(RankingListAdvisersCell  *)rankingListAdvisersCell  advisersNameIndex:(NSInteger)index;

//  通过刺代理方法可以获得榜单评委的主要介绍信息
-(NSString  *)rankingListAdvisersCellAdvisersInfo:(RankingListAdvisersCell  *)rankingListAdvisersCell  advisersInfoIndex:(NSInteger)index;
@end

@interface RankingListAdvisersCell : UITableViewCell<UICollectionViewDelegate,  UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout>
@property  (nonatomic)  UIImageView  *adviserNameStarLeft;
@property  (nonatomic)  UIImageView  *adviserNameStarRight;
@property  (nonatomic)  UILabel  *titleLB;


@property  (nonatomic)  UICollectionView  *collectionView;

@property  (nonatomic)  NSIndexPath  *indexPath;
// 定义组数的参数
//@property  (nonatomic)  NSInteger   sectionIndex;

//   把协议定义为一个属性
@property  (nonatomic,  weak)  id<RankingListAdvisersCellDelegate>  delegate;
@end
