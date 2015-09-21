//
//  TacticTwoTravePlayTableViewCell.m
//  Chan
//
//  Created by MS on 15-9-18.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TacticTwoTravePlayTableViewCell.h"
@interface TacticTwoTravePlayTableViewCell ()
@property(nonatomic,strong)UIImageView * leftImageView;
@property(nonatomic,strong)UILabel * leftLabel;
@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UIImageView * startImageView;
@property(nonatomic,strong)UILabel *  explainLabel;


@end
@implementation TacticTwoTravePlayTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        UIImageView * imageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, (SCREEN_WIDTH-90)/2, 105)];
        self.leftImageView=imageView;
        self.leftImageView.backgroundColor=[UIColor groupTableViewBackgroundColor];
        [self.contentView addSubview:imageView];
        
        //self.leftImageView.frame.size.height-30
        
        UILabel * leftLabel=[[UILabel alloc]initWithFrame:CGRectMake(0,75, (SCREEN_WIDTH-90)/2, 30)];
        self.leftLabel=leftLabel;
        self.leftLabel.textColor=[UIColor whiteColor];
        self.leftLabel.textAlignment=NSTextAlignmentCenter;
        self.leftLabel.font=[UIFont systemFontOfSize:12 weight:7];
        self.leftLabel.backgroundColor=[UIColor blackColor];
        self.leftLabel.alpha=0.5;
        [imageView addSubview:leftLabel];
        
        
        
        
        
        UIView * view=[[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-90)/2+10, 10, SCREEN_WIDTH-20-(SCREEN_WIDTH-90)/2, 110)];
        view.backgroundColor=[UIColor clearColor];
        [self.contentView addSubview:view];
        
        
        
        UILabel * titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, view.frame.size.width-5, 40)];
        self.titleLabel=titleLabel;
        self.titleLabel.font=[UIFont systemFontOfSize:18 weight:10];
        self.titleLabel.backgroundColor=[UIColor clearColor];
        [view addSubview:self.titleLabel];
        
        
        UIImage *image = [UIImage imageNamed:@"appproduct_starbackground.png"];
        UIImageView * starImageView=[[UIImageView alloc]initWithFrame:CGRectMake(5, 40, image.size.width,image.size.height)];
        self.startImageView=starImageView;
        self.startImageView.image=image;
        [view addSubview:self.startImageView];
        
        CGFloat width = image.size.width / 5.0;
        CGFloat height = image.size.height;
        
        for (int i = 0; i < 5; i++) {
            
            UIImageView *littleImageView = [[UIImageView alloc] init];
            littleImageView.tag = 10000+i;
            littleImageView.frame = CGRectMake(i*width, 0, width, height);
            [self.startImageView addSubview:littleImageView];
            
        }
        
        
        
        
        
        
        
        
        
        UILabel * explainLabel=[[UILabel alloc]initWithFrame:CGRectZero];
        self.explainLabel=explainLabel;
        [view addSubview:explainLabel];
        
        
        
        
        
    }
    return self;
    
}


- (void)updateCellWithNewsModel:(TacticCollModel *)app andIndexPath:(NSIndexPath*)indexPath
{

/*
 
 @property(nonatomic,strong)UIImageView * leftImageView;
 @property(nonatomic,strong)UILabel * leftLabel;
 @property(nonatomic,strong)UILabel * titleLabel;
 @property(nonatomic,strong)UIImageView * startImageView;
 @property(nonatomic,strong)UILabel *  explainLabel;
 
 
 */

    [self.leftImageView setImageWithURL:[NSURL URLWithString:app.image_url]];
    self.leftLabel.text=[NSString stringWithFormat:@"%@篇游记",app.attraction_trips_count];
    self.titleLabel.text=app.name;
    //self.explainLabel.text=app.des;
    
    NSString * s=app.des;
    self.explainLabel.text=s;
    self.explainLabel.font=[UIFont systemFontOfSize:15 ];
    self.explainLabel.textColor=[UIColor grayColor];
    CGSize size = CGSizeMake (SCREEN_WIDTH-25-(SCREEN_WIDTH-90)/2, 110-40-self.startImageView.frame.size.height);

    self.explainLabel.backgroundColor=[UIColor clearColor];
    
    //        self.titleLabel.textColor=[UIColor whiteColor];
    [self.explainLabel setNumberOfLines:0];
    CGSize labelsize = [self.explainLabel.text sizeWithFont:self.explainLabel.font constrainedToSize:size ];
    //7.重设UILabel实例的frame
    [self.explainLabel  setFrame:CGRectMake(5, 40+self.startImageView.frame.size.height, labelsize.width, labelsize.height)];

    CGFloat starCount = [app.user_score  floatValue];
   
    
    for (int i = 0; i < 5; i++) {
        ((UIImageView*)[self.startImageView viewWithTag:i+10000]).image = nil;
    
    }
    
    
    
    int starNum = (int)starCount;
    //    全星
    for (int i = 0; i < starNum; i++) {
        UIImageView *imageView = (UIImageView*)[self.startImageView viewWithTag:i + 10000];

        ((UIImageView*)[self.startImageView viewWithTag:i+10000]).image=[UIImage imageNamed:@"appproduct_starforeground_Topic.png"];
    }
    
   
    float starN =(float) starNum ;
    //    半星
    if (starNum != starCount) {
        if (starCount-starN>=0.5)
        {
            
            UIImageView *imageView = (UIImageView*)[self.startImageView viewWithTag:starNum + 10000];
            imageView.image = [UIImage imageNamed:@"appproduct_starforeground_half_Topic.png"];
        }
       }
    

    
    
    
    
    

}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
