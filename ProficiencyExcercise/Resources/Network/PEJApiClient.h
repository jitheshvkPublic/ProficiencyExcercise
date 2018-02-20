//
//  PEJApiClient.h
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 18/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utilities.h"

@protocol PEJApiClient <NSObject>
-(void)requestCountryDetails:(NSString *)url withCompletion:(PEJNetworkResourceCompletion)completion failure:(PEJNetworkResourceFailure)failure;
-(void)requestImageWithURL:(NSString *)url completion:(PEJNetworkResourceCompletion)completion failure:(PEJNetworkResourceFailure)failure;
@end
