//
//  TwoSideLabel.m
//  wrapper
//
//  Created by Jinqiu Deng on 1/28/14.
//  Copyright (c) 2014 MusicKids. All rights reserved.
//

#import "TwoSidesLabel.h"

@implementation TwoSidesLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UILabel* leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width/3, frame.size.height)];
        UILabel* rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width/3, 0,
                                                                        frame.size.width-frame.size.width/3, frame.size.height)];
        leftLabel.textAlignment = NSTextAlignmentLeft;
        rightLabel.textAlignment = NSTextAlignmentRight;
        self.leftLabel = leftLabel;
        self.rightLabel = rightLabel;
        [self addSubview:leftLabel];
        [self addSubview:rightLabel];
    }
    return self;
}

@end
