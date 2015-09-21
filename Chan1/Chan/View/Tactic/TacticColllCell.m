//
//  TacticColllCell.m
//  Chan
//
//  Created by MS on 15-9-17.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TacticColllCell.h"

@interface TacticColllCell ()

@property (nonatomic, strong) UIImageView *imageView;
@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UILabel * EnghishLabel;
@property(nonatomic,strong)UILabel * downLabel;

@end
@implementation TacticColllCell
- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self)
        
    {
       
       
            
            
        
        
        //self.backgroundColor=[UIColor yellowColor];
        self.imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0,10,(SCREEN_WIDTH-30)/2, 250-10)];
        
        self.imageView.backgroundColor=[UIColor groupTableViewBackgroundColor];
        [self addSubview:self.imageView];
        
        
        
        UILabel * titlelabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, self.imageView.frame.size.width-10, 35)];
        titlelabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:20];
        titlelabel.textColor=[UIColor whiteColor];
        titlelabel.backgroundColor=[UIColor clearColor];
        
        self.titleLabel=titlelabel;
        [self.imageView addSubview:titlelabel];
        
        
        
        UILabel * enghishLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, titlelabel.frame.size.height+10, self.imageView.frame.size.width-10, 30)];
        enghishLabel.backgroundColor=[UIColor clearColor];
        enghishLabel.textColor=[UIColor whiteColor];
        enghishLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:20];
        self.EnghishLabel=enghishLabel;
        [self.imageView addSubview:enghishLabel];
        
        
        
        UILabel * downLabel=[[UILabel alloc]initWithFrame:CGRectMake(self.imageView.frame.size.width/2-50, self.imageView.frame.size.height-40, 80, 20)];
        self.downLabel=downLabel;
        downLabel.textAlignment=NSTextAlignmentCenter;
        downLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:13];
        downLabel.textColor=[UIColor whiteColor];
        downLabel.backgroundColor=[UIColor blackColor];
        downLabel.alpha=0.7;
        [self.imageView addSubview:downLabel];
        
        
        
        
    }
    
    return self;
    
    
    
    
    }
- (void)updateCellWithNewsModel:(TacticCollModel *)app andIndexPath:(NSIndexPath*)indexPath
{

   /*
    
    @property (nonatomic, strong) UIImageView *imageView;
    @property(nonatomic,strong)UILabel * titleLabel;
    @property(nonatomic,strong)UILabel * EnghishLabel;
    @property(nonatomic,strong)UILabel * downLabel;
    
    */

    [self.imageView setImageWithURL:[NSURL URLWithString:app.image_url]];
    
    self.titleLabel.text=app.name_zh_cn;
    self.EnghishLabel.text=app.name_en;
    self.downLabel.text=[NSString stringWithFormat:@"%@旅游地",app.poi_count];
    




}

@end



