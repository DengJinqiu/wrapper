//
//  SelectionPicker.h
//  wrapper
//
//  Created by Jinqiu Deng on 1/28/14.
//  Copyright (c) 2014 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonWithTag.h"

@interface SelectionPicker : UIView

- (instancetype)initWithPickerViewDelegate:(id<UIPickerViewDelegate>)delegate
                   andPickerViewDataSource:(id<UIPickerViewDataSource>)dataSource;

@property (weak, nonatomic) ButtonWithTag* remove;
@property (weak, nonatomic) ButtonWithTag* cancel;
@property (weak, nonatomic) ButtonWithTag* done;

@property (weak, nonatomic) UIPickerView* picker;

@end
