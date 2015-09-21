//
//  TacticCollModel.m
//  Chan
//
//  Created by MS on 15-9-17.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TacticCollModel.h"

@implementation TacticCollModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
        if ([key isEqualToString:@"id"]||[key isEqualToString:@"description"]) {
            _udid = value;
            _des=value;
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
+ (TacticCollModel*)applicationWithDic:(NSDictionary*)dic {
    
    TacticCollModel *app = [[TacticCollModel alloc] initWithDic:dic];
    return app;
}


@end
