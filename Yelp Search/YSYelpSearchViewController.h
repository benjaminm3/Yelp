//
//  YSYelpSearchViewController.h
//  Yelp Search
//
//  Created by Benjamin Chang on 3/22/14.
//  Copyright (c) 2014 Benjamin Chang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSFilterViewController.h"
#import "YSRestaurantViewCell.h"
#import "YSRestaurant.h"
#import "YelpClient.h"

#import "AFNetworking.h"


@interface YSYelpSearchViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
@end
