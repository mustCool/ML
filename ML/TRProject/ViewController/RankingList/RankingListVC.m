//
//  RankingListVC.m
//  TRProject
//
//  Created by Yang Xiong on 12/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import "RankingListVC.h"

@interface RankingListVC ()
@property (nonatomic) RankingListMainViewModel  *rankingListVM;
@end

@implementation RankingListVC

-(RankingListMainViewModel *)rankingListVM
{
    if (!_rankingListVM)
    {
        _rankingListVM  =  [[RankingListMainViewModel  alloc] init];
    }
    return _rankingListVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.title  =  @"排行榜";
    [self.tableView  registerClass:[RankingListMainCell  class] forCellReuseIdentifier:@"cell"];
    
    self.tableView.mj_header  =  [MJRefreshNormalHeader  headerWithRefreshingBlock:^{
        [self.rankingListVM getDataWithRequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
            [self.tableView.mj_header  endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer  =  [MJRefreshBackFooter  footerWithRefreshingBlock:^{
        [self.rankingListVM  getDataWithRequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
            [self.tableView.mj_footer  endRefreshing];
            [self.tableView  reloadData];
        }];
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RankingListMainCell  *cell  = [tableView  dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell.topButton  enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [obj  setBackgroundImage:[self.rankingListVM topButton[0]] forState:UIControlStateNormal];
    }];
    return cell;
}


@end
