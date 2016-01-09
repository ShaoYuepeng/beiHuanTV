//
//  BHVideoViewController.m
//  beiHuanTV
//
//  Created by 丫了个P on 16/1/2.
//  Copyright © 2016年 邵岳鹏. All rights reserved.
//

#import "BHVideoViewController.h"

@interface BHVideoViewController ()

@end

@implementation BHVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"录像";
    
    self.view.backgroundColor = [UIColor redColor];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}


@end
