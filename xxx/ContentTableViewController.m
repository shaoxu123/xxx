//
//  contentTableViewController.m
//  xxx
//
//  Created by dc008 on 15/10/29.
//  Copyright (c) 2015年 shaoxu. All rights reserved.
//

#import "ContentTableViewController.h"
#import "ContentCell.h"
#import "MJExtension.h"
#import "News.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "MBProgressHUD.h"
#import "MJRefresh.h"
#define HTTP @"http:apis.baidu.com/showapi_open_bus/channel_news/search_news"
#define KEY @"0cec0528c89705ad884bdab8dcd24089"
#import "WebViewController.h"



@interface ContentTableViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong) AFHTTPRequestOperationManager *manager;
@property(nonatomic,strong)NSMutableArray *newsArray;

@property(nonatomic,strong)UIPageControl *pageControl;
@property(nonatomic,strong)NSString *ChannelId;
@property(nonatomic,strong)UIScrollView *scrollView;

@end

@implementation ContentTableViewController
int page = 1;
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view]
//     Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    _manager = [AFHTTPRequestOperationManager manager];
//    NSArray *newsTypeArray = [NSArray arrayWithObjects:@"5572a109b3cdc86cf39001db",@"5572a109b3cdc86cf39001de",@"5572a109b3cdc86cf39001e3",@"5572a109b3cdc86cf39001e0",@"5572a109b3cdc86cf39001e6",@"5572a109b3cdc86cf39001e5",@"5572a10ab3cdc86cf39001ee",@"5572a108b3cdc86cf39001d4",nil];
    
    [self loadNewsDtaWithChannelId:@"5572a109b3cdc86cf39001db" andPage:1];
    [self initHeaderScroll];

    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadNewsDtaWithChannelId:_ChannelId andPage:1];
    }];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadNewsDtaWithChannelId:_ChannelId andPage:++page];
    }];
//
}
-(void)initHeaderScroll{

    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20, 375, 180)];
    _scrollView.contentSize = CGSizeMake(375*5, 200);
    _scrollView.backgroundColor = [UIColor grayColor];
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    self.tableView.tableHeaderView = _scrollView;
    for (int i = 0; i<6; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0+375*i, 0, 375, 180)];
        imageView.image = [UIImage imageNamed:@"1"];
        [_scrollView addSubview:imageView];
        
        UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 150, 375, 30)];
        pageControl.backgroundColor = [UIColor redColor];
        
    }
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(175, 150, 200, 30)];
    _pageControl.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.5];
    _pageControl.numberOfPages = 5;
    _pageControl.enabled = false;
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, 150, 180, 30)];
    title.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.5];
    title.textColor = [UIColor whiteColor];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"46+656565";
    [self.view addSubview:title];
    [self.view addSubview:_pageControl];
   

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) loadNewsDtaWithChannelId:(NSString *)channelId andPage:(NSInteger)page{
    NSLog(@"%@",self);
    _ChannelId = channelId;
    //组合参数
    NSDictionary *dict = @{@"channelId":channelId,@"page":@(page)};
    //请求头
    [_manager.requestSerializer setValue:KEY forHTTPHeaderField:@"apikey"];
    
    [_manager GET:HTTP parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //获取数据
        NSDictionary *body = [responseObject valueForKey:@"showapi_res_body"];
        NSDictionary *pageBean = [body valueForKey:@"pagebean"];
        NSArray *list = [pageBean valueForKey:@"contentlist"];

        //将News对象存入数组
        _newsArray = [News objectArrayWithKeyValuesArray:list];

        [self.tableView.header endRefreshing];
        [self.tableView.footer endRefreshing];

        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _newsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Content" forIndexPath:indexPath];

    News *news = _newsArray[indexPath.row];
    if (news.imageurls.count > 0) {
        
        NSURL *ImageUrl = [NSURL URLWithString:[news.imageurls[0] valueForKey:@"url"]];
        
        [cell.newsPicture setImageWithURL:ImageUrl placeholderImage:[UIImage imageNamed:@"binnerbg"]];

    }else{
    
        cell.newsPicture.image = [UIImage imageNamed:@"binnerbg"];
    }
   cell.newsTime.text = news.pubDate;
    cell.nesTitle.text = news.title;
    cell.source.text = news.source;
    
    // Configure the cell...
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
         News *news = _newsArray[indexPath.row];
    NSString *newsUrl = news.link;
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:newsUrl forKey:@"newsUrl"];
//    [self performSegueWithIdentifier:@"nextWeb" sender:self];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     WebViewController *webController = [storyboard instantiateViewControllerWithIdentifier:@"WebView"];
    
    
    
    [self presentViewController:webController animated:YES completion:^{
        NSLog(@"跳转web成功");
    }];

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    float x = scrollView.contentOffset.x;
    int page = x/scrollView.frame.size.width;

    _pageControl.currentPage = page;


}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
