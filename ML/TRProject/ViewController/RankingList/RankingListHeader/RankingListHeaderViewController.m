//
//  RankingListHeaderViewController.m
//  TRProject
//
//  Created by Yang Xiong on 28/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import "RankingListHeaderViewController.h"

@interface RankingListHeaderViewController ()
@property  (nonatomic)  RankingListHeaderViewModel  *rankingListHeaderVM;
@property  (nonatomic)  UIButton  *comeBackView;
@end

@implementation RankingListHeaderViewController

-(RankingListHeaderViewModel *)rankingListHeaderVM
{
    if (!_rankingListHeaderVM)
    {
        _rankingListHeaderVM  =  [[RankingListHeaderViewModel  alloc] init] ;
        //_rankingListHeaderVM.btnTag  =  self.headerBtnTag;
    }
    return _rankingListHeaderVM;
}

-(UIButton *)comeBackView
{
    if (!_comeBackView)
    {
        _comeBackView  =  [UIButton  new];
        [self.view  addSubview:_comeBackView];
        [_comeBackView  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(kWidth  *  (40.f  /  640.f));
            make.height.equalTo(kHight  *  (40.f  /  1132.f));
            make.top.equalTo(kHight  *  (28.f  /  1132.f));
            make.left.equalTo(kWidth  *  (20.f  /  1132.f));
        }];
        [_comeBackView  setImage:[UIImage  imageNamed:@"back"] forState:UIControlStateNormal];
    }
    return _comeBackView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView  registerClass:[RankingListHeaderViewCell  class] forCellReuseIdentifier:@"rankingListHeaderViewCell"];
    
    //self.tableView.mj_header  =  [MJRefreshNormalHeader  headerWithRefreshingBlock:^{
        [self.rankingListHeaderVM getDataWithcompletionHandler:^(NSError *error) {
            
            //[self.tableView.mj_header  endRefreshing];
            [self.tableView reloadData];
        }];
    //}];
    //[self.tableView.mj_header beginRefreshing];
    
    [self.comeBackView addTarget:self action:@selector(comeback:) forControlEvents:UIControlEventTouchUpInside];

}

-(void)comeback:sender
{
    [self.navigationController  popViewControllerAnimated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"一共有%ld个分区",  [self.rankingListHeaderVM  getSectionOfNumber]);
    return  [self.rankingListHeaderVM  getSectionOfNumber];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section  ==  0)
    {
        return 1;
    }
    else
    {
        NSLog(@"###############%ld##############",  [self.rankingListHeaderVM  getCellOfNumber]);
        return [self.rankingListHeaderVM  getCellOfNumber];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.section  ==  0)
    {
        RankingListHeaderViewCell  *cell  =  [tableView  dequeueReusableCellWithIdentifier:@"rankingListHeaderViewCell" forIndexPath:indexPath];

        NSLog(@"###############%@##############",  [self.rankingListHeaderVM  getHeadrIconUrl]);
        [cell.headerIV  setImageURL:[self.rankingListHeaderVM  getHeadrIconUrl]];
            return cell;
    }
    
    RankingListHeaderViewCell  *cell  =  [tableView  dequeueReusableCellWithIdentifier:@"rankingListHeaderViewCell" forIndexPath:indexPath];
    
    [cell.productsIV  setImageURL:[self.rankingListHeaderVM  getProdutsIVURLID:indexPath.section row:indexPath.row]];
    cell.shortName.text  =  [self.rankingListHeaderVM  getShortNameString:indexPath.section row:indexPath.row];
    cell.priceLB.text  =  [self.rankingListHeaderVM   getPriceString:indexPath.section row:indexPath.row];
    cell.special.text  =  [self.rankingListHeaderVM  getSpecialString:indexPath.row row:indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section  ==  0)
    {
        return   kHight  *  (328.f  /   1132.f);
    }
    return  kHight  *  (1407.f  /  1132.f);
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section  == 0)
    {
        return 0.f;
    }
    //if (section  == 1)
    //{
    //    return 0.f;
    //}
    return kHight  *  (25.f  /  1132.f);
}


@end
