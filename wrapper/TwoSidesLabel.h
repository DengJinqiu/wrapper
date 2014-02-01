//
//  TwoSideLabel.h
//  wrapper
//
//  Created by Jinqiu Deng on 1/28/14.
//  Copyright (c) 2014 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  The label which contains two strings, aligned on right and left.
 */
@interface TwoSidesLabel : UIView

/**
 *  The right string.
 */
@property (weak, nonatomic) UILabel* rightLabel;

/**
 *  The left string.
 */
@property (weak, nonatomic) UILabel* leftLabel;

@end
