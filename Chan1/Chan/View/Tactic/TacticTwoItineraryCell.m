//
//  TacticTwoItineraryCell.m
//  Chan
//
//  Created by MS on 15-9-18.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TacticTwoItineraryCell.h"
@interface TacticTwoItineraryCell ()
@property(nonatomic,strong)UIImageView * bigImageView;
@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UIButton * leftButton;
@property(nonatomic,strong)UIButton * rightButton;
@property(nonatomic,strong)UILabel * downLabel;



@end
@implementation TacticTwoItineraryCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        UIImageView * bigImagevIew=[[UIImageView alloc]initWithFrame:CGRectMake(10, 5, SCREEN_WIDTH-20, 185)];
        self.bigImageView=bigImagevIew;
        self.bigImageView.backgroundColor=[UIColor groupTableViewBackgroundColor];
        [self.contentView addSubview:bigImagevIew];
        
        
        
        UILabel * titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 185-70, SCREEN_WIDTH-30, 35)];
        self.titleLabel=titleLabel;
        self.titleLabel.font=[UIFont systemFontOfSize:22 weight:7];
        self.titleLabel.textColor=[UIColor whiteColor];
        self.titleLabel.backgroundColor=[UIColor clearColor];
        [self.bigImageView addSubview:titleLabel];
        
        
        UIButton * leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        self.leftButton=leftBtn;
        leftBtn.frame=CGRectMake(10,185-35, 40, 25);
        leftBtn.backgroundColor=[UIColor clearColor];
        [self.bigImageView addSubview:leftBtn];
        [self.leftButton setFont:[UIFont systemFontOfSize:15 weight:5]];
        leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        UIButton * rightBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        self.rightButton=rightBtn;
        rightBtn.frame=CGRectMake(50, 185-35, SCREEN_WIDTH-70, 25);
        rightBtn.backgroundColor=[UIColor clearColor];
        [self.bigImageView addSubview:rightBtn];
        [self.rightButton setFont:[UIFont systemFontOfSize:15 weight:5]];
         rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        
        
        
        UILabel * label=[[UILabel alloc]initWithFrame:CGRectZero];
        self.downLabel=label;
        [self.contentView addSubview:label];

        
        
        
        
        
    
 
    }
    
    
    return self;
}

- (void)updateCellWithNewsModel:(TacticCollModel *)app andIndexPath:(NSIndexPath*)indexPath
{/*

    @property(nonatomic,strong)UIImageView * bigImageView;
    @property(nonatomic,strong)UILabel * titleLabel;
    @property(nonatomic,strong)UIButton * leftButton;
    @property(nonatomic,strong)UIButton * rightButton;
    @property(nonatomic,strong)UILabel * downLabel;*/
    
    [self.bigImageView setImageWithURL:[NSURL URLWithString:app.image_url]];
    NSString * s=app.des;
    self.downLabel.text=s;
    self.downLabel.font=[UIFont systemFontOfSize:18 ];
    
    CGSize size = CGSizeMake(SCREEN_WIDTH-30,2000);
    
    self.downLabel.backgroundColor=[UIColor clearColor];
    
    //        self.titleLabel.textColor=[UIColor whiteColor];
    [self.downLabel setNumberOfLines:0];
    CGSize labelsize = [self.downLabel.text sizeWithFont:self.downLabel.font constrainedToSize:size ];
    //7.重设UILabel实例的frame
    [self.downLabel setFrame:CGRectMake(10, 195, labelsize.width, labelsize.height)];
    
    
    
    self.titleLabel.text=app.name;
    [self.leftButton setTitle:[NSString stringWithFormat:@"%@天",app.plan_days_count] forState:UIControlStateNormal];
    
    
    [self.rightButton setTitle:[NSString stringWithFormat:@"%@个旅行地",app.plan_nodes_count] forState:UIControlStateNormal];


}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
