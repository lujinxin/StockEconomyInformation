//
//  SelectedStock+CoreDataProperties.h
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/5/3.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "SelectedStock.h"

NS_ASSUME_NONNULL_BEGIN

@interface SelectedStock (CoreDataProperties)

@property (nonatomic) float changePercent;
@property (nonatomic) float pricecChange;
@property (nullable, nonatomic, retain) NSString *stockCode;
@property (nullable, nonatomic, retain) NSString *stockName;
@property (nonatomic) float stockPrice;

@end

NS_ASSUME_NONNULL_END
