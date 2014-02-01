//
//  SelectionPicker.h
//  wrapper
//
//  Created by Jinqiu Deng on 1/28/14.
//  Copyright (c) 2014 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  A picker with three buttons, reomve, cancel and done.
 */
@interface SelectionPicker : UIView

/**
 *  Initalize the picker with delegate and data source.
 *  @param delegate The picker delegate.
 *  @param dataSource The picker data source.
 *  @returns The selection picker.
 */
- (instancetype)initWithPickerViewDelegate:(id<UIPickerViewDelegate>)delegate
                   andPickerViewDataSource:(id<UIPickerViewDataSource>)dataSource;

/** 
 *  The remove button.
 */
@property (weak, nonatomic) UIButton* remove;

/** 
 *  The cancel button.
 */
@property (weak, nonatomic) UIButton* cancel;

/** 
 *  The done button.
 */
@property (weak, nonatomic) UIButton* done;

/** 
 *  The picker.
 */
@property (weak, nonatomic) UIPickerView* picker;

@end
