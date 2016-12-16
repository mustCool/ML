//
//  RankingListMainCell.m
//  TRProject
//
//  Created by tarena15 on 2016/12/15.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "RankingListMainCell.h"

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
                make.height.equalTo(kHight  *  (282.f  /  1132.f));
                
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

@end
