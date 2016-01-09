//
//  BHTabBarController.m
//  beiHuanTV
//
//  Created by 丫了个P on 16/1/2.
//  Copyright © 2016年 邵岳鹏. All rights reserved.
//

#import "BHTabBarController.h"

#import "BHHomeViewController.h"
#import "BHVideoViewController.h"
#import "BHNewViewController.h"
#import "BHDataViewController.h"

#import "UIImage+Image.h"

#import "BHTabBar.h"


#define BSColor(r,g,b) [UIColor colorWithRed: (r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1];

#define BSTabButtonTitleFont [UIFont systemFontOfSize:12]



@interface BHTabBarController ()

@end

@implementation BHTabBarController

+ (void)load
{
    // 获取整个app中tabBarItem
    
    // appearanceWhenContainedIn:获取某个类下的UITabBarItem
    UITabBarItem *item =  [UITabBarItem appearanceWhenContainedIn:self, nil];
    
    // 1.UITabBarItem 可以使用appearance,只要遵守<UIAppearance>
    
    // 2.不是任何属性都可以使用appearance,只有标识了UI_APPEARANCE_SELECTOR这个宏的属性,才可以使用appearance修改
    //    item.title = @"我";
    
    // 3.通过appearance设置,是有条件,必须在控件显示之前设置
    
    
    // 选中
    // 设置选中标题文字颜色
    // 富文本字符串:颜色,字体,空心,阴影,图文混排
    // NSDictionary:描述字符串属性
    NSMutableDictionary *attrSel = [NSMutableDictionary dictionary];
    // 字体
    attrSel[NSFontAttributeName] = BSTabButtonTitleFont;
    // 颜色
    attrSel[NSForegroundColorAttributeName] = BSColor(64, 64, 64);
    [item setTitleTextAttributes:attrSel forState:UIControlStateSelected];
    
    // 设置tabBarButton字体大小: 必须设置正常状态下,如果不设置,就会不好使.
    NSMutableDictionary *attrNor = [NSMutableDictionary dictionary];
    
    attrNor[NSFontAttributeName] = BSTabButtonTitleFont;
    // 颜色
    attrNor[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [item setTitleTextAttributes:attrNor forState:UIControlStateNormal];
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    //1.添加导航控制器,必须要有根控制器
    [self setUpAllChildViewController];
    //2.设置所有子控制器按钮的内容
    [self setUpAllTabButton];
    //3.创建tabBar
    BHTabBar *tabBar = [[BHTabBar alloc]init];
    
    [self setValue:tabBar forKey:@"tabBar"];
    
    
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

//添加子控制器
-(void)setUpAllChildViewController
{
    //直播
    BHHomeViewController *homeVc = [[BHHomeViewController alloc]init];
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:homeVc];
    
    [self addChildViewController:homeNav];
    
    
    //录像
    BHVideoViewController *videoVc = [[BHVideoViewController alloc]init];
    UINavigationController *videoNav = [[UINavigationController alloc]initWithRootViewController:videoVc];
    
    [self addChildViewController:videoNav];
    
    //新闻
    BHNewViewController *newVc = [[BHNewViewController alloc]init];
    UINavigationController *newNav = [[UINavigationController alloc]initWithRootViewController:newVc];
    
    [self addChildViewController:newNav];
    
    //数据
    BHDataViewController *dataVc = [[BHDataViewController alloc]init];
    UINavigationController *dataNav = [[UINavigationController alloc]initWithRootViewController:dataVc];
    
    [self addChildViewController:dataNav];

}

// 设置所有子控制器对应按钮的内容
- (void)setUpAllTabButton
{
    //直播
    UIViewController *homeVc = self.childViewControllers[0];
    homeVc.tabBarItem.title = @"直播";
    homeVc.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
    homeVc.tabBarItem.selectedImage = [UIImage imageNamedWithOriganlMode:@"tabBar_essence_click_icon"];
    
    //录像
    UIViewController *videoVc = self.childViewControllers[1];
    videoVc.tabBarItem.title = @"录像";
    videoVc.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
    videoVc.tabBarItem.selectedImage = [UIImage imageNamedWithOriganlMode:@"tabBar_me_click_icon"];
    
    //新闻
    UIViewController *newVc = self.childViewControllers[2];
    newVc.tabBarItem.title = @"新闻";
    newVc.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    newVc.tabBarItem.selectedImage = [UIImage imageNamedWithOriganlMode:@"tabBar_new_click_icon"];
    
    //数据
    UIViewController *dataVc = self.childViewControllers[3];
    dataVc.tabBarItem.title = @"数据";
    dataVc.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    dataVc.tabBarItem.selectedImage = [UIImage imageNamedWithOriganlMode:@"tabBar_friendTrends_click_icon"];
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
