//
//  contentTableViewController.h
//  xxx
//
//  Created by dc008 on 15/10/29.
//  Copyright (c) 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface ContentTableViewController : UITableViewController

- (void) loadNewsDtaWithChannelId:(NSString *)channelId andPage:(NSInteger)page;
@end
