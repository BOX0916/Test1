//
//  BaseModel.h
//  RunTimeDemo
//
//  Created by 李文良 on 2018/2/27.
//  Copyright © 2018年 李文良. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

/** 设置数组字段 对应的模型类名称 */
- (NSDictionary *) ObjectClassInArray;

/** 字典 --> 模型 */
+ (instancetype) ObjectWithKeyValues:(NSDictionary *)dict;

/** 字典数组 --> 模型数组 */
+ (NSMutableArray *) ObjectArrayWithKeyValuesArray:(NSArray *)array;

@end
