//
//  AutoLayouVIewWithSD.m
//  BestDemosWithiOS
//
//  Created by Chris on 16/3/16.
//  Copyright © 2016年 Chris. All rights reserved.
//

#import "AutoLayouVIewWithSD.h"
#import "DemoNameAndDescribeTableViewCell.h"

@interface AutoLayouVIewWithSD ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *autoLayoutWithSDTableView;
    NSArray *allAutoLayouView_m_Array;
}

@end


@implementation AutoLayouVIewWithSD

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpView];

    }
    return self;
}

- (void)setUpView
{
    autoLayoutWithSDTableView = [UITableView new];
    autoLayoutWithSDTableView.frame = self.frame;
    autoLayoutWithSDTableView.delegate = self;
    autoLayoutWithSDTableView.dataSource = self;
    [self addSubview:autoLayoutWithSDTableView];
}

- (void)setAllAutoLayoutViewArray:(NSArray *)allAutoLayoutViewArray
{
    allAutoLayouView_m_Array = allAutoLayoutViewArray;
    [autoLayoutWithSDTableView reloadData];
}
- (void)changeViewWithFrame:(CGRect)Frame
{
    autoLayoutWithSDTableView.frame = Frame;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return allAutoLayouView_m_Array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *demoCellKey = @"demoCellKey";
    DemoNameAndDescribeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:demoCellKey];
    if (!cell) {
        cell = [[DemoNameAndDescribeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:demoCellKey];
    }
    
    cell.demoMessageDictionary = allAutoLayouView_m_Array[indexPath.row];
    return  cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self cellHeightForIndexPath:indexPath cellContentViewWidth:autoLayoutWithSDTableView.frame.size.width tableView:autoLayoutWithSDTableView];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *selectViewController = [NSClassFromString([NSString stringWithFormat:@"SDAutoLayoutViewController%ld",(long)indexPath.row]) new];
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectTableViewWith:)]) {
        
        [self.delegate didSelectTableViewWith:selectViewController];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
