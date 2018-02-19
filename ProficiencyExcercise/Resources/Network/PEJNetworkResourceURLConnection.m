//
//  PEJNetworkResourceURLConnection.m
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 18/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import "PEJNetworkResourceURLConnection.h"
@interface PEJNetworkResourceURLConnection()
@property PEJNetworkResourceCompletion completion;
@property PEJNetworkResourceFailure failure;
@property NSMutableData *data;
@property NSURLResponse *response;
@end

@implementation PEJNetworkResourceURLConnection

- (instancetype)initWithRequest:(NSURLRequest *)request completion:(PEJNetworkResourceCompletion)completion failure:(PEJNetworkResourceFailure)failure
{
    self = [super initWithRequest:request delegate:self startImmediately:NO];
    if (self) {
        _completion = completion;
        _failure = failure;
        _data = [NSMutableData new];
    }
    return self;
}

#pragma mark - NSURLConnectionDelegate

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    PEJNetworkResourceURLConnection *resource = (PEJNetworkResourceURLConnection *) connection;
    resource.failure(error);
}

#pragma mark - NSURLConnectionDataDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    PEJNetworkResourceURLConnection *resource = (PEJNetworkResourceURLConnection *) connection;
    resource.response = response;
    resource.data.length = 0;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    PEJNetworkResourceURLConnection *resource = (PEJNetworkResourceURLConnection *) connection;
    [resource.data appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    PEJNetworkResourceURLConnection *resource = (PEJNetworkResourceURLConnection *) connection;
    
    if ([resource.response isKindOfClass:[NSHTTPURLResponse class]]) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)resource.response;
        if (httpResponse.statusCode >= 400) { // Client/Server Error
            resource.failure([NSError errorWithDomain:PEJErrorDomain code:httpResponse.statusCode userInfo:@{NSLocalizedDescriptionKey: [NSHTTPURLResponse localizedStringForStatusCode:httpResponse.statusCode]}]);
            return;
        }
    }
    
    resource.completion(resource.data);
}
@end
