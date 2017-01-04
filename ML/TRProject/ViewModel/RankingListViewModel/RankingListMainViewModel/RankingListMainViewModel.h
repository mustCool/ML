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

/* detail  ViewModel */
-(NSURL  *)detailIvURLForRow:(NSInteger)row;
-(NSInteger)detailNumberForRow:(NSInteger)row;
-(NSURL  *)detailAtIndex:(NSInteger)index  row:(NSInteger)row;

/* feature  ViewModel */
-(NSURL  *)featureIvURLForRow:(NSInteger)row;
-(NSURL  *)featureProductsURLAtIndex:(NSInteger)index sectionIndex:(NSInteger)sectionIndex row:(NSInteger)row;
-(NSString  *)featureProductsInfoAtIndex:(NSInteger)index sectionIndex:(NSInteger)sectionIndex row:(NSInteger)row;
-(NSString  *)featureProductsLevelAtIndex:(NSInteger)index  row:(NSInteger)row;
-(NSInteger)featureNumberForRow:(NSInteger)row  itemNumberForSection:(NSInteger)section;

/* adviser  ViewModel */
-(NSInteger)advisersNumberForRow:(NSInteger)row;
-(NSURL  *)advisersAvatorIvURLAtIndex:(NSInteger)index  Row:(NSInteger)row;
-(NSString  *)advisersNameAtIndex:(NSInteger)index  Row:(NSInteger)row;
-(NSString  *)advisersInfoAtIndex:(NSInteger)index  Row:(NSInteger)row;
-(NSString  *)advisersTitle;
-(NSString  *)advisersStrat;

-(NSMutableAttributedString  *)totalDesString;

-(void)getDataWithRequestMode:(RequestMode)requestMode  completionHandler:(void(^)(NSError  *error))completionHandler;
@end
