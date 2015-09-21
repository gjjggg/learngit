//
//  TacticTwoSpecialCell.m
//  Chan
//
//  Created by MS on 15-9-18.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TacticTwoSpecialCell.h"

@interface TacticTwoSpecialCell ()
@property(nonatomic,strong)UIImageView * bigImageView;
@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UILabel * downLabel;


@end
@implementation TacticTwoSpecialCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        UIImageView * bigImageVIew=[[UIImageView alloc]initWithFrame:CGRectMake(10, 5, SCREEN_WIDTH-20, 235)];
        bigImageVIew.backgroundColor=[UIColor groupTableViewBackgroundColor];
        self.bigImageView=bigImageVIew;
        [self.contentView addSubview:bigImageVIew];
        
        
        
        UILabel * titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(12, 150, SCREEN_WIDTH-32, 40)];
        titleLabel.backgroundColor=[UIColor clearColor];
        self.titleLabel=titleLabel;
        self.titleLabel.textColor=[UIColor whiteColor];
    
        self.titleLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:24];
        [self.bigImageView addSubview:self.titleLabel];
        
        
        
        
        
        UILabel * downLabel=[[UILabel alloc]initWithFrame:CGRectMake(12, 190, SCREEN_WIDTH-32, 25)];
        downLabel.backgroundColor=[UIColor clearColor];
        downLabel.textColor=[UIColor whiteColor];
         downLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:18];
        self.downLabel=downLabel;
        [self.bigImageView addSubview:downLabel];
        
        
        
        
    }
    return self;
    
}

- (void)updateCellWithNewsModel:(TacticCollModel *)app andIndexPath:(NSIndexPath*)indexPath
{
    /*
     @property(nonatomic,strong)UIImageView * bigImageView;
     @property(nonatomic,strong)UILabel * titleLabel;
     @property(nonatomic,strong)UILabel * downLabel;

     */
    self.titleLabel.text= app.name;
    self.downLabel.text=app.title;
   
    [self.bigImageView setImageWithURL:[NSURL URLWithString:app.image_url]];
    



}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
