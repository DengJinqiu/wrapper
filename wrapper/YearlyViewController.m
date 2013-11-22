//
//  YearlyViewController.m
//  wrapper
//
//  Created by xcode-dev on 11/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "YearlyViewController.h"
#import "Yearlyview.h"
#import "MonthlyViewController.h"
#import "MonthButton.h"
#import "MainMode.h"

@interface YearlyViewController ()

@property (strong, nonatomic, readonly) MainMode *mainMode;

@property (strong, nonatomic, readwrite) NSMutableArray *yearlyViews;

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

- (NSMutableArray*)yearlyViews
{
    if (!_yearlyViews) {
        _yearlyViews = [[NSMutableArray alloc] init];
    }
    return _yearlyViews;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        
        NSInteger startYear = [self.mainMode startYear];
        NSInteger endYear = [self.mainMode endYear];
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
        scrollView.backgroundColor = [UIColor whiteColor];
        
        NSInteger scrollViewHeight = 0;
        
        for(NSInteger i = startYear; i <= endYear; i++) {
            YearlyView *yearlyView = [[YearlyView alloc] initWithYear:i
                                                                index:i-startYear
                                                             delegate:self];
            [scrollView addSubview:yearlyView];
            [self.yearlyViews addObject:yearlyView];
            scrollViewHeight += yearlyView.frame.size.height;
        }
        
        scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, scrollViewHeight);
        self.view = scrollView;
    }
    return self;
}

- (void)navigateToMonthlyView:(MonthButton*)sender
{
    MonthlyViewController *monthlyViewController = [[MonthlyViewController alloc] init];
    monthlyViewController.startYear = sender.year;
    monthlyViewController.startMonth = sender.month;
    
    UIBarButtonItem *yearlyViewButtonItem =
        [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithFormat:@"%d", sender.year]
                                         style:UIBarButtonItemStyleBordered
                                        target:nil
                                        action:nil];
    [[self navigationItem] setBackBarButtonItem:yearlyViewButtonItem];
    [self.navigationController pushViewController:monthlyViewController animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
