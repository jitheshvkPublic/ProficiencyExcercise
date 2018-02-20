//
//  PEJNetworkService.h
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 18/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PEJApiClient.h"
#import "Utilities.h"

@interface PEJNetworkService : NSObject
@property (nonatomic,weak) id<PEJApiClient> client;

- (instancetype)initWithApiClient:(id <PEJApiClient>)apiClient;
-(void)requestCountryDetailsWithCompletion:(PEJNetworkResourceCompletion)completion failure:(PEJNetworkResourceFailure)failure;
-(void)requestImageWithURLString:(NSString *)url withCompletion:(PEJNetworkResourceCompletion)completion falure:(PEJNetworkResourceFailure)failure;
@end
