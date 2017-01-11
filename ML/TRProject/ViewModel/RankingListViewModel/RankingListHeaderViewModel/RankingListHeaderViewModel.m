//
//  RankingListHeaderViewModel.m
//  TRProject
//
//  Created by Yang Xiong on 29/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import "RankingListHeaderViewModel.h"

@interface RankingListHeaderViewModel()
//@property  (nonatomic)  NSInteger  btnTag;
@end

@implementation RankingListHeaderViewModel

-(RankingListHeaderModel *)headerList
{
    if (!_headerList)
    {
        _headerList  =  [RankingListHeaderModel  new];
    }
    return _headerList;
}



-(void)getDataWithcompletionHandler:(void (^)(NSError *))completionHandler
{
    NSLog(@"#############btnTag 的下标值是： %ld####################", _btnTag);
    [NetManager  getRankingListHeaderBtnTag:self.btnTag CompletionHandel:^(RankingListHeaderModel *model, NSError *error) {
            
        self.headerList  =  model;
    
        //NSLog(@"--------测试网址是：%@----------", self.headerList.data.banner_img.img);
        !completionHandler  ?:  completionHandler(error);
    }];
}

-(NSInteger)getSectionOfNumber
{
    return self.headerList.data.sub_list.count  +  1;
}

-(NSInteger)getCellOfNumber
{
    return self.headerList.data.sub_list[0].products.count;
}


-(NSURL *)getHeadrIconUrl
{
    NSLog(@"*********我的头部图片  %@",  self.headerList.data.banner_img.img);
    return [NSString  stringWithFormat:kRanKingListPath, self.headerList.data.banner_img.img].yx_URL;
}

-(NSURL *)getProdutsIVURLID:(NSInteger)sectionNumber row:(NSInteger)row
{
    return [NSString  stringWithFormat:kRanKingListPath, self.headerList.data.sub_list[sectionNumber].products[row].banner_thumb].yx_URL;
}

-(NSString *)getShortNameString:(NSInteger)sectionNumber row:(NSInteger)row
{
    return self.headerList.data.sub_list[sectionNumber].products[row].short_name;
}

-(NSString *)getPriceString:(NSInteger)sectionNumber row:(NSInteger)row
{
    return [NSString  stringWithFormat:@"参考价: %@", self.headerList.data.sub_list[sectionNumber].products[row].price];
}

-(NSString *)getSpecialString:(NSInteger)sectionNumber row:(NSInteger)row
{
    return  self.headerList.data.sub_list[sectionNumber].products[row].special;

}

@end
