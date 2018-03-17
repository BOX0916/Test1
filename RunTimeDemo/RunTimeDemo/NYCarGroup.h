//
//  NYCarGroup.h
//  RunTimeDemo
//
//  Created by 李文良 on 2018/2/27.
//  Copyright © 2018年 李文良. All rights reserved.
//

#import "BaseModel.h"

@interface NYCarGroup : BaseModel

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray *cars;

@end
