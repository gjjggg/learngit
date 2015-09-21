//
//  TravelDownModel.h
//  Chan
//
//  Created by MS on 15-9-16.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TravelDownModel : NSObject
@property(nonatomic,strong)NSString  * udid;
@property(nonatomic,strong)NSString  *  name;
@property(nonatomic,strong)NSString  * photos_count;
@property(nonatomic,strong)NSString  *  start_date;
@property(nonatomic,strong)NSString  * end_date;
@property(nonatomic,strong)NSString  *  days;
@property(nonatomic,strong)NSString * front_cover_photo_url;
@property(nonatomic,strong)NSString  * ifront_cover_photo_url;



@property(nonatomic,strong)NSArray * nodes;
@property(nonatomic,strong)NSArray * notes;
@property(nonatomic,strong)NSString  *  des;
@property(nonatomic,strong)NSString  * entry_name;
@property(nonatomic,strong)NSDictionary * memo;



















@property(nonatomic,strong)NSDictionary * user;
@property(nonatomic,strong)NSString  * image;
















- (instancetype)initWithDic:(NSDictionary*)dic;
+ (TravelDownModel*)applicationWithDic:(NSDictionary*)dic;

@end
