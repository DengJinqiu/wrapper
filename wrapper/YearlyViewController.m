//
//  YearlyViewController.m
//  wrapper
//
//  Created by xcode-dev on 11/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "YearlyViewController.h"
#import "Yearlyview.h"
#import "MainMode.h"

@interface YearlyViewController ()

@property (strong, readonly) MainMode *mainMode;

@end

@implementation YearlyViewController

@synthesize mainMode = _mainMode;

- (MainMode*)mainMode
{
    if (!_mainMode) {
        _mainMode = [[MainMode alloc] init];
    }
    return _mainMode;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        
        CGRect yearlyViewRect = screenRect;
        yearlyViewRect.size.height /= 2;
        
        int totalYearNumber = [self.mainMode totalYearNumber];
        UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:screenRect];
        
        UINib *nib = [UINib nibWithNibName: @"YearlyView" bundle:nil];
        YearlyView *yearlyView = [[nib instantiateWithOwner:scrollview options:nil] objectAtIndex:0];
        [scrollview addSubview:yearlyView];
        
        for(int i = 0; i< totalYearNumber; i++) {
            yearlyViewRect.origin.y = i * yearlyViewRect.size.height;
//            [scrollview addSubview:[[YearlyView alloc] initWithFrame:yearlyViewRect
//                                                                year:[self.mainMode startYear]+i]];
//            UINib *nib = [UINib nibWithNibName: @"YearlyView" bundle:nil];
//            YearlyView *yearlyView = [[nib instantiateWithOwner:scrollview options:nil] objectAtIndex:i];
//            [scrollview addSubview:yearlyView];
        }
        scrollview.contentSize = CGSizeMake(yearlyViewRect.size.width, yearlyViewRect.size.height*totalYearNumber);
        self.view = scrollview;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [button setTitle:@"ssss" forState:UIControlStateNormal];
//    button.frame = CGRectMake(100.f, 400.f, 50.f, 50.f);
//    [[self view] addSubview:button];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

@end
