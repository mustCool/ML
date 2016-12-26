//
//  RankingListTopCell.m
//  TRProject
//
//  Created by Yang Xiong on 22/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import "RankingListTopCell.h"

@implementation RankingListTopCell

-(UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        UICollectionViewFlowLayout  *layout  =  [UICollectionViewFlowLayout  new];
        layout.sectionInset  =  UIEdgeInsetsZero;
        layout.minimumLineSpacing  =  20.f;
        layout.minimumInteritemSpacing  =  20.f;
        
        CGFloat w  =  kWidth  *  (190.f  /  640.f);
        CGFloat h  =  kHight  *  (282.f  /  1132.f);
        layout.itemSize  =  CGSizeMake(w, h);
        layout.scrollDirection  =  UICollectionViewScrollDirectionHorizontal;

        _collectionView  =  [[UICollectionView  alloc] initWithFrame:CGRectMake(kWidth  *  (20.f  /  640.f), kHight  *  (445.f  /  1132.f), ((kWidth  *  (190.f  /  640.f))  *  11  + (kWidth  *  (20.f  /  640.f))  *  12), kHight  *  (282.f  /  1132.f)) collectionViewLayout:layout];
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
    return [self.delegate  numberOfItemInRankingListTopCell:self];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RankingListTopUVCell  *cell  =  [collectionView  dequeueReusableCellWithReuseIdentifier:@"rankingListTopUVCell" forIndexPath:indexPath];
    [cell.imageIV  setImageURL:[self.delegate  rankinglistTopCellImageIV:self iconAtIndex:indexPath.row]];
    cell.topLevel.image  =  [self.delegate  rankinglistTopCellTopLevel:self topLevelIndex:indexPath.row];
    cell.topText.text  =  [self.delegate  rankinglistTopCellTopText:self topTextIndex:indexPath.row];
    
    return cell;
}

@end
