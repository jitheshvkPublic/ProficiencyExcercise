//
//  PEJNetworkApiClient.m
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 18/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import "PEJNetworkApiClient.h"

@implementation PEJNetworkApiClient
-(void)requestCountryDetails:(NSString *)url withCompletion:(PEJNetworkResourceCompletion)completion failure:(PEJNetworkResourceFailure)failure {
    [PEJNetworkResource request:url withCompletion:completion failure:failure];
}
@end
