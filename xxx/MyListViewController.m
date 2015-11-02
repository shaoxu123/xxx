//
//  MyListViewController.m
//  xxx
//
//  Created by dc008 on 15/11/2.
//  Copyright (c) 2015年 shaoxu. All rights reserved.
//

#import "MyListViewController.h"

@interface MyListViewController ()

@end

@implementation MyListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _headerBtn.layer.cornerRadius = 40;
    _headerBtn.layer.masksToBounds = YES;
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
