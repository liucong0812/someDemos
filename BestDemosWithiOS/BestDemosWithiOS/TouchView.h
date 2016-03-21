//
//  TouchView.h
//  BestDemosWithiOS
//
//  Created by Chris on 16/3/16.
//  Copyright © 2016年 Chris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TouchView : UIView

- (void)addTagerWith:(id)tager WithAction:(SEL)select;

@property (nonatomic)BOOL zoomIn;
@end
