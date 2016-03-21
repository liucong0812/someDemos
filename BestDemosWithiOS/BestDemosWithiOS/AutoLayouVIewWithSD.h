//
//  AutoLayouVIewWithSD.h
//  BestDemosWithiOS
//
//  Created by Chris on 16/3/16.
//  Copyright © 2016年 Chris. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AutoLayouVIewWithSD;
@protocol AutoLayouViewWithSDDelegate <NSObject>

- (void)didSelectTableViewWith:(UIViewController *)selectView;

@end
@interface AutoLayouVIewWithSD : UIView

- (void)changeViewWithFrame:(CGRect)Frame;

@property (nonatomic,readwrite,weak)NSArray *allAutoLayoutViewArray;

@property (nonatomic,weak)id<AutoLayouViewWithSDDelegate>delegate;
@end
