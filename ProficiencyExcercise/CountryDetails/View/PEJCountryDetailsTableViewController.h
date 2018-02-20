//
//  PEJCountryDetailsTableViewController.h
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 19/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PEJCountryDetailsViewModel.h"
#import "PEJRowItemViewModel.h"
#import "PEJCountryDetailsTableViewCell.h"

@interface PEJCountryDetailsTableViewController : UITableViewController
@property (nonatomic) PEJCountryDetailsViewModel *viewModel;
@end
