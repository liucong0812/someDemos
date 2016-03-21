//
//  AutoLayoutWIthTableViewViewController.m
//  BestDemosWithiOS
//
//  Created by Chris on 16/3/16.
//  Copyright © 2016年 Chris. All rights reserved.
//

#import "AutoLayoutWIthTableViewViewController.h"
#import "AutoLayouVIewWithSD.h"

@interface AutoLayoutWIthTableViewViewController ()<AutoLayouViewWithSDDelegate>
{
    AutoLayouVIewWithSD *layouViewWithSD;
    NSArray *allAutoViewArray;
}
@end

@implementation AutoLayoutWIthTableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    NSString *viewPlistPath = [[NSBundle mainBundle]pathForResource:@"AllAutoLayoutView" ofType:@"plist"];
    allAutoViewArray = [NSArray arrayWithContentsOfFile:viewPlistPath];
    
    [self setUpView];
    // Do any additional setup after loading the view.
}

- (void)setUpView
{
    layouViewWithSD = [[AutoLayouVIewWithSD alloc]initWithFrame:self.view.bounds];
    layouViewWithSD.delegate = self;
    [self.view addSubview:layouViewWithSD];
    layouViewWithSD.allAutoLayoutViewArray = allAutoViewArray;
}

- (void)didSelectTableViewWith:(UIViewController *)selectView
{
    [self.navigationController pushViewController:selectView animated:NO];
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
