//
//  TitleTableViewController.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/5/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "TitleTableViewController.h"

@interface TitleTableViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation TitleTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	CGRect screenRect = [[UIScreen mainScreen] bounds];

    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 280, 50)];
    title.numberOfLines = 3;
    title.text = [self tableTitle];
    title.textAlignment = NSTextAlignmentCenter;
    [title setFont:[UIFont systemFontOfSize:12]];
    [self.view addSubview:title];
    
    NSInteger titleHeight = title.frame.size.height;
    CGRect tableFrame = CGRectMake(0, titleHeight, screenRect.size.width, screenRect.size.height-titleHeight);
    
    UITableView *table = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    table.dataSource = self;
    table.delegate = self;
    [self.view addSubview:table];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (NSString*)tableTitle
{
    return nil;
}

@end
