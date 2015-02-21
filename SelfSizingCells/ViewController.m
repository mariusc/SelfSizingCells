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
@property (strong, nonatomic) NSArray* dataArray;


@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	[self loadData];
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	self.tableView.allowsSelection = NO;
}

- (void)loadData
{
	NSMutableArray* mutableDataArray = [[NSMutableArray alloc] init];
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
	[manager GET:@"https://mobilev2.like.st/api/response/89/mariusTest" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
		NSLog(@"JSON: %@", responseObject);
		for (NSDictionary* item in responseObject[@"data"][@"data"]) {
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
	
	[cell configureCellWithData:self.dataArray[indexPath.row]];
	return cell;
	
//	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"normalCell" forIndexPath:indexPath];
//	cell.textLabel.text = ((Data*)self.dataArray[indexPath.row]).text;
//	cell.textLabel.numberOfLines = 0;
//	return cell;
}

@end
