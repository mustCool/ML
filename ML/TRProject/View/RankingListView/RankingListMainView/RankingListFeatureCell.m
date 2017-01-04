
//  RankingListFeatureCell.m
//  TRProject
//
//  Created by Yang Xiong on 22/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import "RankingListFeatureCell.h"

@implementation RankingListFeatureCell

-(UIButton *)featureIV
{
    if (!_featureIV)
    {
        _featureIV  =  [UIButton  new];
        [self.contentView  addSubview:_featureIV];
        [_featureIV  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0.f);
            make.top.equalTo(0.f);
            make.height.equalTo(kHight  *  (430.f  /  1132.f));
        }];
    }
    return _featureIV;
}

-(UIImageView *)littleTriangle
{
    if (!_littleTriangle)
    {
        _littleTriangle  =  [UIImageView  new];
        [self.contentView  addSubview:_littleTriangle];
        [_littleTriangle  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(kWidth  *  (45.f  /  640.f));
            make.height.equalTo(kHight  *  (25.f  /  1132.f));
            make.centerX.equalTo(self.contentView);
            make.bottom.equalTo(0.f);
        }];
    }
    return _littleTriangle;
}

-(UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        UICollectionViewFlowLayout  *layout  =  [UICollectionViewFlowLayout  new];
        layout.sectionInset  =  UIEdgeInsetsZero;
        layout.minimumLineSpacing  =  10.f;
        layout.minimumInteritemSpacing  =  0.f;
        
        CGFloat w  =  kWidth  *  (190.f  /  640.f);
        CGFloat h  =  kHight  *  (282.f  /  1132.f);
        layout.itemSize  =  CGSizeMake(w, h);
        layout.scrollDirection  =  UICollectionViewScrollDirectionHorizontal;
        
        _collectionView  =  [[UICollectionView  alloc] initWithFrame:CGRectMake(kWidth  *  (20.f  /  640.f), kHight  *  (445.f  /  1132.f), kWidth, kHight  *  (282.f  /  1132.f)) collectionViewLayout:layout];
        _collectionView.scrollEnabled  =  YES;
        _collectionView.showsHorizontalScrollIndicator  =  NO;
        _collectionView.backgroundColor  =  [UIColor  whiteColor];
        _collectionView.delegate  =  self;
        _collectionView.dataSource  =  self;
        [_collectionView  registerClass:[RankingListTopUVCell  class] forCellWithReuseIdentifier:@"rankingListTopUVCell"];
        
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
    return [self.delegate  numberOfItemInRankingListFeatureCell:self];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RankingListTopUVCell  *cell  =  [collectionView  dequeueReusableCellWithReuseIdentifier:@"rankingListTopUVCell" forIndexPath:indexPath];
    [cell.imageIV  setImageURL:[self.delegate  rankingListFeatureCellImageIV:self iconAtIndex:indexPath.row]];
    cell.topLevel.image  = [UIImage  imageNamed:[self.delegate  rankingListFeatureCellTopLevel:self topLevelIndex:indexPath.row]];
    cell.topText.text  =  [self.delegate  rankingListFeatureCellTopText:self topTextIndex:indexPath.row];
    
    return cell;
}

@end
