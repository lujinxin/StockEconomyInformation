//
//  ListModel.h
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/27.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListModel : NSObject
    
@property (nonatomic,copy)NSString *symbol;
@property (nonatomic,copy)NSString *name;
@property (nonatomic)NSNumber *trade;
@property (nonatomic)NSNumber *pricechange;
@property (nonatomic)NSNumber *changepercent;


@end
