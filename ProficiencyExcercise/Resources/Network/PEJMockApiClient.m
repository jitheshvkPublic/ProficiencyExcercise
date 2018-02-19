//
//  PEJMockApiClient.m
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 18/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import "PEJMockApiClient.h"

@implementation PEJMockApiClient
-(void)requestCountryDetails:(NSString *)url withCompletion:(PEJNetworkResourceCompletion)completion failure:(PEJNetworkResourceFailure)failure {
        NSData *objectData = [CountryDetailsWithAllValues dataUsingEncoding:NSUTF8StringEncoding];
    completion(objectData);
}
@end
