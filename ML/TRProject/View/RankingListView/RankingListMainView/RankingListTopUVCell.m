//
//  RankingListTopUVCell.m
//  TRProject
//
//  Created by Yang Xiong on 22/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import "RankingListTopUVCell.h"

@implementation RankingListTopUVCell
-(UIButton *)topButton
{
    if (!_topButton)
    {
        _topButton  =  [UIButton  new];
        [self.contentView  addSubview:_topButton];
        [_topButton  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(kWidth  *  (170.f  /  640.f));
            make.height.equalTo(kHight  *  (282.f  /  1132.f));
            make.top.equalTo(kHight  *  (445.f  /  1132.f));
        }];
    }
    
    return _topButton;
}

-(UIImageView *)imageIV
{
    if (!_imageIV)
    {
        _imageIV  =  [UIImageView  new];
        [self.contentView  addSubview:_imageIV];
        [_imageIV  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(kWidth  *  (170.f  /  640.f));
            make.height.equalTo(kHight  *  (150.f  /  1132.f));
        }];
    }
    return _imageIV;
}

-(UIImageView *)topLevel
{
    if (!_topLevel)
    {
        _topLevel  =  [UIImageView  new];
        [self.contentView  addSubview:_topLevel];
        [_topLevel  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(kWidth  *  (70.f  /  640.f));
            make.height.equalTo(kHight  *  (25.f  /  1132.f));
            make.top.equalTo(self.imageIV.mas_bottom).offset(kHight  *  (18.f  /  1132.f));
            make.centerX.equalTo(self.imageIV);
        }];
    }
    return _topLevel;
}

-(UILabel *)topText
{
    if (!_topText)
    {
        _topText  =  [UILabel  new];
        [self.contentView  addSubview:_topText];
        [_topText  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(kWidth  *  (150.f  /  640.f));
            make.height.equalTo(kHight  *  (55.f  /  1132.f));
            make.top.equalTo(self.topLevel.mas_bottom).offset(kHight  *  (5.f  /  1132.f));
            make.centerX.equalTo(self.imageIV);
        }];
        
        _topText.font  =  [UIFont  systemFontOfSize:13.f];
        _topText.textAlignment  =  NSTextAlignmentCenter;
        _topText.numberOfLines  =  2;
    }
    return _topText;
}

@end
