//
//  ViewController.m
//  SelfSizingCells
//
//  Created by Marius Constantinescu on 14/02/15.
//  Copyright (c) 2015 Marius. All rights reserved.
//

#import "ViewController.h"
#import "Data.h"
#import "Cell.h"
#import <AFNetworking.h>

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISlider* slider;
@property (strong, nonatomic) NSArray* dataArray;


@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	[self loadData];
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	self.tableView.allowsSelection = NO;
	self.slider.value = 14;
	[self.slider addTarget:self action:@selector(didSlide:) forControlEvents:UIControlEventValueChanged];
}

- (void)loadData
{
	NSMutableArray* mutableDataArray = [[NSMutableArray alloc] init];
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
	[manager GET:@"https://api.myjson.com/bins/3x4p3" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
		for (NSDictionary* item in responseObject[@"data"][@"items"]) {
			Data* data = [[Data alloc] init];
			[data updateFromDictionary:item];
			[mutableDataArray addObject:data];
		}
		self.dataArray = mutableDataArray;
		[self.tableView reloadData];
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"Error: %@", error);
	}];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
	[self.slider addTarget:cell action:@selector(didSlide:) forControlEvents:UIControlEventValueChanged];
	[cell configureCellWithData:self.dataArray[indexPath.row]];
	return cell;

}

- (void)didSlide:(UISlider*)slider
{
	[self.tableView reloadData];
}



@end
