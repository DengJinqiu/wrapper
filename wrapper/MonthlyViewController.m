//
//  MonthlyViewController.m
//  wrapper
//
//  Created by Jinqiu Deng on 11/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "MonthlyViewController.h"
#import "MonthlyView.h"
#import "MainMode.h"

@interface MonthlyViewController ()

@property (strong, nonatomic, readwrite) NSMutableArray *monthlyViews;

@property (assign, nonatomic, readwrite) NSInteger yearNavigateTo;

@property (assign, nonatomic, readwrite) NSInteger monthNavigateTo;

@property (weak, nonatomic, readwrite) MainMode* mainMode;

@end

@implementation MonthlyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
    }
    return self;
}

- (void)initLayout
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    NSInteger startYear = [self.mainMode startYear];
    NSInteger endYear = [self.mainMode endYear];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    scrollView.backgroundColor = [UIColor whiteColor];
    
    NSInteger scrollViewHeight = 0;
    
    NSInteger index = 0;
    for(NSInteger i = startYear; i <= endYear; i++) {
        for (NSInteger j = 1; j <= 12; j++) {
            
            MonthlyView *monthlyView = [[MonthlyView alloc] initWithYear:i month:j index:index delegate:self];
            [scrollView addSubview:monthlyView];
            [self.monthlyViews addObject:monthlyView];
            scrollViewHeight += monthlyView.frame.size.height;
            index++;
        }
    }
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, scrollViewHeight);
    self.view = scrollView;

}

- (instancetype)initWithMainMode:(MainMode*)mainMode
                  yearNavigateTo:(NSInteger)year monthNavigateTo:(NSInteger)month
{
    self = [self init];
    self.mainMode = mainMode;
    self.yearNavigateTo = year;
    self.monthNavigateTo = month;
    [self initLayout];
    return self;
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
