//
//  DemoNameAndDescribeTableViewCell.m
//  BestDemosWithiOS
//
//  Created by Chris on 16/3/16.
//  Copyright © 2016年 Chris. All rights reserved.
//

#import "DemoNameAndDescribeTableViewCell.h"

@interface DemoNameAndDescribeTableViewCell ()
{
    UILabel *demoNameLable;
    UILabel *demoDescriberLable;
}

@end
@implementation DemoNameAndDescribeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpView];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setDemoMessageDictionary:(NSDictionary *)demoMessageDictionary
{
    demoNameLable.text = demoMessageDictionary[@"Name" ];
    demoDescriberLable.text = demoMessageDictionary[@"Describe"];
}

- (void)setUpView
{
    demoDescriberLable = [UILabel new];
    demoDescriberLable.textColor = [UIColor grayColor];
    demoDescriberLable.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:demoDescriberLable];

    demoNameLable = [UILabel new];
    demoNameLable.textColor = [UIColor blackColor];
    demoNameLable.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:demoNameLable];
    
    CGFloat topmargin = 15;
    CGFloat rightMargin = 15;
    demoNameLable.sd_layout
    .leftSpaceToView(self.contentView, rightMargin)
    .topSpaceToView(self.contentView, topmargin)
    .rightSpaceToView(self.contentView, rightMargin)
    .autoHeightRatio(0);
    
    demoDescriberLable.sd_layout
    .leftEqualToView(demoNameLable)
    .rightEqualToView(demoNameLable)
    .topSpaceToView(demoNameLable, 10)
    .autoHeightRatio(0);

    [self updateLayout];
    
    NSLog(@"demoNameFrame = %@",NSStringFromCGRect(demoNameLable.frame));
    
    NSLog(@"demoDescribeFrame = %@",NSStringFromCGRect(demoDescriberLable.frame));
    [self setupAutoHeightWithBottomView:demoDescriberLable bottomMargin:10];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
