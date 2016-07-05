//
//  NewsTableViewCell.h
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/19.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsListModel.h"

@interface NewsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *srcLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *picImageView;

@property (nonatomic) NewsListModel *newsListModel;

@end
