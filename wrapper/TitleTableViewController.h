//
//  TitleTableViewController.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/5/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleTableViewController : UIViewController

@property (weak, nonatomic) UITableView* tableView;

@property (weak, nonatomic) UILabel* titleLabel;

@property (nonatomic) NSInteger indexSelected;

@property (nonatomic) NSMutableSet* indexesUnableSelected;

@end
