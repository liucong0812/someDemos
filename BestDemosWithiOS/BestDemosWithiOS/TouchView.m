//
//  TouchView.m
//  BestDemosWithiOS
//
//  Created by Chris on 16/3/16.
//  Copyright © 2016年 Chris. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


- (void)addTagerWith:(id)tager WithAction:(SEL)select
{
    UITapGestureRecognizer *gestureWithView = [[UITapGestureRecognizer alloc]initWithTarget:tager action:select];
    [self addGestureRecognizer:gestureWithView];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
