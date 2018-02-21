//
//  PEJCountryDetails.m
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 18/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import "PEJCountryDetails.h"
#import "Utilities.h"

@implementation PEJCountryDetails
-(instancetype)initWithDictionary:(NSDictionary *) dictionary {
    self = [super init];
    
    if (self) {
        _title = [dictionary objectForKey:PEJCountryDetailTitle];
        _rows = [dictionary objectForKey:PEJCountryDetailRows];
        
        if(NIL_OR_NSNull(_title)) {
            _title = nil;
        }
        
        if(NIL_OR_NSNull(_rows)) {
            _rows = nil;
        }
    }
    
    return self;
}

- (instancetype)init {
    self = [self initWithDictionary:[NSDictionary dictionary]];
    if (self) {
    }
    return self;
}
@end
