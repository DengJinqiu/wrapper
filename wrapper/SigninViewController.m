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
#import "User.h"

@implementation SigninViewController

- (IBAction)signIn:(UIButton *)sender {
    [User createInstanceWithEmail:@"admin@gmail.com" password:@"123" delegate:self];
}

- (void)createUserSuccessfully
{
    YearlyViewController *yearlyViewController = [[YearlyViewController alloc] init];
    UIBarButtonItem *backButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Sign out"
                                     style:UIBarButtonItemStyleBordered
                                    target:nil
                                    action:nil];
    [[self navigationItem] setBackBarButtonItem:backButtonItem];
    [self.navigationController pushViewController:yearlyViewController animated:NO];
    
    MonthlyViewController *monthlyViewController =
    [[MonthlyViewController alloc] initWithStartYear:[Schedule getInstance].currentDate.year
                                          startMonth:[Schedule getInstance].currentDate.month];
    
    [self.navigationController pushViewController:monthlyViewController animated:YES];
}

@end
