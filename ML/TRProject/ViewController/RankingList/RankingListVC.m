//
//  RankingListVC.m
//  TRProject
//
//  Created by Yang Xiong on 12/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import "RankingListVC.h"
#import "RankingListMainCell.h"

@class RankingListVC;

@interface RankingListVC () <RankingListMainCellDelegate,  RankingListFeatureCelllDelegate,  RankingListAdvisersCellDelegate>
@property (nonatomic) RankingListMainViewModel  *rankingListVM;
@property (nonatomic) UIColor  *backColor;
@end

@implementation RankingListVC
-(UIColor *)backColor
{
    return [UIColor  colorWithRed:245.f  /  255.f green:245.f  /  255.f blue:245.f  /  255.f  alpha:1.f];
}


#pragma mark  -m  RankingListMainCellDelegate
-(NSInteger)numberOfItemInRankingListMainCell:(RankingListMainCell *)rankingListMainCell
{
    return [self.rankingListVM  itemNumberForRow:rankingListMainCell.indexPath.row];
}

-(NSURL *)rankinglistMainCell:(RankingListMainCell *)rankingListMainCell iconAtIndex:(NSInteger)index
{
    return [self.rankingListVM  iconAtIndex:index row:rankingListMainCell.indexPath.row];
}


#pragma mark  -m  RankingListFeatureCelllDelegate
-(NSInteger)numberOfItemInRankingListFeatureCell:(RankingListFeatureCell *)rankingListFeatureCell
{
    
    return [self.rankingListVM  featureNumberForRow:rankingListFeatureCell.indexPath.row itemNumberForSection:rankingListFeatureCell.indexPath.section];
}

-(NSURL *)rankingListFeatureCellImageIV:(RankingListFeatureCell *)rankingListFeatureCell iconAtIndex:(NSInteger)index
{
    return [self.rankingListVM  featureProductsURLAtIndex:index sectionIndex:rankingListFeatureCell.indexPath.section row:rankingListFeatureCell.indexPath.row];
}

-(NSString *)rankingListFeatureCellTopText:(RankingListFeatureCell *)rankingListFeatureCell topTextIndex:(NSInteger)index
{
    return [self.rankingListVM  featureProductsInfoAtIndex:index sectionIndex:rankingListFeatureCell.indexPath.section row:rankingListFeatureCell.indexPath.row];
}

-(NSString *)rankingListFeatureCellTopLevel:(RankingListFeatureCell *)rankingListFeatureCell topLevelIndex:(NSInteger)index
{
    return [self.rankingListVM  featureProductsLevelAtIndex:index row:rankingListFeatureCell.indexPath.row];
}

#pragma mark  -m  RankingListAdvisersCelllDelegate
-(NSInteger)numberOfItemInRankingListAdvisersCell:(RankingListAdvisersCell *)rankingListAdvisersCell
{
    return  [self.rankingListVM  advisersNumberForRow:rankingListAdvisersCell.indexPath.row];
}

-(NSURL *)rankingListAdvisersCellAvatorIV:(RankingListAdvisersCell *)rankingListAdvisersCell iconAtIndex:(NSInteger)index
{
    return  [self.rankingListVM  advisersAvatorIvURLAtIndex:index  Row:rankingListAdvisersCell.indexPath.row];
}

-(NSString *)rankingListAdvisersCellAdvisersName:(RankingListAdvisersCell *)rankingListAdvisersCell advisersNameIndex:(NSInteger)index
{
    return  [self.rankingListVM  advisersNameAtIndex:index  Row:rankingListAdvisersCell.indexPath.row];
}

