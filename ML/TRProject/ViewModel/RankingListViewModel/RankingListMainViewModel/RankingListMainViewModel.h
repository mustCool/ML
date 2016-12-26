//
//  RankingListMainViewModel.h
//  TRProject
//
//  Created by tarena15 on 2016/12/15.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef   NS_ENUM(NSUInteger,  RequestMode)
{
    RequestModeRefresh,
    RequestModeMore,
};

@interface RankingListMainViewModel : NSObject
-(NSArray  *)topButton;
-(NSArray  *)detailButton;

@property (nonatomic) RankingListMainModel* dataList;
@property (nonatomic) NSInteger pages;
@property (nonatomic) NSInteger rowNumber;
@property (nonatomic) NSArray  *levelPicArr;

-(NSInteger)itemNumberForRow:(NSInteger)row;
-(NSURL  *)iconAtIndex:(NSInteger)index  row:(NSInteger)row;

-(NSURL  *)detailIvURLForRow:(NSInteger)row;
-(NSURL  *)featureIvURLForRow:(NSInteger)row;
-(NSURL  *)featureProductsURLAtIndex:(NSInteger)index sectionIndex:(NSInteger)sectionIndex row:(NSInteger)row;
-(NSString  *)featureProductsInfoAtIndex:(NSInteger)index sectionIndex:(NSInteger)sectionIndex row:(NSInteger)row;
-(NSString  *)featureProductsLevelAtIndex:(NSInteger)index  row:(NSInteger)row;

-(NSInteger)detailNumberForRow:(NSInteger)row;
-(NSInteger)featureNumberForRow:(NSInteger)row  itemNumberForSection:(NSInteger)section;

-(NSURL  *)detailAtIndex:(NSInteger)index  row:(NSInteger)row;

-(NSMutableAttributedString  *)totalDesString;

-(void)getDataWithRequestMode:(RequestMode)requestMode  completionHandler:(void(^)(NSError  *error))completionHandler;
@end
