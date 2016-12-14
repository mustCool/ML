//
//  RankingListMainModel.m
//  TRProject
//
//  Created by tarena15 on 2016/12/14.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "RankingListMainModel.h"

@implementation RankingListMainModel

@end

@implementation RankingListDataModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"categories" : @"RankingListCategoryModel",
                   @"feature_show" : @"RankingListFeatureShowModel",
                   @"nations" : @"RankingListNationsModel"};
}
@end

@implementation RankingListAdvisersModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"list" : @"RankingListAdvisersListModel"};
}
@end

@implementation RankingListCategoryModel

@end

@implementation RankingListFeatureMoreModel

@end

@implementation RankingListFeatureShowModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"products" : @"RankingListFSProductsModel"};
}
@end

@implementation RankingListNationsModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"products" : @"RankingListNationsProductsModel"};
}
@end

@implementation RankingListTopModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"custom" : @"RankingListTopCustomModel"};
}
@end

@implementation RankingListAdvisersListModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{@"typeIcon" : @"new_type_icon",
             @"typeImg" : @"new_type_img"};
}
@end

@implementation RankingListFSProductsModel

@end

@implementation RankingListNationsProductsModel

@end

@implementation RankingListTopCustomModel

@end

@implementation RankingListFeatureShowImgModel

@end

@implementation RankingListFeatureShowImgLogoModel

@end

@implementation RankingListNationsImgModel

@end

@implementation RankingListNationsImgLogoModel

@end

@implementation RankingListTopImgModel

@end

@implementation RankingListTopImgLogoModel

@end
