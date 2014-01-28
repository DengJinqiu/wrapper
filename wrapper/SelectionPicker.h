//
//  SelectionPicker.h
//  wrapper
//
//  Created by Jinqiu Deng on 1/28/14.
//  Copyright (c) 2014 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectionPicker : UIView

- (instancetype)initWithPickerViewDelegate:(id<UIPickerViewDelegate>)delegate
                   andPickerViewDataSource:(id<UIPickerViewDataSource>)dataSource;

@end
