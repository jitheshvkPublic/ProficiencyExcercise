//
//  PEJMockApiClient.h
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 18/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PEJApiClient.h"
#import "Utilities.h"
#import "MockData.h"

@interface PEJMockApiClient : NSObject <PEJApiClient>
-(void)requestCountryDetails:(NSString *)url withCompletion:(PEJNetworkResourceCompletion)completion failure:(PEJNetworkResourceFailure)failure;
-(void)requestImageWithURL:(NSString *)url completion:(PEJNetworkResourceCompletion)completion failure:(PEJNetworkResourceFailure)failure;
@end
