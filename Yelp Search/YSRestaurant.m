//
//  YSRestaurant.m
//  Yelp Search
//
//  Created by Benjamin Chang on 3/23/14.
//  Copyright (c) 2014 Benjamin Chang. All rights reserved.
//

#import "YSRestaurant.h"

@implementation YSRestaurant

- (id)initWithRestaurantData:(NSDictionary *)restaurantData {
    self = [super init];
//    self.restaurantData = restaurantData;
    if (restaurantData != nil) {
        NSArray *addresses = restaurantData[@"location"][@"address"];
        if (addresses.count > 0) {
            self.address = restaurantData[@"location"][@"address"][0];
        }
        else {
            self.address = @"";
        }
        self.restaurantName = restaurantData[@"name"];
        self.distance = @"0.0 mi";
        self.reviews = [NSString stringWithFormat:@"%@ Reviews", restaurantData[@"review_count"]];
        self.ratingImage = [NSURL URLWithString: restaurantData[@"rating_img_url"]];
        self.restaurantImage = [NSURL URLWithString: restaurantData[@"image_url"]];
        self.phone = [NSString stringWithFormat:@"%@", restaurantData[@"phone"]];
        self.isOpen = !restaurantData[@"is_closed"];
//        self.categoriesArray = restaurantData[@"categories"];
//        self.categories = @"";
//        for (int i = 0; i < self.categoriesArray.count; i++) {
//            if (i == 0) {
//                self.categories = self.categoriesArray[i][0];
//            }
//            else {
//                self.categories = [self.categories stringByAppendingFormat:@", %@", self.categoriesArray[i][0]];
//            }
//        }
    }
    
    return self;
    
}

@end
