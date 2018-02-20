//
//  PEJNetworkResource.h
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 18/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utilities.h"
#import "PEJNetworkResourceURLConnection.h"

@interface PEJNetworkResource : NSObject
+(void)request:(NSString *)url withCompletion:(PEJNetworkResourceCompletion)completion failure:(PEJNetworkResourceFailure)failure;
@end
