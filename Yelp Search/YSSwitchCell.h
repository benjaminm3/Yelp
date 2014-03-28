//
//  YSSwitchCell.h
//  Yelp Search
//
//  Created by Benjamin Chang on 3/25/14.
//  Copyright (c) 2014 Benjamin Chang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSSwitchCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *switchCellLabel;
@property (weak, nonatomic) IBOutlet UISwitch *switchCellSwitch;

@end
