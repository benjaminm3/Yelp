//
//  YSRestaurant.h
//  Yelp Search
//
//  Created by Benjamin Chang on 3/23/14.
//  Copyright (c) 2014 Benjamin Chang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YSRestaurant : NSObject
//@property (nonatomic, strong) NSDictionary *restaurantData;
@property (nonatomic, strong) NSString *restaurantName;
@property (nonatomic, strong) NSString *distance;
@property (nonatomic, strong) NSString *reviews;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSMutableArray *categoriesArray;
@property (nonatomic, strong) NSString *categories;
@property (nonatomic, strong) NSURL *restaurantImage;
@property (nonatomic, strong) NSURL *ratingImage;
@property (nonatomic, assign) int isOpen;

- (id)initWithRestaurantData:(NSDictionary *)restaurantData;

@end
