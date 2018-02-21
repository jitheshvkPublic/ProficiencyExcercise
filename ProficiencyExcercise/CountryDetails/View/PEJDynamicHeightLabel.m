//
//  PEJDynamicHeightLabel.m
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 19/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import "PEJDynamicHeightLabel.h"

@interface PEJDynamicHeightLabel()
-(void)setup;
@end

@implementation PEJDynamicHeightLabel
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup {
    self.translatesAutoresizingMaskIntoConstraints = false;
    self.numberOfLines = 0; //set this to 0 for dynamic height UITableViewCell.
}
@end
