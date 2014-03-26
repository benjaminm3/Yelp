//
//  YSFilterViewController.h
//  Yelp Search
//
//  Created by Benjamin Chang on 3/23/14.
//  Copyright (c) 2014 Benjamin Chang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSSegmentedViewControlCell.h"

@protocol YSFilterViewDelegate <NSObject>

-(void)searchWithDictionary:(NSMutableDictionary *)data;

@end
@interface YSFilterViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, assign) id<YSFilterViewDelegate> delegate;

@end