-(NSString *)rankingListAdvisersCellAdvisersInfo:(RankingListAdvisersCell *)rankingListAdvisersCell advisersInfoIndex:(NSInteger)index
{
    return  [self.rankingListVM  advisersInfoAtIndex:index  Row:rankingListAdvisersCell.indexPath.row];
}


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
    
    self.tableView.separatorStyle = NO;
    self.tableView.backgroundColor  =  self.backColor;

    
    // 自定义搜索栏
    //[self  setNavigation];

    self.navigationItem.title  =  @"排行榜";
    [self.tableView  registerClass:[RankingListMainCell  class] forCellReuseIdentifier:@"cell"];
    [self.tableView  registerClass:[RankingListFeatureCell  class] forCellReuseIdentifier:@"featureCell"];
    [self.tableView  registerClass:[RankingListNationsViewCell  class] forCellReuseIdentifier:@"NationsCell"];
    [self.tableView  registerClass:[RankingListAdvisersCell  class] forCellReuseIdentifier:@"AdvisersCell"];
    
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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.rankingListVM.rowNumber;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    if (indexPath.section  == 0)
    {
        RankingListMainCell  *cell  = [tableView  dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        [cell.topButton  enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"%@",[self.rankingListVM topButton][idx]);
            [obj setBackgroundImageWithURL:[self.rankingListVM topButton][idx] forState:UIControlStateNormal options:NO];
            obj.tag  =  idx;
            [obj  addTarget:self action:@selector(rankingListHeaderVC:) forControlEvents:UIControlEventTouchUpInside];
        }];
        
        
        cell.totalDes.attributedText  =  [self.rankingListVM  totalDesString];
        
        cell.delegate  =  self;
        cell.indexPath  =  indexPath;
        [cell.collecitonView  reloadData];
        // 重置滚动视图的位置
        [cell.collecitonView  setContentOffset:CGPointZero];
        
        
        return cell;
    }

    if (indexPath.section  == 1) {
        RankingListFeatureCell  *cell  = [tableView  dequeueReusableCellWithIdentifier:@"featureCell" forIndexPath:indexPath];
        
        [cell.featureIV  setBackgroundImageWithURL:[self.rankingListVM  featureIvURLForRow:((indexPath.section)  -  1)] forState:UIControlStateNormal options:NO];
        
        cell.delegate  =  self;
        cell.sectionIndex  =  indexPath.section;
        cell.indexPath  =  indexPath;
        [cell.collectionView  reloadData];
        // 重置滚动视图的位置
        [cell.collectionView  setContentOffset:CGPointZero];
        
        return cell;
    }
    if (indexPath.section  ==  2)
    {
        RankingListFeatureCell  *cell  = [tableView  dequeueReusableCellWithIdentifier:@"featureCell" forIndexPath:indexPath];
        
        [cell.featureIV  setBackgroundImageWithURL:[self.rankingListVM  featureIvURLForRow:((indexPath.section)  -  1)] forState:UIControlStateNormal options:NO];
        
        cell.delegate  =  self;
        cell.sectionIndex  =  indexPath.section ;
        cell.indexPath  =  indexPath;
        [cell.collectionView  reloadData];
        // 重置滚动视图的位置
        [cell.collectionView  setContentOffset:CGPointZero];
        
        return cell;
    }
    if (indexPath.section  ==  self.rankingListVM.rowNumber  -  1)
    {
        RankingListAdvisersCell  *cell  =  [tableView  dequeueReusableCellWithIdentifier:@"AdvisersCell" forIndexPath:indexPath];
        
        NSString  *str  = [self.rankingListVM  advisersStrat];
        cell.adviserNameStarLeft.image  =  [UIImage  imageNamed:str];
        cell.adviserNameStarRight.image  =  [UIImage  imageNamed:str];
        cell.titleLB.text  =  [self.rankingListVM  advisersTitle];
        
        cell.delegate  =  self;
        cell.indexPath  =  indexPath;
        [cell.collectionView  reloadData];
        
        [cell.collectionView  setContentOffset:CGPointZero];
        
        return cell;
    }
    
    RankingListFeatureCell  *cell  = [tableView  dequeueReusableCellWithIdentifier:@"featureCell" forIndexPath:indexPath];
    
    [cell.featureIV  setBackgroundImageWithURL:[self.rankingListVM  detailIvURLForRow:indexPath.section-  3] forState:UIControlStateNormal options:NO];
    
    cell.delegate  =  self;
    cell.sectionIndex  =  indexPath.section ;
    cell.indexPath  =  indexPath;
    [cell.collectionView  reloadData];
    // 重置滚动视图的位置
    [cell.collectionView  setContentOffset:CGPointZero];


    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section  ==  0)
    {
        return (kHight  *  (645.f  /  1132.f));
    }
    if (indexPath.section  ==  2)
    {
        return kHight  *  (775.f  /  1132.f);
    }
    if (indexPath.section  ==  self.rankingListVM.rowNumber  -  1)
    {
        return kHight  *  (500.f  /  1132.f);
    }
    
    return kHight  *  (740.f  /  1132.f);
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section  == 0)
    {
        return 0.f;
    }
    if (section  == 1)
    {
        return 0.f;
    }
    return kHight  *  (25.f  /  1132.f);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView  deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
//    [self  setNavigation];
}

#pragma mark  -m  setNavigationSearch
-(void)setNavigation
{
    RankingListSearch  *search =  [RankingListSearch  new];
    search.searchText.placeholder  =  @"搜产品/功效/品牌";
    [search.searchScanBtn  setImage:[UIImage  imageNamed:@"icon_bar_search_qr"] forState:UIControlStateNormal];
    search.searchGraph.image  =  [UIImage  imageNamed:@"icon_bar_search"];
    
    UIView  *view  =  [UIView  new];
    view.frame  =  CGRectMake(0.f, 0.f, 100.f, 64.f);
    view.backgroundColor  =  [UIColor  redColor];
    
    self.navigationItem.title = @"dsad";
    
}

-(void)rankingListHeaderVC:sender
{
    UIButton  *topBtn  =  (UIButton  *)sender;
    
    RankingListHeaderViewController  *rankingListHeaderVC  =  [[RankingListHeaderViewController  alloc]init];
    rankingListHeaderVC.headerBtnTag  =  topBtn.tag;
    
    
    
    RankingListHeaderViewModel  *viewModel =[RankingListHeaderViewModel  new];
    viewModel.btnTag  =  topBtn.tag;
    
    NSLog(@"********头部 Model 的下标值是：%ld  ******************", viewModel.btnTag);

    
    [self.navigationController   pushViewController:rankingListHeaderVC animated:YES];
}

@end
