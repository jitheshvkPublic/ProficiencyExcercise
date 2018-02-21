//
//  Utilities.h
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 18/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NIL_OR_NSNull(obj) (obj == nil || obj == (id)[NSNull null])

typedef void (^PEJNetworkResourceSuccess) (void);
typedef void (^PEJNetworkResourceCompletion) (NSData *Data);
typedef void (^PEJNetworkResourceFailure) (NSError *Error);

static NSString * const PEJErrorDomain = @"au.com.ProfeciencyExcercise";
static NSString * const PEJCountryDetailTitle = @"title";
static NSString * const PEJCountryDetailRows = @"rows";
static NSString * const PEJRowItemTitle = @"title";
static NSString * const PEJRowItemDescription = @"description";
static NSString * const PEJRowItemImageHref = @"imageHref";
static NSString * const URL = @"https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json";
static NSString * const PEJCountryDetailsTableViewCellIdentifier = @"CountryDetailsTableViewCell";
static NSString * const PEJDefaultImageName = @"no_image";

@interface Utilities : NSObject

@end
