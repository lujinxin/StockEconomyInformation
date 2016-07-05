//
//  DBManager.h
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/30.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface DBManager : NSObject

//单例
+ (id)shareDBManager;

//打开数据库
//- (void)openDB;

//根据数据模型名获取mo对象
- (NSManagedObject *)createMO:(NSString *)entityName;

//添加数据
- (void)addManagerObject:(NSManagedObject *)mo;

//查询数据
- (NSArray *)quaryWithName:(NSString *)entityName withPredicate:(NSPredicate *)predicate;

//删除数据
- (void)removeData:(NSManagedObject *)mo;

//修改数据
- (void)changeDate:(NSManagedObject *)mo;



@end
