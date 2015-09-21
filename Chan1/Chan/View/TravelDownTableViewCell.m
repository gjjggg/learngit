//
//  TravelDownTableViewCell.m
//  Chan
//
//  Created by MS on 15-9-15.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TravelDownTableViewCell.h"

@interface TravelDownTableViewCell()

@property(nonatomic,strong)UIImageView * BigImageView;
@property(nonatomic,strong)UIButton * leftSmallButton;
@property(nonatomic,strong)UIImageView * leftSmallImageView;
@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UILabel * timeLabel;
@property(nonatomic,strong)NSString * st;
@end
@implementation TravelDownTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        
        UIImageView * imageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-20, 200-10)];
        self.BigImageView=imageView;
        imageView.backgroundColor=[UIColor groupTableViewBackgroundColor];
        [self.contentView addSubview:imageView];
        
        
        //5.UILabel字符显示的最大大小
      
        
        
        UILabel *titlelabel = [[UILabel alloc] initWithFrame: CGRectZero];
        self.titleLabel=titlelabel;
        [imageView addSubview:self.titleLabel];
        
        
        
        
        
        
         UILabel * timeLabel=[[UILabel alloc]initWithFrame:CGRectZero];
         self.timeLabel=timeLabel;
         [imageView addSubview:timeLabel];
       

        
        
        

        
        
        
        
        
        
        
        UIButton * smallButton=[UIButton buttonWithType:UIButtonTypeCustom];
        smallButton.frame=CGRectMake(10, imageView.frame.size.height-55, 45, 45) ;
        smallButton.backgroundColor=[UIColor whiteColor];
        smallButton.layer.masksToBounds=YES;
        smallButton.layer.borderColor=[[UIColor whiteColor]CGColor];
        smallButton.layer.borderWidth=2;
        smallButton.layer.cornerRadius=5;
        self.leftSmallButton=smallButton;
        [imageView addSubview:smallButton];
        UIImageView * leftSmallImageView=[[UIImageView alloc]initWithFrame:CGRectMake(1, 1, 43, 43)];
        //leftSmallImageView.backgroundColor=[UIColor yellowColor];
        self.leftSmallImageView=leftSmallImageView;
        [self.leftSmallButton addSubview:leftSmallImageView];
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    return self;
    
}



- (void)updateCellWithNewsModel:(TravelDownModel *)app andIndexPath:(NSIndexPath*)indexPath
{
    
     CGSize size = CGSizeMake(SCREEN_WIDTH-30,2000);
    self.titleLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:22];
    
     self.titleLabel.backgroundColor=[UIColor clearColor];
     self.titleLabel.text=app.name;
    self.titleLabel.textColor=[UIColor whiteColor];
     [self.titleLabel setNumberOfLines:0];
     CGSize labelsize = [self.titleLabel.text sizeWithFont:self.titleLabel.font constrainedToSize:size ];
     //7.重设UILabel实例的frame
     [self.titleLabel setFrame:CGRectMake(10, 10, labelsize.width, labelsize.height)];
            


    
    self.timeLabel.font=[UIFont systemFontOfSize:14];
    self.timeLabel.backgroundColor=[UIColor clearColor];
    self.timeLabel.textColor=[UIColor whiteColor];
    self.timeLabel.text=[NSString stringWithFormat:@"%@/%@天, %@图",app.start_date,app.days,app.photos_count];
    CGSize timeSize = [self.timeLabel.text sizeWithFont:self.timeLabel.font constrainedToSize:size ];
    [self.timeLabel setNumberOfLines:0];
    [self.timeLabel setFrame:CGRectMake(10, labelsize.height+10, timeSize.width, timeSize.height)];
    

    

    
    [self.BigImageView setImageWithURL:[NSURL URLWithString:app.front_cover_photo_url]];

    //@property(nonatomic,strong)UIButton * leftSmallButton;
    
    
    
    
   [self.leftSmallImageView setImageWithURL:[NSURL URLWithString:app.user[@"image"]]];
   
}









- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
