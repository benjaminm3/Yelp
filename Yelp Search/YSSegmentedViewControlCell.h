//
//  YSSegmentedViewControlCell.h
//  Yelp Search
//
//  Created by Benjamin Chang on 3/24/14.
//  Copyright (c) 2014 Benjamin Chang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSSegmentedViewControlCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedViewControl;

-(void)setSelectedIndex:(NSInteger)index;
@end
