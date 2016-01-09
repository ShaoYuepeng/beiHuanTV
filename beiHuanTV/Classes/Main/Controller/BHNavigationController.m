//
//  BHNavigationController.m
//  beiHuanTV
//
//  Created by 丫了个P on 16/1/3.
//  Copyright © 2016年 邵岳鹏. All rights reserved.
//

#import "BHNavigationController.h"


#import "UIBarButtonItem+Item.h"


@interface BHNavigationController ()

@end

@implementation BHNavigationController

+ (void)load
{
   
    // 获取全局导航条
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    // 设置导航条标题字体
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    
    // 字体
    attr[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    
    [navBar setTitleTextAttributes:attr];
    
    // 设置导航条背景图片
    // iOS9之前,如果使用了UIBarMetricsDefault,默认导航控制器的根控制器的尺寸,会少64的高度.
    // UIBarMetricsDefault:必须设置默认
    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 不是根控制器才需要设置
    if (self.childViewControllers.count > 0) {
        
        // 覆盖掉了系统的返回按钮,滑动返回功能失效
        // 为什么失效? 1.排除手势就没有了 2.手势代理做了事情
        
        // 不是根控制器
        // 设置返回按钮
        // 设置返回按钮,左边按钮
        UIBarButtonItem *backItem = [UIBarButtonItem backItemWithImage:[UIImage imageNamed:@"navigationButtonReturn"] highImage:[UIImage imageNamed:@"navigationButtonReturnClick"] target:self action:@selector(back) norColor:[UIColor blackColor] highColor:[UIColor redColor] title:@"返回"];
        
        viewController.navigationItem.leftBarButtonItem = backItem;
        
        
        //        NSLog(@"%@",self.interactivePopGestureRecognizer.delegate);
    }
    
    // 这个方法才是真正跳转
    [super pushViewController:viewController animated:animated];
}

// 点击返回按钮,回到上一个界面
- (void)back
{
    // self -> 导航控制器
    [self popViewControllerAnimated:YES];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    
    // 控制手势什么时候触发
    pan.delegate = self;
    
    // 全屏滑动返回
    [self.view addGestureRecognizer:pan];
    
    // 2.禁止边缘手势
    self.interactivePopGestureRecognizer.enabled = NO;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIGestureRecognizerDelegate
// 控制手势是否触发
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    
    // 根控制器的时候
    return self.childViewControllers.count != 1;
    
}



@end
