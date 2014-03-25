//
//  YSRestaurantViewCell.m
//  Yelp Search
//
//  Created by Benjamin Chang on 3/23/14.
//  Copyright (c) 2014 Benjamin Chang. All rights reserved.
//

#import "YSRestaurantViewCell.h"

@interface YSRestaurantViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *restaurantImage;
@property (weak, nonatomic) IBOutlet UIImageView *reviewImage;
@property (weak, nonatomic) IBOutlet UILabel *restaurantNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *reviewCount;
@end

@implementation YSRestaurantViewCell
@synthesize restaurantNameLabel;
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setRestaurant:(YSRestaurant*)restaurant
{
    if(restaurant != nil) {
    self.restaurantNameLabel.text = restaurant.restaurantName;
    self.restaurantNameLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.addressLabel.text = restaurant.address;
    self.addressLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.phoneLabel.text = restaurant.phone;
    self.phoneLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.reviewCount.text = restaurant.reviews;
    self.reviewCount.lineBreakMode = NSLineBreakByWordWrapping;
    [self.restaurantImage setImageWithURL:restaurant.restaurantImage];
    [self.reviewImage setImageWithURL:restaurant.ratingImage];
    }
}

- (UILabel*) getRestaurantNameLabel
{
    return self.restaurantNameLabel;
}

@end
