//
//  CellModel.m
//  CellHeightProject
//
//  Created by hyj on 17/3/8.
//  Copyright © 2017年 hyj. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        if (self.picture) {
            [self setValue:@"350" forKey:@"picW"];
            [self setValue:@"44" forKey:@"picH"];
        }
        
    }
    return self;
}
+(instancetype)modelWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
