//
//  CountryDetailsTableViewController.m
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 19/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import "CountryDetailsTableViewController.h"

@interface CountryDetailsTableViewController ()
-(void)setup;
-(void)refreshData;
@end

@implementation CountryDetailsTableViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        _viewModel = [[PEJCountryDetailsViewModel alloc]init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Supporting functions
-(void)setup {
    //Add pulldown refresh
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    [refreshControl addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventValueChanged];
    if (@available(iOS 10.0, *)) {
        self.tableView.refreshControl = refreshControl;
    } else {
        [self.tableView addSubview:refreshControl];
    }
    
    //Configure TableView
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}

-(void)refreshData {
    [self.viewModel getDetailsWith:^{
        [self.tableView reloadData];
        [self.refreshControl endRefreshing];
    } failure:^(NSError *Error) {
        [self.refreshControl endRefreshing];
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.viewModel.getRowItems.count) {
        return self.viewModel.getRowItems.count;
    }
    else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];    // Configure the cell...
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    PEJRowItemViewModel *rowItemViewModel = [self.viewModel.getRowItems objectAtIndex:[indexPath row]];
    cell.textLabel.text = rowItemViewModel.getTitle;
    return cell;
}

@end
