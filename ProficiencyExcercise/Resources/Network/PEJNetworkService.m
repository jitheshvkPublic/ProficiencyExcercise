//
//  PEJNetworkService.m
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 18/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import "PEJNetworkService.h"

@implementation PEJNetworkService
- (instancetype)initWithApiClient:(id<PEJApiClient>)apiClient
{
    self = [super init];
    if (self) {
        _client = apiClient;
    }
    return self;
}

-(void)requestCountryDetailsWithCompletion:(PEJNetworkResourceCompletion)completion failure:(PEJNetworkResourceFailure)failure; {
    if (self.client && [self.client respondsToSelector:@selector(requestCountryDetails:withCompletion:failure:)]) {
        [self.client requestCountryDetails:URL withCompletion:completion failure:failure];
    }
}
@end
