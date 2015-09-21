//
//  TacticTwoTacticTwoCell.m
//  Chan
//
//  Created by MS on 15-9-21.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TacticTwoTacticTwoCell.h"
@interface TacticTwoTacticTwoCell ()<UIScrollViewDelegate>
{

    UIScrollView * scrollView;
}
@property(nonatomic,strong)UILabel * label;
@property(nonatomic,strong)UIImageView * bigImageView;
@end


@implementation TacticTwoTacticTwoCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        
        UILabel * label=[[UILabel alloc]initWithFrame:CGRectZero];
        self.label=label;
        
        [self.contentView addSubview:label];
        
        
//        
//        UIImageView * imageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-20, 180)];
//        self.bigImageView=imageView;
//        imageView.backgroundColor=[UIColor groupTableViewBackgroundColor];
//        [self.contentView addSubview:imageView];
//        
        UIScrollView * scroller=[[UIScrollView alloc]initWithFrame:CGRectMake(0, label.frame.size.height+20, SCREEN_WIDTH , 200)];
        
        scroller.bounces=NO;
        scroller.showsHorizontalScrollIndicator=NO;
        scroller.showsVerticalScrollIndicator=NO;
        //scroller.contentSize=CGSizeMake(<#CGFloat width#>, <#CGFloat height#>)
        
        scroller.backgroundColor=[UIColor orangeColor];
        scroller.pagingEnabled=YES;
        scroller.delegate=self;
        scrollView=scroller;
        
        
        scroller.contentOffset=CGPointMake(0, 0);
       
        
        
        //scroller.backgroundColor=[UIColor redColor];
        [self.contentView addSubview:scrollView];
        
        
        
//        UIImageView * imageV=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-20, 180)];
//        self.bigImageView=imageV;
//        imageView.backgroundColor=[UIColor groupTableViewBackgroundColor];
//        [scroller addSubview:imageView];
//        
        
        
        
        

        
        
        
    }
    return self;
    
}

- (void)updateCellWithNewsModel:(NSArray *)app andText:(NSArray *) textapp andIndexPath:(NSIndexPath*)indexPath
{
    NSString * s=[app[indexPath.row]objectForKey:@"description"];
    self.label.text=s;
    self.label.font=[UIFont systemFontOfSize:15];
    
    CGSize size = CGSizeMake(SCREEN_WIDTH-20,2000);
    
    self.label.backgroundColor=[UIColor clearColor];
    
    //        self.titleLabel.textColor=[UIColor whiteColor];
    [self.label setNumberOfLines:0];
    CGSize labelsize = [self.label.text sizeWithFont:self.label.font constrainedToSize:size ];
    //7.重设UILabel实例的frame
    [self.label setFrame:CGRectMake(10, 10, labelsize.width, labelsize.height)];
    scrollView.frame=CGRectMake(0, self.label.frame.size.height+20, SCREEN_WIDTH , 200);


    
    
    for (int i=0; i<textapp.count; i++)
    {
          UIImageView * imageV=[[UIImageView alloc]initWithFrame:CGRectMake(0+(SCREEN_WIDTH-40)*i, 0, SCREEN_WIDTH-40, 200)];
        //        self.bigImageView=imageV;
         imageV.backgroundColor=[UIColor groupTableViewBackgroundColor];
         [scrollView addSubview:imageV];
    }
     scrollView.contentSize=CGSizeMake((SCREEN_WIDTH-40)*textapp.count, 200);
    
    
    
    
    
    
}
@end
