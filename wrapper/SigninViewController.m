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

@interface SigninViewController ()

@property (strong, nonatomic, readwrite) Calendar *calendar;

@end

@implementation SigninViewController

- (Calendar*)calendar
{
    if (!_calendar) {
        _calendar = [[Calendar alloc] init];
    }
    return _calendar;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (IBAction)signIn:(UIButton *)sender {
    YearlyViewController *yearlyViewController =
        [[YearlyViewController alloc] initWithCalendar:self.calendar];
    UIBarButtonItem *signOutButtonItem =
        [[UIBarButtonItem alloc] initWithTitle:@"Sign out"
                                         style:UIBarButtonItemStyleBordered
                                        target:nil
                                        action:nil];
    [[self navigationItem] setBackBarButtonItem:signOutButtonItem];
    [self.navigationController pushViewController:yearlyViewController animated:NO];
    
    
    MonthlyViewController *monthlyViewController =
        [[MonthlyViewController alloc] initWithCalendar:self.calendar
                                         yearNavigateTo:self.calendar.currentDate.year
                                        monthNavigateTo:self.calendar.currentDate.month];
    [self.navigationController pushViewController:monthlyViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
