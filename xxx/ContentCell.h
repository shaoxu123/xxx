//
//  ContentCell.h
//  xxx
//
//  Created by dc008 on 15/10/30.
//  Copyright (c) 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *newsPicture;
@property (weak, nonatomic) IBOutlet UILabel *nesTitle;
@property (weak, nonatomic) IBOutlet UILabel *newsTime;
@property (weak, nonatomic) IBOutlet UIImageView *commentImageView;
@property (weak, nonatomic) IBOutlet UIImageView *ThumbupImageView;
@property (weak, nonatomic) IBOutlet UILabel *commentCount;
@property (weak, nonatomic) IBOutlet UILabel *ThumbupCount;
@property (weak, nonatomic) IBOutlet UILabel *source;

@end
