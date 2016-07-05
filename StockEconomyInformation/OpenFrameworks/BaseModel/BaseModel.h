//
//  BaseModel.h
//  
//
//  Created by 陆金鑫 on 15/10/29.
//
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

//自定义初始化
- (id)initWithDic:(NSDictionary *)jsonDic;

//1.将字典中 value 交给 model 的属性
- (void)setAttrbuteWith:(NSDictionary *)jsonDic;

//2.将 jsonkey 作为属性名：映射关系
- (NSDictionary *)attributeMapDic:(NSDictionary *)jsonDic;

@end
