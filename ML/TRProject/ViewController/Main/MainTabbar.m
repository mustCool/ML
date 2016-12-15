//
//  MainTabbar.m
//  TRProject
//
//  Created by Yang Xiong on 15/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import "MainTabbar.h"
#import "BeautifyViewController.h"
#import "RankingListVC.h"
#import "GlobalViewController.h"
#import "MeViewController.h"


@interface MainTabbar () <UITabBarControllerDelegate>
// 变美啦
@property (nonatomic) BeautifyViewController *beautifyVC;
// 排行榜
@property (nonatomic) RankingListVC *rankingListVC;
// 全球购
@property (nonatomic) GlobalViewController *globalVC;
// 我的
@property (nonatomic) MeViewController *meVC;

// tabbar的字体颜色
@property (nonatomic) UIColor *fontColor;


// 装载 tabbar 的背景图片的 UIImageView
@property (nonatomic) UIImageView *itemSelectedBackground;
@end

@implementation MainTabbar

#pragma mark - Lazy

-(BeautifyViewController *)beautifyVC
{
    if (!_beautifyVC) {
        _beautifyVC = [BeautifyViewController new];
        _beautifyVC.title = @"变美啦";
        _beautifyVC.tabBarItem.image = [UIImage imageNamed:@"icon_tab_home"];
        _beautifyVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tab_home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }
    return _beautifyVC;

}

-(RankingListVC *)rankingListVC
{
    if (!_rankingListVC)
    {
        _rankingListVC = [RankingListVC new];
        _rankingListVC.title = @"排行榜";
        _rankingListVC.tabBarItem.image = [UIImage imageNamed:@"icon_tab_rank"];
        _rankingListVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tab_rank_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _rankingListVC;
}

-(GlobalViewController *)globalVC
{
    if (!_globalVC)
    {
        _globalVC = [GlobalViewController new];
        _globalVC.title = @"全球购";
        _globalVC.tabBarItem.image = [UIImage imageNamed:@"icon_tab_mall"];
        _globalVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tab_mall_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _globalVC;
}

-(MeViewController *)meVC
{
    if (!_meVC)
    {
        _meVC = [MeViewController new];
        _meVC.title = @"我的";
        _meVC.tabBarItem.image = [UIImage imageNamed:@"icon_tab_me"];
        _meVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tab_me_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _meVC;
}

-(UIColor *)fontColor
{
    return [UIColor colorWithRed:246.f / 255.f green:76.f / 255.f blue:116.f / 255.f alpha:1.f];
}

#pragma mark -m  MainInterface
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 把所有的主功能 VC 添加到 tabbar 中
    UINavigationController *beautifyNavi = [[UINavigationController alloc] initWithRootViewController:self.beautifyVC];
    UINavigationController *rankingListNavi = [[UINavigationController alloc] initWithRootViewController:self.rankingListVC];
    UINavigationController *gloablNavi = [[UINavigationController alloc] initWithRootViewController:self.globalVC];
    UINavigationController *meNavi = [[UINavigationController alloc] initWithRootViewController:self.meVC];
    self.viewControllers = @[beautifyNavi, rankingListNavi, gloablNavi, meNavi];
    
    //设置了全局的所有tabbarItem的文字样式. 选中时的
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: self.fontColor, NSFontAttributeName:[UIFont systemFontOfSize:35]} forState:UIControlStateSelected];
    
}

// 实现 tabbar 的代理方法
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSInteger index = tabBarController.selectedIndex;
    self.itemSelectedBackground.frame = CGRectMake(index * [UIScreen mainScreen].bounds.size.width / 5, 0, [UIScreen mainScreen].bounds.size.width / 5, 48);
}

@end
