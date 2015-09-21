//
//  travelSrollerModel.h
//  Chan
//
//  Created by MS on 15-9-16.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface travelSrollerModel : NSObject



@property(nonatomic,strong)NSString  * image_url;
@property(nonatomic,strong)NSString  *  content;



- (instancetype)initWithDic:(NSDictionary*)dic;
+ (travelSrollerModel*)applicationWithDic:(NSDictionary*)dic;









@end
