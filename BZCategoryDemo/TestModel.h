//
//  TestModel.h
//  BZCategoryDemo
//
//  Created by Eric on 2018/8/19.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "BZModel.h"

@interface TestModel : BZModel

///姓名
@property (copy,   nonatomic) NSString *name;

///索引
@property (assign, nonatomic) NSInteger index;

@end
