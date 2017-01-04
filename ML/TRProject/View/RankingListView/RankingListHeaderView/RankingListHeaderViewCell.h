//
//  RankingListHeaderViewCell.h
//  TRProject
//
//  Created by Yang Xiong on 29/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankingListHeaderViewCell : UITableViewCell
@property  (nonatomic)  UIImageView  *headerIV;

@property  (nonatomic)  UIImageView  *productsIV;
@property  (nonatomic)  UIImageView  *productsLevel;
@property  (nonatomic)  UILabel      *shortName;
@property  (nonatomic)  UILabel      *priceLB;
@property  (nonatomic)  UILabel      *special;
@end
