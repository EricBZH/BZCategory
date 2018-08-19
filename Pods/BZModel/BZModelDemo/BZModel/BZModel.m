//
//  BZModel.m
//  BZInheritDemo
//
//  Created by Eric on 2018/5/8.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "BZModel.h"
#import "MJExtension.h"
#import "YYModel.h"

@implementation BZModel

MJExtensionCodingImplementation

- (id)copyWithZone:(NSZone *)zone
{
    NSDictionary *json = [self yy_modelToJSONObject];
    
    if (json == nil) {
        return [[self class] allocWithZone:zone];
    }
    
    id obj = [[self class] yy_modelWithJSON:json];
    return obj;
}

- (NSString *)description
{
    return [self yy_modelDescription];
}

@end
