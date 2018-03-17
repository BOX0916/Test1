//
//  BaseModel.m
//  RunTimeDemo
//
//  Created by 李文良 on 2018/2/27.
//  Copyright © 2018年 李文良. All rights reserved.
//

#import "BaseModel.h"
#import "RunTime.h"

@implementation BaseModel

- (NSDictionary *)ObjectClassInArray{
    return [NSObject mj_objectClassInArray];
}

+ (instancetype)ObjectWithKeyValues:(NSDictionary *)dict
{
    return [super mj_objectWithKeyValues:dict];
}

+ (NSMutableArray *)ObjectArrayWithKeyValuesArray:(NSArray *)array
{
    return [super mj_objectArrayWithKeyValuesArray:array];
}

- (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"Description" : @"description"};
}

//归档
- (void)encodeWithCoder:(NSCoder *)encoder{
    NSArray *ivarArray = [RunTime getIvarList:self];
    for (NSDictionary *ivarDic in ivarArray) {
        NSString *ivarName = ivarDic[@"name"];
        NSString *ivarValue = [RunTime getIvarValue:self ivarName:ivarName];
        [encoder encodeObject:ivarValue forKey:ivarName];
    }
}
//解档
- (instancetype)initWithCoder:(NSCoder *)decoder{
    self = [super init];
    if (self) {
        NSArray *ivarArray = [RunTime getIvarList:self];
        for (NSDictionary *ivarDic in ivarArray) {
            NSString *ivarName = ivarDic[@"name"];
            [RunTime setIvarValue:self ivarName:ivarName value:[decoder decodeObjectForKey:ivarName]];
        }
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    BaseModel *copy = [[[self class] allocWithZone:zone] init];
    NSArray *ivarArray = [RunTime getIvarList:self];
    for (NSDictionary *ivarDic in ivarArray) {
        NSString *ivarName = ivarDic[@"name"];
        NSString *ivarValue = [RunTime getIvarValue:self ivarName:ivarName];
        [RunTime setIvarValue:copy ivarName:ivarName value:[ivarValue copy]];
    }
    return copy;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    BaseModel *m_copy = [[[self class] allocWithZone:zone] init];
    NSArray *ivarArray = [RunTime getIvarList:self];
    for (NSDictionary *ivarDic in ivarArray) {
        NSString *ivarName = ivarDic[@"name"];
        NSString *ivarValue = [RunTime getIvarValue:self ivarName:ivarName];
        [RunTime setIvarValue:m_copy ivarName:ivarName value:[ivarValue mutableCopy]];
    }
    return m_copy;
}

@end
