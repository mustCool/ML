//
//  RankingListAdvisersCell.m
//  TRProject
//
//  Created by Yang Xiong on 26/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import "RankingListAdvisersCell.h"

@implementation RankingListAdvisersCell

-(UILabel *)titleLB
{
    if (!_titleLB)
    {
        _titleLB  =  [UILabel  new];
        [self.contentView  addSubview:_titleLB];
        [_titleLB  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(kHight  *  (20.f  /  1132.f));
            make.width.equalTo(kWidth  *  (125.f  /  640.f));
            make.height.equalTo(kHight  *  (60.f  /  1132.f));
        }];
        _titleLB.font  =  [UIFont  systemFontOfSize:18.f];
    }
    return _titleLB;
}

-(UIImageView *)adviserNameStarLeft
{
    if (!_adviserNameStarLeft)
    {
        _adviserNameStarLeft  =  [UIImageView  new];
        [self.contentView  addSubview:_adviserNameStarLeft];
        [_adviserNameStarLeft  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(kWidth  *  (30.f  /  640.f));
            make.height.equalTo(kHight  *  (30.f  /  1132.f));
            make.centerY.equalTo(self.titleLB);
            make.left.equalTo(kWidth  *  (225.f  /  640.f));
        }];
    }
    return _adviserNameStarLeft;
}

-(UIImageView *)adviserNameStarRight
{
    if (!_adviserNameStarRight)
    {
        _adviserNameStarRight  =  [UIImageView  new];
        [self.contentView  addSubview:_adviserNameStarRight];
        [_adviserNameStarRight  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(self.adviserNameStarLeft);
            make.centerY.equalTo(self.titleLB);
            make.right.equalTo(-(kWidth  *  (240.f  /  640.f)));
        }];
    }
    return _adviserNameStarRight;
}


-(UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        UICollectionViewFlowLayout  *layout  =  [UICollectionViewFlowLayout  new];
        layout.sectionInset  =  UIEdgeInsetsMake(0.f, 0.f, 0.f, 50.f);
        layout.minimumLineSpacing  =  20.f;
        layout.minimumInteritemSpacing  =  20.f;
        
//        CGFloat  w  =  kWidth  *  (145.f  /  640.f);
//        CGFloat  h  =  kHight  *  (200.f  /  1132.f);
        
        CGFloat  w  =  ([UIScreen  mainScreen].bounds.size.width  -  (2  *  20.f +  2  * 50.f))  /  3.f;
        CGFloat  h  =  w  +  50;
        
        layout.itemSize  =  CGSizeMake(w, h);
//        layout.scrollDirection  =  UICollectionViewScrollDirectionHorizontal;
    
        
        _collectionView  =  [[UICollectionView  alloc] initWithFrame:CGRectMake(0.f,  kHight  *  (102.f  /  1132.f), kWidth, kHight  *  (500.f  /  1132.f)) collectionViewLayout:layout];
        
        
        [_collectionView  registerClass:[RankingListAdvisersViewCell  class] forCellWithReuseIdentifier:@"rankingListAdvisersViewCell"];
        
        _collectionView.scrollEnabled  =  YES;
        
        _collectionView.delegate  =  self;
        _collectionView.dataSource  =  self;
        
        _collectionView.backgroundColor  =  [UIColor  whiteColor];
        
        [self.contentView  addSubview:_collectionView];
    }
    
    return _collectionView;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.delegate  numberOfItemInRankingListAdvisersCell:self];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    RankingListAdvisersViewCell  *cell  =  [collectionView  dequeueReusableCellWithReuseIdentifier:@"rankingListAdvisersViewCell" forIndexPath:indexPath];
    [cell.avatorIV  setImageURL:[self.delegate  rankingListAdvisersCellAvatorIV:self iconAtIndex:indexPath.row]];
    cell.adviserName.text  =  [self.delegate  rankingListAdvisersCellAdvisersName:self advisersNameIndex:indexPath.row];
    cell.adviserInfo.text  =  [self.delegate  rankingListAdvisersCellAdvisersInfo:self advisersInfoIndex:indexPath.row];
    
    return cell;
}

@end
