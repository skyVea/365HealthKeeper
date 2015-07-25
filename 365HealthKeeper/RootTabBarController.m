//
//  RootTabBarController.m
//  365HealthKeeper
//
//  Created by lanou3g on 15/7/25.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "RootTabBarController.h"
#import "DrugTableViewController.h"
#import "RoundTableViewController.h"
#import "NewsTableViewController.h"
#import "MineViewController.h"

@interface RootTabBarController ()

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    //添加items到tabbar
    DrugTableViewController *drugVC = [[DrugTableViewController alloc] init];
    
    UINavigationController *drugNC = [[UINavigationController alloc] initWithRootViewController:drugVC];
    drugVC.title = @"对症选药";

    RoundTableViewController *roundVC = [[RoundTableViewController alloc] init];
    UINavigationController *roundNC = [[UINavigationController alloc] initWithRootViewController:roundVC];
    roundVC.title = @"附近";
    
    NewsTableViewController *newsVC = [[NewsTableViewController alloc] init];
    UINavigationController *newsNC = [[UINavigationController alloc] initWithRootViewController:newsVC];
    newsVC.title = @"健康科普";
    
    MineViewController *mineVC = [[MineViewController alloc] init];
//    UINavigationController *newsNC = [[UINavigationController alloc] initWithRootViewController:newsVC];
    mineVC.title = @"我的";
    
    self.viewControllers = @[drugNC,roundNC,newsNC,mineVC];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
