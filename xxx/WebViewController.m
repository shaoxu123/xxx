//
//  WebViewController.m
//  xxx
//
//  Created by dc008 on 15/10/30.
//  Copyright (c) 2015年 shaoxu. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

- (IBAction)retreat:(id)sender;
- (IBAction)advance:(UIButton *)sender;
- (IBAction)Thumbup:(UIButton *)sender;
- (IBAction)share:(UIButton *)sender;
- (IBAction)popNewsListTouch:(id)sender;


@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *urlString = [user valueForKey:@"newsUrl"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    [_webView reload];
    

    
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


- (IBAction)retreat:(id)sender {
    [_webView goBack];
}

- (IBAction)advance:(UIButton *)sender {
    [_webView goForward];
}

- (IBAction)Thumbup:(UIButton *)sender {
}

- (IBAction)share:(UIButton *)sender {
}
- (IBAction)popNewsListTouch:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"返回主页面");
    }];
}

@end

