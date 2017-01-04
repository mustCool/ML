//
//  RankingListHeaderViewModel.h
//  TRProject
//
//  Created by Yang Xiong on 29/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RankingListHeaderViewModel : NSObject

@property  (nonatomic)  RankingListHeaderModel  *headerList;
@property  (nonatomic)  NSInteger  btnTag;



-(NSInteger)getSectionOfNumber;
-(NSInteger)getCellOfNumber;

-(NSURL  *)getHeadrIconUrl;
-(NSURL  *)getProdutsIVURLID:(NSInteger)sectionNumber row:(NSInteger)row;
-(NSString *)getShortNameString:(NSInteger)sectionNumber row:(NSInteger)row;
-(NSString *)getPriceString:(NSInteger)sectionNumber row:(NSInteger)row;
-(NSString *)getSpecialString:(NSInteger)sectionNumber row:(NSInteger)row;

-(void)getDataWithcompletionHandler:(void(^)(NSError  *error))completionHandler;
@end
