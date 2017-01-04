//
//  RankingListHeaderModel.h
//  TRProject
//
//  Created by Yang Xiong on 27/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RankingListHeaderDataModel,  RankingListHeaderBannerImgModel,  RankingListHeaderShareModel,  RankingListHeaderSubEntryModel,  RankingListHeaderSubListModel,  RankingListHeaderSubListProductsModel;

@interface RankingListHeaderModel : NSObject
@property  (nonatomic)  RankingListHeaderDataModel  *data;
@end

@interface RankingListHeaderDataModel : NSObject
@property  (nonatomic)  NSString  *title;
@property  (nonatomic)  RankingListHeaderBannerImgModel  *banner_img;
@property  (nonatomic)  RankingListHeaderShareModel  *share;
@property  (nonatomic)  NSArray<RankingListHeaderSubEntryModel  *>  *sub_entry;
@property  (nonatomic)  NSArray<RankingListHeaderSubListModel  *>  *sub_list;
@end

@interface RankingListHeaderBannerImgModel : NSObject
@property  (nonatomic)  NSString  *img;
@property  (nonatomic)  NSString  *img_height;
@property  (nonatomic)  NSString  *img_width;
@property  (nonatomic)  NSString  *img2;
@property  (nonatomic)  NSString  *img2_height;
@property  (nonatomic)  NSString  *img2_width;
@property  (nonatomic)  NSString  *img3;
@property  (nonatomic)  NSString  *img3_height;
@property  (nonatomic)  NSString  *img3_width;
@property  (nonatomic)  NSString  *img4;
@property  (nonatomic)  NSString  *img4_height;
@property  (nonatomic)  NSString  *img4_width;
@property  (nonatomic)  BOOL  *is_long;
@end

@interface RankingListHeaderShareModel : NSObject
@property  (nonatomic)  NSString  *content;
@property  (nonatomic)  NSString  *img;
@property  (nonatomic)  NSString  *snapshot_url;
@property  (nonatomic)  NSString  *title;
@property  (nonatomic)  NSString  *url;
@end

@interface RankingListHeaderSubEntryModel : NSObject
@property  (nonatomic)  NSString  *des;
@property  (nonatomic)  NSString  *is_all;
@property  (nonatomic)  NSString  *jump_data;
@property  (nonatomic)  NSString  *jump_label;
@property  (nonatomic)  NSString  *slug;
@property  (nonatomic)  NSString  *title;
@end

@interface RankingListHeaderSubListModel : NSObject
@property  (nonatomic)  NSString  *des;
@property  (nonatomic)  NSString  *has_more;
@property  (nonatomic)  NSArray<RankingListHeaderSubListProductsModel  *>  *products;
@property  (nonatomic)  NSString  *slug;
@property  (nonatomic)  NSString  *title;
@property  (nonatomic)  NSString  *top_count;
@end

@interface RankingListHeaderSubListProductsModel : NSObject
@property  (nonatomic)  NSString  *banner_thumb;
@property  (nonatomic)  NSDictionary  *ext;
@property  (nonatomic)  NSString  *name;
@property  (nonatomic)  NSString  *price;
@property  (nonatomic)  NSString  *short_name;
@property  (nonatomic)  NSString  *slug;
@property  (nonatomic)  NSString  *special;
@end


