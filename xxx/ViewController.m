//
//  ViewController.m
//  xxx
//
//  Created by dc008 on 15/10/29.
//  Copyright (c) 2015年 shaoxu. All rights reserved.
//

#import "ViewController.h"
#import "ContentTableViewController.h"
@interface ViewController ()<UIScrollViewDelegate>
{
    ContentTableViewController *contentTable1;
    ContentTableViewController *contentTable2;
    ContentTableViewController *contentTable3;
    ContentTableViewController *contentTable4;
    ContentTableViewController *contentTable5;
    ContentTableViewController *contentTable6;
    ContentTableViewController *contentTable7;
    ContentTableViewController *contentTable8;
    
    NSArray *newsTypeArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    newsTypeArray = [NSArray arrayWithObjects:@"5572a109b3cdc86cf39001db",@"5572a109b3cdc86cf39001de",@"5572a109b3cdc86cf39001e3",@"5572a109b3cdc86cf39001e0",@"5572a109b3cdc86cf39001e6",@"5572a109b3cdc86cf39001e5",@"5572a10ab3cdc86cf39001ee",@"5572a108b3cdc86cf39001d4",nil];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
    _titleBtnScroll.contentSize = CGSizeMake(750, 40);
   
    _titleBtnScroll.bounces = YES;
    _titleBtnScroll.showsHorizontalScrollIndicator = NO;
    _contentScroll.contentSize = CGSizeMake(3000, 558);
    _contentScroll.showsHorizontalScrollIndicator = NO;
    _contentScroll.pagingEnabled = YES;
    _btnView = [[UIView alloc]initWithFrame:CGRectMake(0, 37, 94, 3)];
    _btnView.backgroundColor = [UIColor grayColor];
    
    [self.titleBtnScroll addSubview:_btnView];
    contentTable1 = [self loadTableView:contentTable1 andView:self.view1];
    contentTable2 = [self loadTableView:contentTable2 andView:self.view2];
    contentTable3 = [self loadTableView:contentTable3 andView:self.view3];
    contentTable4 = [self loadTableView:contentTable4 andView:self.view4];
    contentTable5 = [self loadTableView:contentTable5 andView:self.view5];
    contentTable6 = [self loadTableView:contentTable6 andView:self.view6];
    contentTable7 = [self loadTableView:contentTable7 andView:self.view7];
    contentTable8 = [self loadTableView:contentTable8 andView:self.view8];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
int tag = 0;
-(ContentTableViewController *)loadTableView:(ContentTableViewController *)childController andView:(UIView *)buttomView{
    
    
    childController = [self.storyboard instantiateViewControllerWithIdentifier:@"TableViewController"];
    
    childController.view.frame = buttomView.bounds;
    childController.view.tag = tag++;
    
    [self addChildViewController:childController];
    
    [buttomView addSubview:childController.view];
    
    return childController;


}
- (IBAction)titleBtnClick:(UIButton *)sender {
//    if (sender.selected == NO) {
        [self.contentScroll setContentOffset:CGPointMake(self.contentScroll.frame.size.width*(sender.tag-1), 0) animated:YES];
//    }
    NSArray *array = [self childViewControllers];
    
    for (ContentTableViewController *controller in array) {
        NSLog(@"%ld",(long)controller.view.tag);
        [controller loadNewsDtaWithChannelId:newsTypeArray[controller.view.tag] andPage:1];
        
    }

    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    float width = self.contentScroll.frame.size.width;
    float x = self.contentScroll.contentOffset.x;
    int i = x/width;
    
    
    if (i<=4) {
        CGRect rect = self.btnView.frame;
        rect.origin.x = 94*i;
        self.btnView.frame = rect;
        [self.titleBtnScroll setContentOffset:CGPointMake(94*(i), 0) animated:YES];
    }else{
        CGRect rect = self.btnView.frame;
        rect.origin.x = 94*i;
        self.btnView.frame = rect;
        
    }
    
    
  
   

    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{

//    NSLog(@"%d",decelerate);
//    float width = self.contentScroll.frame.size.width;
//    float x = self.contentScroll.contentOffset.x;
//    int i = x/width;
    
//    NSString *channelID = newsTypeArray[i];
    //    5572a109b3cdc86cf39001de
    
    NSArray *array = [self childViewControllers];
    
    for (ContentTableViewController *controller in array) {
        NSLog(@"%ld",(long)controller.view.tag);
        [controller loadNewsDtaWithChannelId:newsTypeArray[controller.view.tag] andPage:1];
        
    }
}
@end
