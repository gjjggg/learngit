//
//  DownLoadData.h
//  007AFN的使用
//
//  Created by 黎跃春 on 15/5/18.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownLoadData : NSObject

// 获取首页所有数据
//+ (NSURLSessionDataTask *)getAllDataWithBlock:(void (^)(NSDictionary *result))block;


// 游记滚动视图   https://chanyouji.com/api/adverts.json?name=app_featured_banner_android

+ (NSURLSessionDataTask *)getTravePageData:(void (^) (id obj, NSError *err))block ;

+ (NSURLSessionDataTask *)getNewsScrollPageData:(void (^) (id obj, NSError *err))block withPage:(int)page;

//游记详情
+ (NSURLSessionDataTask *)getTraveDetailsPageData:(void (^) (id obj, NSError *err))block withPage:(NSString *)page;





//攻略
+ (NSURLSessionDataTask *)getTacticPageData:(void (^) (id obj, NSError *err))block ;

//攻略
//攻略详情
+ (NSURLSessionDataTask *)getTacticDetailsPageData:(void (^) (id obj, NSError *err))block withPage:(NSString *)page;

//攻略详情的详情界面
+ (NSURLSessionDataTask *)getTacticDetailsDetailsPageData:(void (^) (id obj, NSError *err))block withPage:(NSString *)page;


//攻略详情的攻略界面
+ (NSURLSessionDataTask *)getTacticTwoTacticPageData:(void (^) (id obj, NSError *err))block withPage:(NSString *)page;

//攻略详情的专题页
+ (NSURLSessionDataTask *)getTacticDetailsSpecialPageData:(void (^) (id obj, NSError *err))block withPage:(NSString *)page;

//攻略详情的旅行界面
+ (NSURLSessionDataTask *)getTacticDetailPlayPageData:(void (^) (id obj, NSError *err))block withPage:(NSString *)page;


//攻略详情的行程界面
+ (NSURLSessionDataTask *)getTacticDetailPlanPageData:(void (^) (id obj, NSError *err))block withPage:(NSString *)page;


@end















