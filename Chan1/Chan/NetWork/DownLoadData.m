//
//  DownLoadData.m
//  007AFN的使用
//
//  Created by 黎跃春 on 15/5/18.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import "DownLoadData.h"
#import "AFAppDotNetAPIClient.h"
#import "travelSrollerModel.h"
#import "TravelDownModel.h"
#import "TacticCollModel.h"
@implementation DownLoadData

+(NSURLSessionDataTask *)getNewsScrollPageData:(void (^) (id obj, NSError *err))block withPage:(int)page
{
    NSString * url = [NSString stringWithFormat:@"trips/featured.json?page=%d",page];
    return [[AFAppDotNetAPIClient sharedClient]GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
       
        NSMutableArray *applications = [NSMutableArray array];
        
        //        遍历数组创建数据模型
        [responseObject enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL *stop) {
            //            创建数据模型
            TravelDownModel *app = [TravelDownModel applicationWithDic:dic];
            //            将数据模型添加到数组中
           
            [applications addObject:app];
  
            
        }];
        
        
        if (block) {
            block(applications,nil);
            
          
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"数据下载失败1");
        if (block) {
            block(nil,error);
        }

    }];
}


+ (NSURLSessionDataTask *)getTravePageData:(void (^) (id obj, NSError *err))block
{


    NSString * url = [NSString stringWithFormat:@"adverts.json?name=app_featured_banner_android"];
    return [[AFAppDotNetAPIClient sharedClient]GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {

        
        NSMutableArray *applications = [NSMutableArray array];
        [responseObject enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL *stop) {
            //            创建数据模型
            travelSrollerModel *app = [travelSrollerModel applicationWithDic:dic];
            //            将数据模型添加到数组中
            [applications addObject:app];
            
        }];
        
        
        
        if (block) {
            block(applications,nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"数据下载失败1");
        if (block) {
            block(nil,error);
        }
        
    }];


}


+ (NSURLSessionDataTask *)getTacticPageData:(void (^) (id obj, NSError *err))block
{


    
    NSString * url = [NSString stringWithFormat:@"destinations.json"];
    return [[AFAppDotNetAPIClient sharedClient]GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSDictionary  * dic=responseObject[0];
        NSArray * apps=dic[@"destinations"];
        NSMutableArray *applications = [NSMutableArray array];
        [apps enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL *stop) {
            //            创建数据模型
            TacticCollModel *app = [TacticCollModel applicationWithDic:dic];
            //            将数据模型添加到数组中
            [applications addObject:app];
            
    }];
        
        
        
        if (block) {
            block(applications,nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"数据下载失败1");
        if (block) {
            block(nil,error);
        }
        
    }];



}

+ (NSURLSessionDataTask *)getTraveDetailsPageData:(void (^) (id obj, NSError *err))block withPage:(NSString *)page
{

    NSString * url = [NSString stringWithFormat:@"trips/%@.json",page];
    return [[AFAppDotNetAPIClient sharedClient]GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        
        
        
      NSArray  * apps=responseObject[@"trip_days"];
      
       
        NSMutableArray *applications = [NSMutableArray array];
        [apps enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL *stop) {
            //            创建数据模型
            TravelDownModel *app = [TravelDownModel applicationWithDic:dic];
            //            将数据模型添加到数组中
            [applications addObject:app];
            
        }];
        
        
        
        if (block) {
            block(applications,nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"数据下载失败1");
        if (block) {
            block(nil,error);
        }
        
    }];
    
    
    













}

+ (NSURLSessionDataTask *)getTacticDetailsPageData:(void (^) (id obj, NSError *err))block withPage:(NSString *)page
{

    
    NSString * url = [NSString stringWithFormat:@"destinations/%@.json",page];
    return [[AFAppDotNetAPIClient sharedClient]GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
    
        NSMutableArray *applications = [NSMutableArray array];
        [responseObject enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL *stop) {
            //            创建数据模型
            TacticCollModel *app = [TacticCollModel applicationWithDic:dic];
            //            将数据模型添加到数组中
            [applications addObject:app];
            
        }];
        
        
        
        if (block) {
            block(applications,nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"数据下载失败1");
        if (block) {
            block(nil,error);
        }
        
    }];






}



