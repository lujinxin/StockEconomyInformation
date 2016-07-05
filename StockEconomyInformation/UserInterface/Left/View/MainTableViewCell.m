//
//  MainTableViewCell.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/5/4.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "MainTableViewCell.h"

@implementation MainTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _cacheLabel = [[UILabel alloc] initWithFrame:CGRectMake(260 - 96, 2, 80, 40)];
        _cacheLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_cacheLabel];
        _cacheLabel.textAlignment = NSTextAlignmentRight;
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _cacheLabel = [[UILabel alloc] initWithFrame:CGRectMake(260 - 96, 2, 80, 40)];
    [self.contentView addSubview:_cacheLabel];
    _cacheLabel.textAlignment = NSTextAlignmentRight;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
