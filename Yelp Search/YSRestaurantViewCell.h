//
//  YSRestaurantViewCell.h
//  Yelp Search
//
//  Created by Benjamin Chang on 3/23/14.
//  Copyright (c) 2014 Benjamin Chang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSRestaurant.h"
#import "UIImageView+AFNetworking.h"

@interface YSRestaurantViewCell : UITableViewCell


- (void)setRestaurant:(YSRestaurant*)restaurant;
- (UILabel*)getRestaurantNameLabel;
@end
