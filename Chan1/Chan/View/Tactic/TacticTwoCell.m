//
//  TacticTwoCell.m
//  Chan
//
//  Created by MS on 15-9-17.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TacticTwoCell.h"
#import "TacticTwoSpecialController.h"
#import "TacticTwoViewController.h"
@interface TacticTwoCell ()

@property(nonatomic,strong)UIImageView * bigImageView;
@property(nonatomic,strong)UILabel * titleLabel;


@end
@implementation TacticTwoCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        UIView * view=[[UIView alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-20, 350)];
        view.layer.masksToBounds=YES;
        view.layer.borderWidth=0.7;
        view.layer.borderColor=[[UIColor groupTableViewBackgroundColor] CGColor];
        view.backgroundColor=[UIColor whiteColor];
        [self.contentView addSubview:view];
        
        UIImageView * imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-20, 200)];
        self.bigImageView=imageView;
        imageView.backgroundColor=[UIColor groupTableViewBackgroundColor];
        [view addSubview:imageView];
        
        UILabel * labe=[[UILabel alloc]initWithFrame:CGRectMake(5, 10, SCREEN_WIDTH-150, 40)];
        self.titleLabel=labe;
        self.titleLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:20];
        self.titleLabel.textColor=[UIColor whiteColor];
        self.titleLabel.backgroundColor=[UIColor clearColor];
        [self.bigImageView addSubview:self.titleLabel];
        
        
        
        
        
        
    
        
            UIButton *btn1=[UIButton buttonWithType:UIButtonTypeCustom];
            self.downButton1=btn1;
            btn1.frame=CGRectMake(20, 220, (SCREEN_WIDTH-120)/4, 110);
        
            btn1.backgroundColor=[UIColor greenColor];
            [view addSubview:btn1];
            
        
        
        UIButton *btn2=[UIButton buttonWithType:UIButtonTypeCustom];
        self.downButton2=btn2;
        btn2.frame=CGRectMake(20*2+(SCREEN_WIDTH-120)/4, 220, (SCREEN_WIDTH-120)/4, 110);
        
      
        
        btn2.backgroundColor=[UIColor greenColor];
        [view addSubview:btn2];
        
        
        UIButton *btn3=[UIButton buttonWithType:UIButtonTypeCustom];
        self.downButton3=btn3;
        btn3.frame=CGRectMake(20*3+(SCREEN_WIDTH-120)/4*2, 220, (SCREEN_WIDTH-120)/4, 110);
        
        btn3.backgroundColor=[UIColor greenColor];
        [view addSubview:btn3];
        
        
        
        UIButton *btn4=[UIButton buttonWithType:UIButtonTypeCustom];
        self.downButton4=btn4;
        btn4.frame=CGRectMake(20*4+(SCREEN_WIDTH-120)/4*3, 220, (SCREEN_WIDTH-120)/4, 110);
        
        btn4.backgroundColor=[UIColor greenColor];
        [view addSubview:btn4];
        
        
        
        
        
        
        
        
    }
    return self;
    
}

- (void)updateCellWithNewsModel:(TacticCollModel *)app andIndexPath:(NSIndexPath*)indexPath
{


/*
 @property(nonatomic,strong)UIImageView * bigImageView;
 @property(nonatomic,strong)UILabel * titleLabel;
 
 */
   
    self.titleLabel.text= [NSString stringWithFormat:@"%@  %@",app.name_zh_cn,app.name_en];

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
