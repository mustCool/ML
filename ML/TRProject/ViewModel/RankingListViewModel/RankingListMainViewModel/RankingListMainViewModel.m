//
//  RankingListMainViewModel.m
//  TRProject
//
//  Created by tarena15 on 2016/12/15.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "RankingListMainViewModel.h"


@implementation RankingListMainViewModel
-(RankingListMainModel *)dataList
{
    if (!_dataList)
    {
        _dataList   =  [RankingListMainModel  new];
    }
    return _dataList;
}

-(void)getDataWithRequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler
{
    NSInteger  tmpPages  =  1;
    if (requestMode  ==  RequestModeMore)
    {
        tmpPages  =  _pages  +  1;
    }
    [NetManager  getRankingListCompletionHandel:^(RankingListMainModel *model, NSError *error) {
        self.dataList  =  model;
        !completionHandler  ?:  completionHandler(error);
        
    }];
}

-(NSArray *)topButton
{
    NSMutableArray  *tmpArr  =  [NSMutableArray  new];
    for (NSInteger  i  =  0; i  <  2; i  ++)
    {
        NSURL  *url  =  [NSString stringWithFormat: kRanKingListPath,  self.dataList.data.top.custom[i].img.img].yx_URL;
        
        [tmpArr  addObject:url];
    }
    
    return tmpArr.copy;
}

-(NSArray *)detailButton
{
    NSMutableArray  *tmpArr  =  [NSMutableArray  new];
    for (NSInteger  i  =  0; i  <  11; i  ++)
    {
        NSURL  *url  =  [NSString stringWithFormat: kRanKingListPath,  self.dataList.data.nations[i].products[i].banner_thumb].yx_URL;
        
        [tmpArr  addObject:url];
    }
    
    return tmpArr.copy;
}

-(NSArray *)levelPicArr
{
    if (!_levelPicArr) {
        _levelPicArr  =  @[@"icon_top_red_01",
                           @"icon_top_red_02",
                           @"icon_top_red_03",
                           @"icon_top_red_04",
                           @"icon_top_red_05",
                           @"icon_top_red_06",
                           @"icon_top_red_07",
                           @"icon_top_red_08",
                           @"icon_top_red_09",
                           @"icon_top_red_10"];
    }
    return _levelPicArr;
}


-(NSInteger)rowNumber
{
    return self.dataList.data.nations.count  +  4;
}

-(NSInteger)itemNumberForRow:(NSInteger)row
{
    return self.dataList.data.categories.count;
}

-(NSURL *)iconAtIndex:(NSInteger)index row:(NSInteger)row
{

    return [NSString stringWithFormat: kRanKingListPath, self.dataList.data.categories[index].img].yx_URL;
}


-(NSURL *)detailIvURLForRow:(NSInteger)row
{

    return [NSString stringWithFormat:kRanKingListPath,  self.dataList.data.nations[row].img.img].yx_URL;
   
}

-(NSInteger)detailNumberForRow:(NSInteger)row
{
    return self.dataList.data.nations.count;
}

-(NSURL *)featureIvURLForRow:(NSInteger)row
{
    return [NSString  stringWithFormat:kRanKingListPath,  self.dataList.data.feature_show[row].img.img].yx_URL;
}

-(NSInteger)featureNumberForRow:(NSInteger)row itemNumberForSection:(NSInteger)section
{
    if (section  ==  1   ||   section  ==  2)
    {
        return self.dataList.data.feature_show[section  -1].products.count;
    }
    return self.dataList.data.nations[section  -  3].products.count;
    
}

-(NSURL *)featureProductsURLAtIndex:(NSInteger)index sectionIndex:(NSInteger)sectionIndex row:(NSInteger)row
{
    if (sectionIndex  ==  1  ||  sectionIndex  == 2)
    {
        return [NSString  stringWithFormat:kRanKingListPath,  self.dataList.data.feature_show[sectionIndex  -  1].products[index].banner_thumb].yx_URL;
    }
    return [NSString  stringWithFormat:kRanKingListPath,  self.dataList.data.nations[sectionIndex  -  3].products[index].banner_thumb].yx_URL;
}

-(NSString *)featureProductsInfoAtIndex:(NSInteger)index sectionIndex:(NSInteger)sectionIndex row:(NSInteger)row
{
    if (sectionIndex  == 1  ||  sectionIndex  ==  2)
    {
        return self.dataList.data.feature_show[sectionIndex  -  1].products[index].short_name;
    }
    return self.dataList.data.nations[sectionIndex  -  3].products[index].short_name;
}


//  用数组来控制 红色等级
-(NSString *)featureProductsLevelAtIndex:(NSInteger)index row:(NSInteger)row
{
    if (index  <=  9)
    {
        return self.levelPicArr[index];
    }
    return nil;
}

-(NSURL *)detailAtIndex:(NSInteger)index row:(NSInteger)row
{
    return [NSString  stringWithFormat:  kRanKingListPath,  self.dataList.data.nations[index].img.img].yx_URL;
}

-(NSMutableAttributedString *)totalDesString
{
    NSMutableAttributedString  *str  =  [NSMutableAttributedString  new];
    
    NSAttributedString  *str1  =  [[NSAttributedString  alloc] initWithString:[NSString  stringWithFormat:@"%@",  self.dataList.data.total_des] attributes:@{NSForegroundColorAttributeName:  [UIColor  blackColor],  NSFontAttributeName:  [UIFont  boldSystemFontOfSize:14.f]}];
    
    NSAttributedString  *str2  =  [[NSAttributedString  alloc] initWithString:@"件收录，国内" attributes:@{NSForegroundColorAttributeName:[UIColor  grayColor],  NSFontAttributeName:  [UIFont  systemFontOfSize:14.f]}];
    
    NSAttributedString  *str3  =  [[NSAttributedString  alloc] initWithString:@"最大" attributes:@{NSForegroundColorAttributeName:[UIColor  blackColor],  NSFontAttributeName:  [UIFont  boldSystemFontOfSize:14.f]}];
    
    NSAttributedString  *str4  =  [[NSAttributedString  alloc] initWithString:@"的妆品信息库" attributes:@{NSForegroundColorAttributeName:  [UIColor  grayColor],  NSFontAttributeName:  [UIFont  systemFontOfSize:14.f]}];
    
    [str  appendAttributedString:str1];
    [str  appendAttributedString:str2];
    [str  appendAttributedString:str3];
    [str  appendAttributedString:str4];
    
    return str;
}


/* adviser  datalist */
-(NSInteger)advisersNumberForRow:(NSInteger)row
{
    return self.dataList.data.advisers.list.count;
}

-(NSURL *)advisersAvatorIvURLAtIndex:(NSInteger)index  Row:(NSInteger)row
{
    return [NSString  stringWithFormat:kRanKingListPath, self.dataList.data.advisers.list[index].avatar].yx_URL;
}

-(NSString *)advisersNameAtIndex:(NSInteger)index  Row:(NSInteger)row
{
    return  self.dataList.data.advisers.list[index].nickname;
}

-(NSString *)advisersInfoAtIndex:(NSInteger)index  Row:(NSInteger)row
{
    return  self.dataList.data.advisers.list[index].rater_intro;
}

-(NSString  *)advisersTitle
{
    return self.dataList.data.advisers.title;
}

-(NSString *)advisersStrat
{
    return @"title_icon_heart";
}
@end
