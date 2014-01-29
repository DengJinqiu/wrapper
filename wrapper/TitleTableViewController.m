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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	CGRect viewRect = self.view.frame;
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 280, 50)];
    title.numberOfLines = 3;
    title.text = [self tableTitle];
    title.textAlignment = NSTextAlignmentCenter;
    [title setFont:[UIFont systemFontOfSize:12]];
    [self.view addSubview:title];
    
    NSInteger titleHeight = title.frame.size.height;
    CGRect tableFrame = CGRectMake(0, titleHeight, viewRect.size.width, viewRect.size.height - titleHeight);
    
    UITableView* tableView = tableView = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    self.tableView = tableView;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
   
    [self.view addSubview:self.tableView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (NSMutableDictionary*)cellsSelected
{
    if (!_cellsSelected) {
        _cellsSelected = [[NSMutableDictionary alloc] init];
    }
    return _cellsSelected;
}

#define CELL_HEIGHT 44
#define CELL_LARGE_HEIGHT 206

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[self.cellsSelected objectForKey:[NSNumber numberWithInteger:[indexPath indexAtPosition:1]]] boolValue] == YES) {
        return CELL_LARGE_HEIGHT;
    } else {
        return CELL_HEIGHT;
    }
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
