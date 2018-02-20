//
//  PEJRowItem.h
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 18/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utilities.h"

@interface PEJRowItem : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *itemDescription;
@property (nonatomic, copy) NSString *imageHref;

-(instancetype)initWithDictionary:(NSDictionary *) dictionary;
@end
