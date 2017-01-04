//
//  RankingListAdvisersViewCell.m
//  TRProject
//
//  Created by Yang Xiong on 26/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import "RankingListAdvisersViewCell.h"

@implementation RankingListAdvisersViewCell

-(UIImageView *)avatorIV
{
    if (!_avatorIV)
    {
        _avatorIV  =  [UIImageView  new];
        [self.contentView  addSubview:_avatorIV];
        [_avatorIV  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(kWidth  *  (145.f  /  640.f));
            make.height.equalTo(kHight  *  (145.f  /   1132.f));
            make.top.equalTo(kHight  *  (0.f  /  1132.f));
            make.left.equalTo(kWidth  *  (40.f  /  640.f));
        }];
        _avatorIV.layer.cornerRadius  =  (kWidth  *  (145.f  /  640.f))  /  2.f;
        _avatorIV.clipsToBounds  =  YES;
    }
    return _avatorIV;
}

-(UILabel *)adviserName
{
    if (!_adviserName)
    {
        _adviserName  =  [UILabel  new];
        [self.contentView   addSubview:_adviserName];
        [_adviserName  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.avatorIV);
            make.height.equalTo(kHight  *  (20.f  /  1132.f));
            make.top.equalTo(self.avatorIV.mas_bottom).offset(kHight  *  (10.f  /  1132.f));
            make.left.equalTo(self.avatorIV);
        }];
        _adviserName.font  =  [UIFont  systemFontOfSize:12.f];
        _adviserName.textAlignment  =  NSTextAlignmentCenter;
    }
    return _adviserName;
}


-(UILabel *)adviserInfo
{
    if (!_adviserInfo)
    {
        _adviserInfo  =  [UILabel  new];
        [self.contentView  addSubview:_adviserInfo];
        [_adviserInfo  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.avatorIV);
            make.height.equalTo(self.adviserName);
            make.top.equalTo(self.adviserName.mas_bottom).offset(kHight  *  (10.f  /  1132.f));
            make.left.equalTo(self.avatorIV);
        }];
        _adviserInfo.font  =  [UIFont  systemFontOfSize:12.f];
        _adviserInfo.textColor  =  [UIColor  grayColor];
        _adviserInfo.textAlignment  =  NSTextAlignmentCenter;
        _adviserInfo.numberOfLines  =  1;
    }
    return _adviserInfo;
}
@end
