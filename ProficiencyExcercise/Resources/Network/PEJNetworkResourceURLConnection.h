//
//  PEJNetworkResourceURLConnection.h
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 18/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utilities.h"

@interface PEJNetworkResourceURLConnection : NSURLConnection <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

- (instancetype)initWithRequest:(NSURLRequest *)request completion:(PEJNetworkResourceCompletion)completion failure:(PEJNetworkResourceFailure)failure;
@end
