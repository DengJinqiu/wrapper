//
//  SigninViewController.m
//  wrapper
//
//  Created by Jinqiu Deng on 11/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "SigninViewController.h"
#import "YearlyViewController.h"

@interface SigninViewController ()

//@property (weak, nonatomic) IBOutlet UITextField *email;
//@property (weak, nonatomic) IBOutlet UITextField *password;
//@property (weak, nonatomic) IBOutlet UIButton *Signin;

@end

@implementation SigninViewController

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
    YearlyViewController *yearlyViewController = [[YearlyViewController alloc] init];
    
    UIBarButtonItem *signOutButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sign out" style:UIBarButtonItemStyleBordered target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:signOutButtonItem];
    [self.navigationController pushViewController:yearlyViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
