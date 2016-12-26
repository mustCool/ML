//
//  RankingListIcon.m
//  TRProject
//
//  Created by Yang Xiong on 19/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import "RankingListIcon.h"

@implementation RankingListIcon

-(UIButton *)kindButton
{
    if (!_kindButton)
    {
        _kindButton  =  [UIButton  new];
        [self.contentView  addSubview:_kindButton];
        [_kindButton  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(kHight  *  (0.f  /  1132.f));
            make.width.equalTo(kWidth  *  (152.f  /  640.f));
            make.height.equalTo(kHight  *  (210.f  /  1132.f));
//            make.left.equalTo(kWidth  *  (10.f  /  640.f));
        }];
    }
    return _kindButton;
}

-(UIButton *)detailButton
{
    if (!_detailButton)
    {
        _detailButton  =  [UIButton  new];
        [self.contentView  addSubview:_detailButton];
        [_detailButton  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(kHight  *  (20.f  /  1132.f));
            //            make.left.equalTo(kWidth  *  (30.f  /  1132.f));
            make.width.equalTo(kWidth  *  (152.f  /  640.f));
            make.height.equalTo(kHight  *  (212.f  /  1132.f));
        }];
    }
    return _detailButton;
}
@end
