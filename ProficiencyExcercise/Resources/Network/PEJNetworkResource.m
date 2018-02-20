//
//  PEJNetworkResource.m
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 18/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import "PEJNetworkResource.h"

@implementation PEJNetworkResource
+(void)request:(NSString *)url withCompletion:(PEJNetworkResourceCompletion)completion failure:(PEJNetworkResourceFailure)failure {
    NSURL *nsurl = [[NSURL alloc]initWithString:url];
    if (!nsurl) {
        if (failure) {
            failure([NSError errorWithDomain:PEJErrorDomain code:-1 userInfo:@{NSLocalizedDescriptionKey: @"Could not create NSURL"}]);
        }
    }
    else {
        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:nsurl];
        if (!request) {
            if (failure) {
                failure([NSError errorWithDomain:PEJErrorDomain code:-1 userInfo:@{NSLocalizedDescriptionKey: @"Could not create NSURLRequest"}]);
            }
        }
        else {
            PEJNetworkResourceURLConnection *connection = [[PEJNetworkResourceURLConnection alloc]initWithRequest:request completion:completion failure:failure];
            [connection start];
        }
    }
}
@end
