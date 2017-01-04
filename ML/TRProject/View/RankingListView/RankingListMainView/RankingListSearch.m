//
//  RankingListSearch.m
//  TRProject
//
//  Created by Yang Xiong on 27/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import "RankingListSearch.h"

@implementation RankingListSearch

-(instancetype)init
{
    if (self  !=  [super init])
    {
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(kWidth);
            make.height.equalTo(kHight  *  (84.f  /  1132.f));
            make.left.top.equalTo(0.f);
        }];
    }
    return self;
}

-(UITextField *)searchText
{
    if (!_searchText)
    {
        _searchText  =  [UITextField  new];
        [self  addSubview:_searchText];
        [_searchText  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(kWidth  *  (515.f  /  640.f));
            make.height.equalTo(kHight  *  (70.f  /  1132.f));
            make.left.equalTo(kWidth  *  (25.f  /  640.f));
            make.top.equalTo(kHight  *  (10.f  /  1132.f));
        }];
        _searchText.layer.cornerRadius  =  10.f;
        _searchText.clipsToBounds  =  YES;
        _searchText.backgroundColor  =  [UIColor  colorWithRed:236.f  /  255.f green:236.f  /  255.f blue:236.f  /  255.f alpha:1.f];
    }
    return  _searchText;
}

-(UIImageView *)searchGraph
{
    if (!_searchGraph)
    {
        _searchGraph  =  [UIImageView  new];
        [self.searchText  addSubview:_searchGraph];
        [_searchGraph  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(kWidth  *  (45.f  /  640.f));
            make.height.equalTo(kHight  *  (40.f  /  1132.f));
            make.centerY.equalTo(self.searchText);
        }];
    }
    return _searchGraph;
}

-(UIButton *)searchScanBtn
{
    if (!_searchScanBtn)
    {
        _searchScanBtn  =  [UIButton  new];
        [self  addSubview:_searchScanBtn];
        [_searchScanBtn  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(kWidth  *  (50.f  /  640.f));
            make.height.equalTo(kHight  *  (50.f  /  1132.f));
            make.centerY.equalTo(self.searchText);
        }];
    }
    return _searchScanBtn;
}

@end
