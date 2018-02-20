//
//  PEJCountryDetailsViewModel.h
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 18/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PEJCountryDetails.h"
#import "Utilities.h"
#import "PEJNetworkService.h"
#import "PEJApiClient.h"
#import "PEJNetworkApiClient.h"
#import "PEJRowItemViewModel.h"

@interface PEJCountryDetailsViewModel : NSObject
@property (nonatomic) id<PEJApiClient> client;
-(instancetype)initWith:(PEJCountryDetails *)countryDetails;
-(void)getDetailsWith:(PEJNetworkResourceSuccess)success failure:(PEJNetworkResourceFailure)Failure;
-(NSString *) getTitle;
-(NSArray *) getRowItems;
@end
