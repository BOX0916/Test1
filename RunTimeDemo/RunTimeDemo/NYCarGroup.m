//
//  NYCarGroup.m
//  RunTimeDemo
//
//  Created by 李文良 on 2018/2/27.
//  Copyright © 2018年 李文良. All rights reserved.
//

#import "NYCarGroup.h"
#import "NYCar.h"
@implementation NYCarGroup

- (NSDictionary *)ObjectClassInArray
{
    return @{
             @"cars" : [NYCar class],
             };
}

@end
