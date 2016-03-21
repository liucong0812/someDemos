//
//  SDAutoLayoutViewController0.m
//  BestDemosWithiOS
//
//  Created by Chris on 16/3/16.
//  Copyright © 2016年 Chris. All rights reserved.
//

#import "SDAutoLayoutViewController0.h"
#import "TouchView.h"

@interface SDAutoLayoutViewController0 ()
{
    UIView *touchViewTemp;
    TouchView *touchView0;
    TouchView *touchView1;
    TouchView *touchView2;
    TouchView *touchView3;
    TouchView *touchView4;

}

@end

@implementation SDAutoLayoutViewController0

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];

    [self setUpView];
}

- (void)setUpView
{
//    self.edgesForExtendedLayout = UIRectEdgeNone;

    touchView0 = [TouchView new];
    touchView0.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:touchView0];
    touchView1 = [TouchView new];
    touchView1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:touchView1];
    touchView2 = [TouchView new];
    touchView2.backgroundColor = [UIColor blackColor];
    [touchView2 addTagerWith:self WithAction:@selector(touchViewAction:)];
    [self.view addSubview:touchView2];
    touchView3 = [TouchView new];
    touchView3.backgroundColor = [UIColor redColor];
    [self.view addSubview:touchView3];
    touchView4 = [TouchView new];
    touchView4.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:touchView4];
    
    CGFloat leftMargin = 20;
    CGFloat betweenMargin = 10;
    CGFloat topMargin = 100;
    CGFloat viewWidth = (self.view.frame.size.width - leftMargin*2 -betweenMargin*2 )/3;
    
    touchView0.sd_layout
    .leftSpaceToView(self.view,leftMargin)
    .rightSpaceToView(self.view,leftMargin)
    .topSpaceToView(self.view,topMargin);

    
    touchView1.sd_layout
    .leftEqualToView(touchView0)
    .topSpaceToView(touchView0,betweenMargin)
    .widthIs(viewWidth);
    
    
    touchView3.sd_layout
    .rightSpaceToView(self.view,leftMargin)
    .topEqualToView(touchView1)
    .widthIs(viewWidth);
    
    touchView2.sd_layout
    .leftSpaceToView(touchView1,betweenMargin)
    .topEqualToView(touchView1)
    .rightSpaceToView(touchView3,betweenMargin);

    touchView4.sd_layout
    .leftEqualToView(touchView0)
    .bottomSpaceToView(self.view,50)
    .rightEqualToView(touchView0)
    .topSpaceToView(touchView1,10);
}

- (void)touchViewAction:(id)sender
{
    UITapGestureRecognizer *touchGesture = sender;
    TouchView *touchView = (TouchView *)touchGesture.view;
    CGFloat width;
    CGFloat height;
    if (touchView.zoomIn) {
        
        width =  touchView.frame.size.width-20;
        height = touchView.frame.size.height-20;
        touchView.zoomIn = NO;
    }else{
        width =  touchView.frame.size.width+20;
        height = touchView.frame.size.height+20;
        touchView.zoomIn = YES;

    }
    
    CGRect changeRect = CGRectMake(0, 0,width,height);
    
    
    CGPoint centerPoint = touchView.center;
    [UIView animateWithDuration:0.5 animations:^{
        
        touchView.frame = changeRect;
        touchView.center = centerPoint;
//        touchView2.sd_layout
//        .leftSpaceToView(touchView1,10)
//        .topEqualToView(touchView1)
//        .rightSpaceToView(touchView3,10)
//        .widthIs(width)
//        .heightIs(height);
        [self allUpdateLayou];

    }];
    
}

- (void)allUpdateLayou
{
//    [touchView0 updateLayout];
//    [touchView1 updateLayout];
//
//    [touchView2 updateLayout];
//
//    [touchView3 updateLayout];
//
//    [touchView4 updateLayout];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
