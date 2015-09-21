//
//  TacticTwoTacticCell.m
//  Chan
//
//  Created by MS on 15-9-21.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TacticTwoTacticCell.h"
#import "TacticCollModel.h"
@interface TacticTwoTacticCell ()


@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong) UIButton * btn;

@end
@implementation TacticTwoTacticCell
- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self)
        
    {
        
        
//        
//        UIButton * btn=[UIButton buttonWithType:UIButtonTypeCustom];
//        btn.frame=CGRectMake(0, 5,(SCREEN_WIDTH-30)/2 , 60);
//        btn.backgroundColor=[UIColor yellowColor];
//        [self addSubview:btn];
        
        
        
        UILabel * titlelabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 5, (SCREEN_WIDTH-30)/2, 30)];
        titlelabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:20];
        titlelabel.textColor=[UIColor whiteColor];
        titlelabel.backgroundColor=[UIColor orangeColor];
        
        self.titleLabel=titlelabel;
        [self addSubview:titlelabel];
        
        
        
        
        
        
        
    }
    
    return self;
    
    
    
    
}


- (void)updateCellWithNewsModel:(NSString *)app andIndexPath:(NSIndexPath*)indexPath
{
   
    self.titleLabel.text=app;

}











@end
