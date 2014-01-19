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
#import "Course.h"

@interface SigninViewController () <UITextFieldDelegate, UserDelegate>

@property (weak, nonatomic) IBOutlet UITextField *email;

@property (weak, nonatomic) IBOutlet UITextField *password;

@property (weak, nonatomic) IBOutlet UILabel *wrongEmailAndPassword;

@property (weak, nonatomic) IBOutlet UIButton *signIn;

@end

@implementation SigninViewController

#define OFFSET_FOR_KEYBOARD 80.0

-(void)viewMoveUp:(Boolean)up
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (up && self.view.frame.origin.y >= 0) {
        rect.origin.y -= OFFSET_FOR_KEYBOARD;
    } else if (!up && self.view.frame.origin.y < 0) {
        rect.origin.y += OFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}

-(void)textFieldDidBeginEditing:(UITextField *)sender
{
    [self viewMoveUp:TRUE];
}

- (void)viewDidLoad
{
    self.email.delegate = self;
    self.password.delegate = self;
}

- (IBAction)signIn:(UIButton *)sender {
    [self creatingUserStart];

    [User createInstanceWithEmail:self.email.text
                         password:self.password.text
                         delegate:self];
}

- (void)creatingUserStart
{
    self.wrongEmailAndPassword.text = @"Verifying ...";
    self.wrongEmailAndPassword.textColor = [UIColor greenColor];
    self.signIn.enabled = NO;
}

- (void)creatingUserSuccess
{
    self.wrongEmailAndPassword.text = @"Loading ...";
    self.wrongEmailAndPassword.textColor = [UIColor greenColor];
    self.signIn.enabled = NO;
    
    [self loadingDataStart];
    [[User getInstance] loadCourseStudentsAndAttendancesWithDelegate:self];
}


- (void)creatingUserFailed
{
    self.wrongEmailAndPassword.text = @"The email or password is incorrect.";
    self.wrongEmailAndPassword.textColor = [UIColor redColor];
    self.password.text = @"";
    self.signIn.enabled = YES;
}

- (void)loadingDataStart
{
    
}

- (void)loadingDataSuccess
{
    self.wrongEmailAndPassword.text = @"";
    self.email.text = @"";
    self.password.text = @"";
    self.signIn.enabled = YES;
    
    YearlyViewController *yearlyViewController = [[YearlyViewController alloc] init];
    UIBarButtonItem *backButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Sign out"
                                     style:UIBarButtonItemStyleBordered
                                    target:nil
                                    action:nil];
    [[self navigationItem] setBackBarButtonItem:backButtonItem];
    [self.navigationController pushViewController:yearlyViewController animated:NO];
    
    MonthlyViewController *monthlyViewController =
    [[MonthlyViewController alloc] initWithStartYear:[SchoolCalendar getInstance].currentDate.year
                                          startMonth:[SchoolCalendar getInstance].currentDate.month];
    
    [self.navigationController pushViewController:monthlyViewController animated:YES];
}

- (void)loadingDataFailed
{
    self.wrongEmailAndPassword.text = @"Cannot load data for this user.";
    self.wrongEmailAndPassword.textColor = [UIColor redColor];
    self.password.text = @"";
    self.signIn.enabled = YES;
}

@end
