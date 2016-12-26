//
//  RankingListMainModel.h
//  TRProject
//
//  Created by tarena15 on 2016/12/14.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RankingListDataModel,  RankingListAdvisersModel,   RankingListCategoryModel,  RankingListFeatureMoreModel,  RankingListFeatureShowModel,  RankingListNationsModel,  RankingListTopModel,  RankingListAdvisersListModel,  RankingListFSProductsModel,  RankingListTopCustomModel,  RankingListFeatureShowImgModel,  RankingListFeatureShowImgLogoModel,  RankingListNationsProductsModel,  RankingListNationsImgModel,  RankingListNationsImgLogoModel,  RankingListTopImgLogoModel,  RankingListTopImgModel;

@interface RankingListMainModel : NSObject
@property (nonatomic) RankingListDataModel *data;
@end

@interface RankingListDataModel : NSObject
@property (nonatomic) RankingListAdvisersModel  *advisers;
@property (nonatomic) NSArray<RankingListCategoryModel *> *categories;
@property (nonatomic) RankingListFeatureMoreModel  *feature_more;
@property (nonatomic) NSArray<RankingListFeatureShowModel *>  *feature_show;
@property (nonatomic) NSArray<RankingListNationsModel *>  *nations;
@property (nonatomic) RankingListTopModel *top;
@property (nonatomic) NSString  *total_des;
@end

@interface RankingListAdvisersModel : NSObject
@property (nonatomic) NSString  *title;
@property (nonatomic) NSArray<RankingListAdvisersListModel *>  *list;
@end

@interface RankingListCategoryModel : NSObject
@property (nonatomic) NSString  *data;
@property (nonatomic) NSString  *img;
@property (nonatomic) NSString  *label;
@property (nonatomic) NSArray  *tags;
@property (nonatomic) NSString  *text_color;
@property (nonatomic) NSString  *title;
@end

@interface RankingListFeatureMoreModel : NSObject
@property (nonatomic) NSDictionary  *img;
@property (nonatomic) NSString  *img_logo;
@property (nonatomic) NSString  *intro;
@property (nonatomic) NSString  *jump_data;
@property (nonatomic) NSString  *jump_label;
@property (nonatomic) NSString  *slug;
@property (nonatomic) NSString  *title;
@end

@interface RankingListFeatureShowModel : NSObject
@property (nonatomic) RankingListFeatureShowImgModel  *img;
@property (nonatomic) RankingListFeatureShowImgLogoModel  *img_logo;
@property (nonatomic) NSString  *intro;
@property (nonatomic) NSString  *jump_data;
@property (nonatomic) NSString  *jump_label;
@property (nonatomic) NSArray<RankingListFSProductsModel *>  *products;
@property (nonatomic) NSString  *slug;
@property (nonatomic) NSString  *title;
@end

@interface RankingListNationsModel : NSObject
@property (nonatomic) RankingListNationsImgModel  *img;
@property (nonatomic) RankingListNationsImgLogoModel  *img_logo;
@property (nonatomic) NSString  *intro;
@property (nonatomic) NSString  *jump_data;
@property (nonatomic) NSString  *jump_label;
@property (nonatomic) NSArray<RankingListNationsProductsModel *>  *products;
@property (nonatomic) NSString  *slug;
@property (nonatomic) NSString  *title;
@property (nonatomic) NSString  *up_info_img;
@end

@interface RankingListTopModel : NSObject
@property (nonatomic) NSString  *country_subtitle;
@property (nonatomic) NSString  *country_title;
@property (nonatomic) NSArray<RankingListTopCustomModel *>  *custom;
@property (nonatomic) NSString  *total_des;
@end

@interface RankingListAdvisersListModel : NSObject
@property (nonatomic) NSString  *age_range;
@property (nonatomic) NSString  *avatar;
@property (nonatomic) NSDictionary  *club;
@property (nonatomic) NSInteger  coin;
@property (nonatomic) NSInteger  gender;
@property (nonatomic) NSInteger  level;
@property (nonatomic) NSString  *level_img;
@property (nonatomic) NSString  *typeIcon;
@property (nonatomic) NSString  *typeImg;
@property (nonatomic) NSString  *nickname;
@property (nonatomic) NSString  *rater_intro;
@property (nonatomic) NSString  *skin_type;
@property (nonatomic) NSString  *slug;
@property (nonatomic) NSString  *type_icon;
@end

@interface RankingListFSProductsModel : NSObject
@property (nonatomic) NSString  *banner_thumb;
@property (nonatomic) NSString  *name;
@property (nonatomic) NSString  *short_name;
@property (nonatomic) NSString  *slug;
@property (nonatomic) NSString  *up_info_img;
@end

