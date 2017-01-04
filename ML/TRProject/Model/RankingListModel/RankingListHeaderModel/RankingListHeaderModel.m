//
//  RankingListHeaderModel.m
//  TRProject
//
//  Created by Yang Xiong on 27/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import "RankingListHeaderModel.h"

@implementation RankingListHeaderModel

@end

@implementation RankingListHeaderDataModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return  @{@"sub_entry"  :  @"RankingListHeaderSubEntryModel",
              @"sub_list"  :  @"RankingListHeaderSubListModel"};
}
@end

@implementation RankingListHeaderBannerImgModel

@end

@implementation RankingListHeaderShareModel

@end

@implementation RankingListHeaderSubEntryModel

@end

@implementation RankingListHeaderSubListModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"products"  :  @"RankingListHeaderSubListProductsModel"};
}

@end

@implementation RankingListHeaderSubListProductsModel

@end

