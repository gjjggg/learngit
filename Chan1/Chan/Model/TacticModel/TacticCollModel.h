//
//  TacticCollModel.h
//  Chan
//
//  Created by MS on 15-9-17.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TacticCollModel : NSObject
@property(nonatomic,strong)NSString  * udid;
@property(nonatomic,strong)NSString  *  name_zh_cn;
@property(nonatomic,strong)NSString  * name_en;
@property(nonatomic,strong)NSString  *  poi_count;
@property(nonatomic,strong)NSString  * image_url;

@property(nonatomic,strong)NSString * name;
@property(nonatomic,strong)NSString * title;

@property(nonatomic,strong)NSString  * attraction_trips_count;
@property(nonatomic,strong)NSString  *  user_score;
@property(nonatomic,strong)NSString  * des;
@property(nonatomic,strong)NSString  *  description_summary;

@property(nonatomic,strong)NSString  * plan_days_count;
@property(nonatomic,strong)NSString  *  plan_nodes_count;
@property(nonatomic,strong)NSArray * article_sections;
@property(nonatomic,strong)NSDictionary * description_user_ids;
@property(nonatomic,strong)NSDictionary * note;
@property(nonatomic,strong)NSArray * children;

@property(nonatomic,strong)NSArray * pages;
@property(nonatomic,strong)NSArray * sections;

- (instancetype)initWithDic:(NSDictionary*)dic;
+ (TacticCollModel*)applicationWithDic:(NSDictionary*)dic;
@end