+ (NSURLSessionDataTask *)getTacticDetailsSpecialPageData:(void (^) (id obj, NSError *err))block withPage:(NSString *)page
{


    NSString * url = [NSString stringWithFormat:@"articles.json?destination_id=%@&page=1",page];
    return [[AFAppDotNetAPIClient sharedClient]GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        
        NSMutableArray *applications = [NSMutableArray array];
        [responseObject enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL *stop) {
            //            创建数据模型
            TacticCollModel *app = [TacticCollModel applicationWithDic:dic];
            //            将数据模型添加到数组中
            [applications addObject:app];
            
        }];
        
        
        
        if (block) {
            block(applications,nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"数据下载失败1");
        if (block) {
            block(nil,error);
        }
        
    }];




}




+ (NSURLSessionDataTask *)getTacticDetailPlayPageData:(void (^) (id obj, NSError *err))block withPage:(NSString *)page
{


    NSString * url = [NSString stringWithFormat:@"destinations/attractions/%@.json?page=1",page];
    return [[AFAppDotNetAPIClient sharedClient]GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        
        NSMutableArray *applications = [NSMutableArray array];
        [responseObject enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL *stop) {
            //            创建数据模型
            TacticCollModel *app = [TacticCollModel applicationWithDic:dic];
            //            将数据模型添加到数组中
            [applications addObject:app];
            
        }];
        
        
        
        if (block) {
            block(applications,nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"数据下载失败1");
        if (block) {
            block(nil,error);
        }
        
    }];




}
+ (NSURLSessionDataTask *)getTacticDetailPlanPageData:(void (^) (id obj, NSError *err))block withPage:(NSString *)page
{

    NSString * url = [NSString stringWithFormat:@"destinations/plans/%@.json?page=1",page];
    return [[AFAppDotNetAPIClient sharedClient]GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        
        NSMutableArray *applications = [NSMutableArray array];
        [responseObject enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL *stop) {
            //            创建数据模型
            TacticCollModel *app = [TacticCollModel applicationWithDic:dic];
            //            将数据模型添加到数组中
            [applications addObject:app];
            
        }];
        
        
        
        if (block) {
            block(applications,nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"数据下载失败1");
        if (block) {
            block(nil,error);
        }
        
    }];


}

+ (NSURLSessionDataTask *)getTacticDetailsDetailsPageData:(void (^) (id obj, NSError *err))block withPage:(NSString *)page
{
    NSString * url = [NSString stringWithFormat:@"articles/%@.json",page];
    return [[AFAppDotNetAPIClient sharedClient]GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray * arr=responseObject[@"article_sections"];
        
        NSMutableArray *applications = [NSMutableArray array];
        [arr enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL *stop) {
            //            创建数据模型
            TacticCollModel *app = [TacticCollModel applicationWithDic:dic];
            //            将数据模型添加到数组中
            [applications addObject:app];
            
        }];
        
        
        
        if (block) {
            block(applications,nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"数据下载失败1");
        if (block) {
            block(nil,error);
        }
        
    }];

    
}

+ (NSURLSessionDataTask *)getTacticTwoTacticPageData:(void (^) (id obj, NSError *err))block withPage:(NSString *)page
{

    NSString * url = [NSString stringWithFormat:@"wiki/destinations/%@.json",page];
    return [[AFAppDotNetAPIClient sharedClient]GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        
        NSMutableArray *applications = [NSMutableArray array];
        [responseObject enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL *stop) {
            //            创建数据模型
            TacticCollModel *app = [TacticCollModel applicationWithDic:dic];
            //            将数据模型添加到数组中
            [applications addObject:app];
            
        }];
        
        
        
        if (block) {
            block(applications,nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"数据下载失败1");
        if (block) {
            block(nil,error);
        }
        
    }];





}

@end









