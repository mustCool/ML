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

- (void)viewDidLoad {
    [super viewDidLoad];
    //修改所有item的选中状态时的默认文字颜色
    
    
    // Do any additional setup after loading the view.
    UINavigationController *beautifyNavi = [[UINavigationController alloc] initWithRootViewController:self.beautifyVC];
    UINavigationController *rankingListNavi = [[UINavigationController alloc] initWithRootViewController:self.rankingListVC];
    UINavigationController *gloablNavi = [[UINavigationController alloc] initWithRootViewController:self.globalVC];
    UINavigationController *meNavi = [[UINavigationController alloc] initWithRootViewController:self.meVC];
    self.viewControllers = @[beautifyNavi, rankingListNavi, gloablNavi, meNavi];
      //设置了全局的所有tabbarItem的文字样式. 选中时的
        [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: self.fontColor, NSFontAttributeName:[UIFont systemFontOfSize:35]} forState:UIControlStateSelected];
    
    //[self.tabBar setBarTintColor: [UIColor clearColor]];
    //[self.tabBar setTintColor:[UIColor whiteColor]];
    //[self.tabBar setBackgroundColor:[UIColor whiteColor]];
    //self.tabBarController.tabBar.tintColor = [UIColor whiteColor];
    //self.tabBarItem.image = [UIImage imageNamed:@""];
    
    
    // 遵守 tabbar 的代理协议
    //self.delegate = self;
    
    // 添加选中的背景
    //self.itemSelectedBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TabBar_Background_Highlight_150x100_"]];
    
    //self.itemSelectedBackground.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width / 5, 48);
    //[self.tabBar insertSubview:self.itemSelectedBackground atIndex:0];
    //self.tabBar.opaque = YES;
    
}

// 实现 tabbar 的代理方法
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSInteger index = tabBarController.selectedIndex;
    self.itemSelectedBackground.frame = CGRectMake(index * [UIScreen mainScreen].bounds.size.width / 5, 0, [UIScreen mainScreen].bounds.size.width / 5, 48);
}

@end
