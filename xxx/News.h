//
//  News.h
//  新闻频道
//
//  Created by dc006 on 15/10/29.
//  Copyright © 2015年 dc006. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

@property(nonatomic,strong) NSString *channelId;//新闻类型Id
@property(nonatomic,strong) NSString *desc;//新闻摘要
@property(nonatomic,strong) NSArray *imageurls;//新闻图片1
@property(nonatomic,strong) NSString *channelName;//新闻类型名
@property(nonatomic,strong) NSString *link;//新闻网址1
@property(nonatomic,strong) NSString *nid;//新闻编号
@property(nonatomic,strong) NSString *pubDate;//新闻发布日期1
@property(nonatomic,strong) NSString *source;//新闻来源1
@property(nonatomic,strong) NSString *title;//新闻标题1
@property(nonatomic,assign) NSInteger chinajoy;
@end
