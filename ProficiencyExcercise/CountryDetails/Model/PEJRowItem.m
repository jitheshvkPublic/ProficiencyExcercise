//
//  PEJRowItem.m
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 18/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import "PEJRowItem.h"

@implementation PEJRowItem
-(instancetype)initWithDictionary:(NSDictionary *) dictionary {
    self = [super init];
    
    if (self) {
        _title = [dictionary objectForKey:PEJRowItemTitle];
        _itemDescription = [dictionary objectForKey:PEJRowItemDescription];
        _imageHref = [dictionary objectForKey:PEJRowItemImageHref];
        
        if(NIL_OR_NSNull(_title)) {
            _title = nil;
        }
        if(NIL_OR_NSNull(_itemDescription)) {
            _itemDescription = nil;
        }
        if(NIL_OR_NSNull(_imageHref)) {
            _imageHref = nil;
        }
    }
    
    return self;
}

- (instancetype)init
{
    self = [self initWithDictionary:[NSDictionary dictionary]];
    if (self) {
    }
    return self;
}
@end
