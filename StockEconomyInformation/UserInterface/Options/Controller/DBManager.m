
//
//  DBManager.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/30.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "DBManager.h"

static DBManager *manager = nil;

@implementation DBManager {

    NSManagedObjectContext *_context;
}

//单例
+ (id)shareDBManager {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DBManager alloc] init];
        //打开数据库
        [manager openDB];
    });
    
    return manager;
}

//1.打开数据库
- (void)openDB {
    
    //（1）加载数据模型文件
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"Options" withExtension:@"momd"];
    NSManagedObjectModel *managerModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:fileURL];
    
    //(2)打开数据库
    
    NSPersistentStoreCoordinator *store = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managerModel];
    
    //创建数据库文件存放的地方
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Options.sqlite"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    
    NSError *error = nil;
    [store addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:&error];
    
    if (error) {
        NSLog(@"打开数据库失败，error：%@",error);
    }else {
        NSLog(@"打开数据库成功");
    }
    
    //（3）操作数据库
    _context = [[NSManagedObjectContext alloc] init];
    _context.persistentStoreCoordinator = store;
    
}

//根据数据模型名获取mo对象
- (NSManagedObject *)createMO:(NSString *)entityName {

    if (entityName.length == 0) {
        return nil;
    }
    
    NSManagedObject *mo = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:_context];
    
    return mo;
}

//添加数据
- (void)addManagerObject:(NSManagedObject *)mo {

    //将mo存放到context
    [_context insertObject:mo];
    
    if ([_context save:nil]) {
        NSLog(@"添加数据成功了");
    }else {
        NSLog(@"添加数据失败了");
    }


}

//查询数据
- (NSArray *)quaryWithName:(NSString *)entityName withPredicate:(NSPredicate *)predicate {

    if (entityName.length == 0) {
        return nil;
    }
    
    //1.创建查询请求对象
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    
    //2.设置查询的条件
    request.predicate = predicate;
    
//    //设置查询的数量
//    request.fetchLimit = 10;
//    //设置从特定的数据开始查询
//    request.fetchOffset = 200;
//    
//    //设置数据按照某种顺序排列
//    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:NO];
//    
//    request.sortDescriptors = @[descriptor];
    
    //3.查询
    NSArray *array = [_context executeFetchRequest:request error:nil];
    
    return  array;
    
}



//删除数据
- (void)removeData:(NSManagedObject *)mo {

    if (mo == nil) {
        return;
    }
    
    [_context deleteObject:mo];
    
    //保存
    if ([_context save:nil]) {
        NSLog(@"删除成功");
    }
    
}

//修改数据
- (void)changeDate:(NSManagedObject *)mo {

    if (mo == nil) {
        return;
    }
    
    //保存
    if ([_context save:nil]) {
        NSLog(@"修改成功");
    }else {
        NSLog(@"修改失败");
    }
    
}

















@end
