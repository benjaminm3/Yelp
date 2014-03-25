//
//  YSSegmentedViewControlCell.m
//  Yelp Search
//
//  Created by Benjamin Chang on 3/24/14.
//  Copyright (c) 2014 Benjamin Chang. All rights reserved.
//

#import "YSSegmentedViewControlCell.h"

@implementation YSSegmentedViewControlCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)setSelectedIndex:(NSInteger)index
{
    [self.segmentedViewControl setSelectedSegmentIndex:index];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
