//
//  RankingListMainCell.m
//  TRProject
//
//  Created by tarena15 on 2016/12/15.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "RankingListMainCell.h"
#import "RankingListIcon.h"

@implementation RankingListMainCell
-(NSArray<UIButton *> *)topButton
{
    if (!_topButton)
    {
        NSMutableArray  *tmpArr  =  [NSMutableArray new];
        UIView  *lastView  =  nil;
        for (NSInteger i  =  0; i  <  2; i  ++)
        {
            UIButton *btn  =  [UIButton new];
            [self.contentView addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(kWidth  *  (285.f  /  640.f));
                make.height.equalTo(kHight  *  (260.f  /  1132.f));
                make.top.equalTo(kHight  *  (30.f  /  1132.f));
                
                if (i  ==  0)
                {
                    make.left.equalTo(kWidth  *  (30.f  /  640.f));
                }
                else
                {
                    make.left.equalTo(lastView.mas_right).offset(kWidth  *  (20.f  /  640.f));
                    make.right.equalTo(-(kWidth  *  (30.f  /  640.f)));
                }
            }];
            lastView  =  btn;
            [tmpArr addObject:btn];
        }
        _topButton = tmpArr.copy;
    }
    return _topButton;
}


-(UILabel *)totalDes
{
    if (!_totalDes)
    {
        _totalDes  =  [UILabel  new];
        [self.contentView  addSubview:_totalDes];
        [_totalDes  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topButton[1].mas_bottom).offset(kHight  *  (45.f  /  1132.f));
            make.left.equalTo(0.f);
            make.width.equalTo(kWidth);
            make.height.equalTo(kHight  *  (45.f  /  1132.f));
        }];
        
        _totalDes.textAlignment  =  NSTextAlignmentCenter;
    }
    return _totalDes;
}


-(UICollectionView *)collecitonView
{
    if (!_collecitonView)
    {
        UICollectionViewFlowLayout  *layout  =  [UICollectionViewFlowLayout  new];
        layout.sectionInset  =  UIEdgeInsetsMake(0.f, 20.f, 20.f, 20.f);
        layout.minimumLineSpacing  =  10.f;
        layout.minimumInteritemSpacing  =  10.f;
        
        //CGFloat  w  =  (long)([UIScreen  mainScreen].bounds.size.width  -  ((2  *  20.f)  +  (5  *  10.f)))  /  3;
        CGFloat w = kWidth  *  (152.f  /  640.f);
        CGFloat h  =  w  +  10.f;
        layout.itemSize  =  CGSizeMake(w, h);
        layout.scrollDirection  =  UICollectionViewScrollDirectionHorizontal;
        
        
        _collecitonView  =  [[UICollectionView  alloc]  initWithFrame:CGRectMake(0.f, (kHight  *  (410.f  /  1132.f)), kWidth, (kHight  *  (210.f  /  1132.f))) collectionViewLayout:layout];
        _collecitonView.pagingEnabled  =  YES;
        _collecitonView.scrollEnabled  =  YES;
        
        // 允许 collectionView 能够横向滚动
        //_collecitonView.showsHorizontalScrollIndicator  =  YES;
        _collecitonView.backgroundColor  =  [UIColor whiteColor];
        _collecitonView.delegate  =  self;
        _collecitonView.dataSource  =  self;
        [_collecitonView registerClass:[RankingListIcon  class] forCellWithReuseIdentifier:@"RankingListIcon"];
        [self.contentView  addSubview:_collecitonView];
        
        // 横向滚动时默认的底下有一条滚动条，要把它设置为 NO
        _collecitonView.showsHorizontalScrollIndicator  =  NO;
    }

    return _collecitonView;
}

-(UIPageControl *)pc
{
    if (!_pc)
    {
        _pc  =  [UIPageControl  new];
        [self.contentView  addSubview:_pc];
        [_pc  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView);
            make.centerX.equalTo(0.f);
        }];
    }
    return _pc;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.delegate  numberOfItemInRankingListMainCell:self];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RankingListIcon  *cell  =  [collectionView  dequeueReusableCellWithReuseIdentifier:@"RankingListIcon" forIndexPath:indexPath];
    
    [cell.kindButton  setBackgroundImageWithURL:[self.delegate  rankinglistMainCell:self iconAtIndex:indexPath.row] forState:UIControlStateNormal options:NO];
    return cell;
}

@end
