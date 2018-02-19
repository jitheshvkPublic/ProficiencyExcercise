//
//  PEJRowItemViewModel.m
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 18/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import "PEJRowItemViewModel.h"

@interface PEJRowItemViewModel()
@property PEJRowItem *rowItem;
@end

@implementation PEJRowItemViewModel
- (instancetype)initWith:(PEJRowItem *)rowItem
{
    self = [super init];
    if (self) {
        _rowItem = rowItem;
    }
    return self;
}

-(NSString *)getTitle {
    if(self.rowItem.title) {
        return self.rowItem.title;
    }
    else {
        return @"";
    }
}

-(NSString *)getDescription {
    if(self.rowItem.itemDescription) {
        return self.rowItem.itemDescription;
    }
    else {
        return @"";
    }
}

-(NSString *)getImageURL {
    if(self.rowItem.imageHref) {
        return self.rowItem.imageHref;
    }
    else {
        return @"";
    }
}
@end
