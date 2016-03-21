//
//  ViewController.m
//  BestDemosWithiOS
//
//  Created by Chris on 16/3/16.
//  Copyright © 2016年 Chris. All rights reserved.
//

#import "ViewController.h"
#import "DemoNameAndDescribeTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *autoLayoutTableView;
    NSArray *demoNameArray;
    NSArray *allDemoViewControllerArray;
}
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    demoNameArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"DemoDescribe" ofType:@"plist"]];
    
    allDemoViewControllerArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DemoViewControllerClassName" ofType:@"plist"]];
    
    [self creatView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)creatView
{
    self.view.backgroundColor = [UIColor grayColor];
    autoLayoutTableView = [UITableView new];
    autoLayoutTableView.frame = self.view.bounds;
    autoLayoutTableView.delegate = self;
    autoLayoutTableView.dataSource = self;
    [self.view addSubview:autoLayoutTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [demoNameArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *demoCellKey = @"demoCellKey";
    DemoNameAndDescribeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:demoCellKey];
    if (!cell) {
        cell = [[DemoNameAndDescribeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:demoCellKey];
    }
    
    cell.demoMessageDictionary = demoNameArray[indexPath.row];
    return  cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rowHeight = [autoLayoutTableView cellHeightForIndexPath:indexPath cellContentViewWidth:[UIScreen mainScreen].bounds.size.width tableView:autoLayoutTableView];
    
    NSLog(@"%f",rowHeight);
    return rowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (allDemoViewControllerArray.count - 1 >= indexPath.row) {
        NSString *className = allDemoViewControllerArray[indexPath.row];
        UIViewController *selectViewController = [NSClassFromString(className) new];
        [self.navigationController pushViewController:selectViewController animated:NO];

    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
