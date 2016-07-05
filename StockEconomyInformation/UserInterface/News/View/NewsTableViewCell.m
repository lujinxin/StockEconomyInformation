//
//  NewsTableViewCell.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/19.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation NewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setNewsListModel:(NewsListModel *)newsListModel {
    if (_newsListModel != newsListModel) {
        _newsListModel = newsListModel;
        _titleLabel.text = _newsListModel.title;
        _timeLabel.text = _newsListModel.time;
        _srcLabel.text = _newsListModel.src;
        [_picImageView sd_setImageWithURL:[NSURL URLWithString:_newsListModel.pic] placeholderImage:[UIImage imageNamed:@"news.png"]];
        
    }
    
    
    
    
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
