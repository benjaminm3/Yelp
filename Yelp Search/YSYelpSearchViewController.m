//
//  YSYelpSearchViewController.m
//  Yelp Search
//
//  Created by Benjamin Chang on 3/22/14.
//  Copyright (c) 2014 Benjamin Chang. All rights reserved.
//

#import "YSYelpSearchViewController.h"


NSString * const kYelpConsumerKey = @"vxKwwcR_NMQ7WaEiQBK_CA";
NSString * const kYelpConsumerSecret = @"33QCvh5bIF5jIHR5klQr7RtBDhQ";
NSString * const kYelpToken = @"uRcRswHFYa1VkDrGV6LAW2F8clGh5JHV";
NSString * const kYelpTokenSecret = @"mqtKIxMIR4iBtBPZCmCLEb-Dz3Y";

@interface YSYelpSearchViewController ()

@property (weak, nonatomic) IBOutlet UITableView *restaurantTableView;
@property (nonatomic, strong) YelpClient *client;
@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) NSMutableArray *arrayOfRestaurants;
@property (strong, nonatomic) NSString *searchTerm;
@end

@implementation YSYelpSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.client = [[YelpClient alloc] initWithConsumerKey:kYelpConsumerKey consumerSecret:kYelpConsumerSecret accessToken:kYelpToken accessSecret:kYelpTokenSecret];
        
            [self.client searchWithTerm:@"Thai" success:^(AFHTTPRequestOperation *operation, id response) {
                

            self.arrayOfRestaurants = [[NSMutableArray alloc] init];
            for (NSDictionary *restaurant in response[@"businesses"]) {
                [self.arrayOfRestaurants addObject:[[YSRestaurant alloc] initWithRestaurantData:restaurant]];
            }

            [self.restaurantTableView reloadData];
                
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"error: %@", [error description]);
        }];
        

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Table setup
    self.restaurantTableView.dataSource = self;
    self.restaurantTableView.delegate = self;
    UINib *nib = [UINib nibWithNibName:@"YSRestaurantViewCell" bundle:nil];
    [self.restaurantTableView registerNib:nib forCellReuseIdentifier:@"Cell"];
    //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    UINavigationBar *headerView = [[UINavigationBar alloc] initWithFrame:CGRectMake(0,0,320,45)];
    
    //The UINavigationItem is neede as a "box" that holds the Buttons or other elements
    UINavigationItem *buttonCarrier = [[UINavigationItem alloc]initWithTitle:@"Filter"];
    
    //Creating some buttons:
    UIBarButtonItem *barBackButton = [[UIBarButtonItem alloc] initWithTitle:@"Filter" style:UIBarButtonItemStyleDone target:self action:@selector(filter)];
    
    //Putting the Buttons on the Carrier
    [buttonCarrier setLeftBarButtonItem:barBackButton];
    
    //The NavigationBar accepts those "Carrier" (UINavigationItem) inside an Array
    NSArray *barItemArray = [[NSArray alloc]initWithObjects:buttonCarrier,nil];
    
    // Attaching the Array to the NavigationBar
    [headerView setItems:barItemArray];
    
    // Adding the NavigationBar to the TableView
    [self.restaurantTableView setTableHeaderView:headerView];
    
    [headerView setBarTintColor:[UIColor redColor]];
    [headerView setTintColor:[UIColor whiteColor]];
    [headerView setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    
    // Set search bar
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.delegate = self;
    
    headerView.topItem.titleView = self.searchBar;

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"begin!");
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"end!");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)filter {
 //   [self.searchBar resignFirstResponder];
    NSString *className = NSStringFromClass([YSFilterViewController class]);
    YSFilterViewController *filterViewController = [[YSFilterViewController alloc] initWithNibName:className bundle:nil];
    filterViewController.delegate = self;
    [self presentViewController:filterViewController animated:YES completion:^{}];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YSRestaurantViewCell *cell = [self.restaurantTableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    YSRestaurant *restaurant = [self.arrayOfRestaurants objectAtIndex:indexPath.row];
    if(![restaurant isEqual:[NSNull null]]) {
      [cell setRestaurant:restaurant];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.searchBar resignFirstResponder];
    [self.restaurantTableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    YSRestaurantViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    CGSize boundingSize = CGSizeMake([cell getRestaurantNameLabel].frame.size.width, FLT_MAX);
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:17];
    YSRestaurant* restaurant = [self.arrayOfRestaurants objectAtIndex:indexPath.row];
    NSLog(@"%@", restaurant.restaurantName);
    CGRect textRect = [restaurant.restaurantName boundingRectWithSize:boundingSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes: @{NSFontAttributeName:font} context:nil];
    NSLog(@"%f", textRect.size.height);
    [[cell getRestaurantNameLabel] setFrame:textRect];
    return textRect.size.height + 110;
}


- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    UITextField *searchBarTextField;
    
    for (UIView *subView in searchBar.subviews){
        for (UIView *secondLevelSubView in subView.subviews){
            if ([secondLevelSubView isKindOfClass:[UITextField class]]) {
                searchBarTextField = (UITextField *)secondLevelSubView;
                break;
            }
        }
    }
    
    [searchBar resignFirstResponder];
    [self.client searchWithTerm:searchBarTextField.text success:^(AFHTTPRequestOperation *operation, id response) {
        self.arrayOfRestaurants = [[NSMutableArray alloc] init];
        for (NSDictionary *restaurant in response[@"businesses"]) {
            [self.arrayOfRestaurants addObject:[[YSRestaurant alloc] initWithRestaurantData:restaurant]];
        }
        [self.restaurantTableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error: %@", [error description]);
    }];
    
}
-(void)searchWithDictionary:(NSMutableDictionary *)dict {
    //[dictionary setValue:self.searchTerm forKey:@"term"];
    UITextField *searchBarTextField;
    for (UIView *subView in self.searchBar.subviews){
        for (UIView *secondLeveSubView in subView.subviews){
            if ([secondLeveSubView isKindOfClass:[UITextField class]]) {
                searchBarTextField = (UITextField *)secondLeveSubView;
                break;
            }
        }
    }
    

    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];

    [dictionary setObject:searchBarTextField.text forKey:@"term"];
    [dictionary addEntriesFromDictionary:dict];
    [dictionary setValue:@"san francisco" forKey:@"location"];
    
    [self.client searchWithDictionary:dictionary success:^(AFHTTPRequestOperation *operation, id response) {
        self.arrayOfRestaurants = [[NSMutableArray alloc] init];
        for (NSDictionary *restaurant in response[@"businesses"]) {
            [self.arrayOfRestaurants addObject:[[YSRestaurant alloc] initWithRestaurantData:restaurant]];
        }
        [self.restaurantTableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error: %@", [error description]);
    }];
}

@end
