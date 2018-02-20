//
//  PEJCountryDetailsTableViewController.m
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 19/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import "PEJCountryDetailsTableViewController.h"

@interface PEJCountryDetailsTableViewController ()
-(void)setupView;
-(void)reloadData;
-(void)refreshData;
@end

@implementation PEJCountryDetailsTableViewController
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
    [self setupView];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Supporting functions
-(void)setupView {
    //Add pulldown refresh
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    [refreshControl addTarget:self action:@selector(reloadData) forControlEvents:UIControlEventValueChanged];
    if (@available(iOS 10.0, *)) {
        self.tableView.refreshControl = refreshControl;
    } else {
        [self.tableView addSubview:refreshControl];
    }
    
    //Configure TableView
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.tableView registerClass:[PEJCountryDetailsTableViewCell class] forCellReuseIdentifier:PEJCountryDetailsTableViewCellIdentifier];
}

-(void)refreshData {
    self.navigationItem.title = self.viewModel.getTitle;
    [self.tableView reloadData];
    if ([self.refreshControl isRefreshing]) {
        [self.refreshControl endRefreshing];
    }
}

-(void)reloadData {
    __weak PEJCountryDetailsTableViewController *weakSelf = self;
    [self.viewModel getDetailsWith:^{
        [weakSelf.refreshControl endRefreshing];
        [weakSelf refreshData];
    } failure:^(NSError *Error) {
        [weakSelf.refreshControl endRefreshing];
        
        if(Error) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Could not load data" message:[Error localizedDescription] preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:okAction];
            [weakSelf presentViewController:alertController animated:YES completion:nil];
        }
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
    PEJCountryDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PEJCountryDetailsTableViewCellIdentifier forIndexPath:indexPath];

    PEJRowItemViewModel *rowItemViewModel = [self.viewModel.getRowItems objectAtIndex:[indexPath row]];
    [cell configureCellWith:rowItemViewModel];
    return cell;
}

@end
