//
//  SelectionPicker.m
//  wrapper
//
//  Created by Jinqiu Deng on 1/28/14.
//  Copyright (c) 2014 MusicKids. All rights reserved.
//

#import "SelectionPicker.h"

@implementation SelectionPicker

- (instancetype)initWithPickerViewDelegate:(id<UIPickerViewDelegate>)delegate andPickerViewDataSource:(id<UIPickerViewDataSource>)dataSource
{
    self = [super initWithFrame:CGRectMake(0, 0, 320, 162)];
    if (self) {
        // Initialization code
        UIPickerView *picker = [[UIPickerView alloc] initWithFrame:CGRectMake(30, 0, 320, 162)];
        picker.delegate = delegate;
        picker.dataSource = dataSource;
        picker.showsSelectionIndicator = YES;
        self.picker = picker;
        [self addSubview:picker];
        
        UILabel* whiteBackground = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 162)];
        whiteBackground.backgroundColor = [UIColor whiteColor];
        [self addSubview:whiteBackground];
        
        UIButton *remove = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.remove = remove;
        remove.frame = CGRectMake(0, 2, 50, 50);
        remove.layer.cornerRadius = 50 / 2;
        [remove setTitle:@"delete" forState:UIControlStateNormal];
        remove.layer.borderWidth = 2;
        remove.layer.borderColor = [[UIColor grayColor] CGColor];
        [self addSubview:remove];
        
        UIButton *cancel = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.cancel = cancel;
        cancel.frame = CGRectMake(0, 56, 50, 50);
        cancel.layer.cornerRadius = 50 / 2;
        [cancel setTitle:@"cancel" forState:UIControlStateNormal];
        cancel.layer.borderWidth = 2;
        cancel.layer.borderColor = [[UIColor grayColor] CGColor];
        [self addSubview:cancel];
        
        UIButton *done = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.done = done;
        done.frame = CGRectMake(0, 110, 50, 50);
        done.layer.cornerRadius = 50 / 2;
        [done setTitle:@"done" forState:UIControlStateNormal];
        done.layer.borderWidth = 2;
        done.layer.borderColor = [[UIColor grayColor] CGColor];
        [self addSubview:done];

    }
    return self;
}

@end
