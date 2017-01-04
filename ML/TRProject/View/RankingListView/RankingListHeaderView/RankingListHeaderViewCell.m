//
//  RankingListHeaderViewCell.m
//  TRProject
//
//  Created by Yang Xiong on 29/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import "RankingListHeaderViewCell.h"

@implementation RankingListHeaderViewCell
-(UIImageView *)headerIV
{
    if (!_headerIV)
    {
        _headerIV  =  [UIImageView  new];
        [self.contentView  addSubview:_headerIV];
        [_headerIV  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(kWidth);
            make.height.equalTo(kHight  *  (328.f  /  1132.f));
            make.left.equalTo(0.f);
            make.top.equalTo(0.f);
        }];
    }
    return _headerIV;
}

-(UIImageView *)productsIV
{
    if (!_productsIV)
    {
        _productsIV  =  [UIImageView  new];
        [self.contentView  addSubview:_productsIV];
        [_productsIV  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(kWidth  *  (255.f  /  640.f));
            make.height.equalTo(kHight  *  (265.f  /  1132.f));
            make.left.equalTo(0.f);
            make.top.equalTo(0.f);
        }];
    }
    return _productsIV;
}

-(UIImageView *)productsLevel
{
    if (!_productsLevel)
    {
        _productsLevel  =  [UIImageView  new];
        [self.productsIV  addSubview:_productsLevel];
        [_productsLevel  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(kWidth  *  (70.f  /  640.f));
            make.height.equalTo(kHight  *  (60.f  /  1132.f));
            make.left.equalTo(kHight  *  (30.f  /  1132.f));
            make.top.equalTo(kHight  *  (20.f  /  1132.f));
        }];
    }
    return _productsLevel;
}

-(UILabel *)shortName
{
    if (!_shortName)
    {
        _shortName  =  [UILabel  new];
        [self.contentView  addSubview:_shortName];
        [_shortName  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(kWidth  *  (330.f  /  640.f));
            make.height.equalTo(kHight  *  (70.f  /  1132.f));
            make.left.equalTo(self.productsIV.mas_left).offset(kHight  *  (50.f  /  1132.f));
            make.top.equalTo(kHight  *  (40.f  /  1132.f));
        }];
    }
    return _shortName;
}

-(UILabel *)priceLB
{
    if (!_priceLB)
    {
        _priceLB  =  [UILabel  new];
        [self.contentView  addSubview:_priceLB];
        [_priceLB  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(kWidth  *  (60.f  /  640.f));
            make.height.equalTo(kHight  *  (40.f  /  1132.f));
            make.right.equalTo(-(kHight  *  (30.f  /  1132.f)));
            make.top.equalTo(self.shortName.mas_bottom).offset(kHight  *  (10.f  /  1132.f));
        }];
    }
    return _priceLB;
}

-(UILabel *)special
{
    if (!_priceLB)
    {
        _priceLB  =  [UILabel  new];
        [self.contentView  addSubview:_priceLB];
        [_priceLB  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.shortName);
            make.height.equalTo(kHight  *  (70.f  /  1132.f));
            make.right.equalTo(self.priceLB);
            make.top.equalTo(self.priceLB.mas_bottom).offset(kHight  *  (30.f  /  1132.f));
        }];
    }
    return _priceLB;
}
@end
