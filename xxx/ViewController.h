//
//  ViewController.h
//  xxx
//
//  Created by dc008 on 15/10/29.
//  Copyright (c) 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *titleBtnScroll;
- (IBAction)titleBtnClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScroll;
@property (strong, nonatomic) UIView *btnView;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (weak, nonatomic) IBOutlet UIView *view4;
@property (weak, nonatomic) IBOutlet UIView *view5;
@property (weak, nonatomic) IBOutlet UIView *view6;
@property (weak, nonatomic) IBOutlet UIView *view7;
@property (weak, nonatomic) IBOutlet UIView *view8;



@end

