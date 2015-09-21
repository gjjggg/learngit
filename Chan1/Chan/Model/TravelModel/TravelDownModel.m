//
//  TravelDownModel.m
//  Chan
//
//  Created by MS on 15-9-16.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TravelDownModel.h"

@implementation TravelDownModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
        if ([key isEqualToString:@"id"]||[key isEqualToString:@"description"]) {
            _udid = value;
              _des = value;
        }
  
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
+ (TravelDownModel*)applicationWithDic:(NSDictionary*)dic {
    
    TravelDownModel *app = [[TravelDownModel alloc] initWithDic:dic];
    return app;
}

@end
