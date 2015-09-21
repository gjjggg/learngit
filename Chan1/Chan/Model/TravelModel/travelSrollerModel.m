//
//  travelSrollerModel.m
//  Chan
//
//  Created by MS on 15-9-16.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "travelSrollerModel.h"

@implementation travelSrollerModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (id)valueForUndefinedKey:(NSString *)key {
    
    return nil;
}

- (instancetype)initWithDic:(NSDictionary*)dic {
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dic];
        
    }
    
    return self;
}

//工厂方法
+ (travelSrollerModel*)applicationWithDic:(NSDictionary*)dic {
    
    travelSrollerModel *app = [[travelSrollerModel alloc] initWithDic:dic];
    return app;
}

@end
