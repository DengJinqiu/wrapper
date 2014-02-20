//
//  TitleTableViewController.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/5/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  Table view with a title.
 */
@interface TitleTableViewController : UIViewController

/**
 *  The table view.
 */
@property (weak, nonatomic) UITableView* tableView;

/**
 *  The title of the table view.
 */
@property (weak, nonatomic) UILabel* titleLabel;

/**
 *  The index of selected row.
 */
@property (nonatomic) NSInteger indexSelected;

/**
 *  The index of row which cannot be selected.
 */
@property (nonatomic) NSMutableSet* indexesUnableSelected;

@end
