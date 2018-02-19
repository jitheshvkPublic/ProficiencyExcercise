//
//  PEJCountryDetailsViewModel.m
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 18/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import "PEJCountryDetailsViewModel.h"

@interface PEJCountryDetailsViewModel()
@property PEJCountryDetails *countryDetails;
@end

@implementation PEJCountryDetailsViewModel
- (instancetype)initWith:(PEJCountryDetails *)countryDetails
{
    self = [super init];
    if (self) {
        _countryDetails = countryDetails;
        _client = [[PEJNetworkApiClient alloc] init];
    }
    return self;
}

- (instancetype)init
{
    return [self initWith:[[PEJCountryDetails alloc]init]];
}

-(void)getDetailsWith:(PEJNetworkResourceSuccess)success failure:(PEJNetworkResourceFailure)failure {
    PEJNetworkService *service = [[PEJNetworkService alloc] initWithApiClient:self.client];
    [service requestCountryDetailsWithCompletion:^(NSData *Data) {
        if (Data) {
            NSError *error = nil;
            NSString *serverResponse = [[NSString alloc] initWithData:Data encoding:NSASCIIStringEncoding];
            NSString *jsonString = [serverResponse stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
            NSData *formattedJSONData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
            
            NSDictionary *json =  [NSJSONSerialization JSONObjectWithData:formattedJSONData options:NSJSONReadingMutableContainers error:&error];
            
            if ([json isKindOfClass:[NSDictionary class]] && error == nil) {
                self.countryDetails = [[PEJCountryDetails alloc] initWithDictionary:json];
                NSLog(@"%@", json);
                success();
            }
            else {
                failure([NSError errorWithDomain:PEJErrorDomain code:-1 userInfo:@{NSLocalizedDescriptionKey: @"Invalid response data."}]);
            }
        }
    } failure:failure];
}

-(NSString *) getTitle  {
    if (self.countryDetails.title){
        return self.countryDetails.title;
    }
    else {
        return @"";
    }
}

-(NSArray *) getRowItems {
    if (self.countryDetails.rows) {
        NSEnumerator *enumerator = [self.countryDetails.rows objectEnumerator];
        id object;
        NSMutableArray *array = [[NSMutableArray alloc]init];
        
        while (object = [enumerator nextObject]) {
            PEJRowItem *rowItem = [[PEJRowItem alloc]initWithDictionary:object];
            PEJRowItemViewModel *viewModel = [[PEJRowItemViewModel alloc]initWith:rowItem];
            [array addObject:viewModel];
        }
        
        return array;
    }
    else {
        return [NSArray array];
    }
}
@end
