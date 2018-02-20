//
//  PEJCountryDetailsTableViewCell.h
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 19/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PEJDynamicHeightLabel.h"
#import "PEJRowItemViewModel.h"

@interface PEJCountryDetailsTableViewCell : UITableViewCell
@property PEJDynamicHeightLabel *rowTitleLabel;
@property PEJDynamicHeightLabel *rowDescriptionLabel;
@property UIImageView *rowImageView;

-(void)configureCellWith:(PEJRowItemViewModel *)rowItem;
@end
