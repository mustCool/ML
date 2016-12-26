//
//  RankingListNationsViewCell.m
//  TRProject
//
//  Created by Yang Xiong on 20/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import "RankingListNationsViewCell.h"

@implementation RankingListNationsViewCell

-(UIButton *)detailIV
{
    if (!_detailIV)
    {
        _detailIV  =  [UIButton  new];
        [self.contentView  addSubview:_detailIV];
        [_detailIV  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0.f);
            make.top.equalTo(0.f);
            make.height.equalTo(kHight  *  (430.f  /  1132.f));
        }];
    }
    return _detailIV;
}

-(NSArray<UIButton *> *)detailButton
{
    if (!_detailButton)
    {
        NSMutableArray  *tmpArr  =  [NSMutableArray new];
        UIView  *lastView  =  nil;
        for (NSInteger i  =  0; i  <  2; i  ++)
        {
            UIButton *btn  =  [UIButton new];
            [self.contentView addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(kWidth  *  (150.f  /  640.f));
                make.height.equalTo(kHight  *  (200.f  /  1132.f));
                make.top.equalTo(self.detailIV.mas_bottom).offset(kHight  *  (20.f  /  1132.f));
                
                if (i  ==  0)
                {
                    make.left.equalTo(kWidth  *  (20.f  /  640.f));
                }
                else
                {
                    make.left.equalTo(lastView.mas_right).offset(kWidth  *  (10.f  /  640.f));
                    make.right.equalTo(-(kWidth  *  (20.f  /  640.f)));
                }
            }];
            lastView  =  btn;
            [tmpArr addObject:btn];
        }
        _detailButton = tmpArr.copy;
    }
    return _detailButton;
}

@end
