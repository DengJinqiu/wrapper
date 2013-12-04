//
//  SigninViewController.m
//  wrapper
//
//  Created by Jinqiu Deng on 11/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "SigninViewController.h"
#import "YearlyViewController.h"
#import "MonthlyViewController.h"

@implementation SigninViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (IBAction)signIn:(UIButton *)sender {
    YearlyViewController *yearlyViewController = [[YearlyViewController alloc] init];
    UIBarButtonItem *signOutButtonItem =
        [[UIBarButtonItem alloc] initWithTitle:@"Sign out"
                                         style:UIBarButtonItemStyleBordered
                                        target:nil
                                        action:nil];
    [[self navigationItem] setBackBarButtonItem:signOutButtonItem];
    [self.navigationController pushViewController:yearlyViewController animated:NO];
    
    MonthlyViewController *monthlyViewController = [[MonthlyViewController alloc] init];
    
    [self.navigationController pushViewController:monthlyViewController animated:YES];
}

@end