@interface RankingListNationsProductsModel : NSObject
@property (nonatomic) NSString  *banner_thumb;
@property (nonatomic) NSString  *name;
@property (nonatomic) NSString  *short_name;
@property (nonatomic) NSString  *slug;
@property (nonatomic) NSString  *up_info_img;
@end

@interface RankingListTopCustomModel : NSObject
@property (nonatomic) RankingListTopImgModel  *img;
@property (nonatomic) RankingListTopImgLogoModel  *img_logo;
@property (nonatomic) NSString  *intro;
@property (nonatomic) NSString  *jump_data;
@property (nonatomic) NSString  *jump_label;
@property (nonatomic) NSString  *slug;
@property (nonatomic) NSString  *title;
@end

@interface RankingListFeatureShowImgModel : NSObject
@property (nonatomic) NSString  *img;
@property (nonatomic) NSString  *img_height;
@property (nonatomic) NSString  *img_width;
@property (nonatomic) NSString  *img2;
@property (nonatomic) NSString  *img2_height;
@property (nonatomic) NSString  *img2_width;
@property (nonatomic) NSString  *img3;
@property (nonatomic) NSString  *img3_height;
@property (nonatomic) NSString  *img3_width;
@property (nonatomic) NSString  *img4;
@property (nonatomic) NSString  *img4_height;
@property (nonatomic) NSString  *img4_width;
@property (nonatomic) NSString  *is_long;
@end

@interface RankingListFeatureShowImgLogoModel : NSObject
@property (nonatomic) NSString  *img;
@property (nonatomic) NSString  *img_height;
@property (nonatomic) NSString  *img_width;
@property (nonatomic) NSString  *img2;
@property (nonatomic) NSString  *img2_height;
@property (nonatomic) NSString  *img2_width;
@property (nonatomic) NSString  *img3;
@property (nonatomic) NSString  *img3_height;
@property (nonatomic) NSString  *img3_width;
@property (nonatomic) NSString  *img4;
@property (nonatomic) NSString  *img4_height;
@property (nonatomic) NSString  *img4_width;
@property (nonatomic) NSString  *is_long;
@end

@interface RankingListNationsImgModel : NSObject
@property (nonatomic) NSString  *img;
@property (nonatomic) NSString  *img_height;
@property (nonatomic) NSString  *img_width;
@property (nonatomic) NSString  *img2;
@property (nonatomic) NSString  *img2_height;
@property (nonatomic) NSString  *img2_width;
@property (nonatomic) NSString  *img3;
@property (nonatomic) NSString  *img3_height;
@property (nonatomic) NSString  *img3_width;
@property (nonatomic) NSString  *img4;
@property (nonatomic) NSString  *img4_height;
@property (nonatomic) NSString  *img4_width;
@property (nonatomic) NSString  *is_long;
@end

@interface RankingListNationsImgLogoModel : NSObject
@property (nonatomic) NSString  *img;
@property (nonatomic) NSString  *img_height;
@property (nonatomic) NSString  *img_width;
@property (nonatomic) NSString  *img2;
@property (nonatomic) NSString  *img2_height;
@property (nonatomic) NSString  *img2_width;
@property (nonatomic) NSString  *img3;
@property (nonatomic) NSString  *img3_height;
@property (nonatomic) NSString  *img3_width;
@property (nonatomic) NSString  *img4;
@property (nonatomic) NSString  *img4_height;
@property (nonatomic) NSString  *img4_width;
@property (nonatomic) NSString  *is_long;
@end

@interface RankingListTopImgModel : NSObject
@property (nonatomic) NSString  *img;
@property (nonatomic) NSString  *img_height;
@property (nonatomic) NSString  *img_width;
@property (nonatomic) NSString  *img2;
@property (nonatomic) NSString  *img2_height;
@property (nonatomic) NSString  *img2_width;
@property (nonatomic) NSString  *img3;
@property (nonatomic) NSString  *img3_height;
@property (nonatomic) NSString  *img3_width;
@property (nonatomic) NSString  *img4;
@property (nonatomic) NSString  *img4_height;
@property (nonatomic) NSString  *img4_width;
@property (nonatomic) NSString  *is_long;
@end

@interface RankingListTopImgLogoModel : NSObject
@property (nonatomic) NSString  *img;
@property (nonatomic) NSString  *img_height;
@property (nonatomic) NSString  *img_width;
@property (nonatomic) NSString  *img2;
@property (nonatomic) NSString  *img2_height;
@property (nonatomic) NSString  *img2_width;
@property (nonatomic) NSString  *img3;
@property (nonatomic) NSString  *img3_height;
@property (nonatomic) NSString  *img3_width;
@property (nonatomic) NSString  *img4;
@property (nonatomic) NSString  *img4_height;
@property (nonatomic) NSString  *img4_width;
@property (nonatomic) NSString  *is_long;
@end
