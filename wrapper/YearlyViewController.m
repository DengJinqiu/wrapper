//
//  YearlyViewController.m
//  wrapper
//
//  Created by xcode-dev on 11/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "YearlyViewController.h"
#import "MainMode.h"

@interface YearlyViewController ()

@property (strong, readonly) MainMode *mainMode;

@end

@implementation YearlyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        CGFloat screenHeight = screenRect.size.height;
        UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, self.view.frame.size.height)];
        NSInteger viewcount= 4;
        for(int i = 0; i< viewcount; i++) {
            
            CGFloat y = i * self.view.frame.size.height;
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, y,self.view.frame.size.width, self .view.frame.size.height)];
            view.backgroundColor = [UIColor greenColor];
            [scrollview addSubview:view];
        }
        scrollview.contentSize = CGSizeMake(screenWidth, self.view.frame.size.height *viewcount);
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
