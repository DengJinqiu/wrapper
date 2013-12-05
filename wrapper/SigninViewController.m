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
