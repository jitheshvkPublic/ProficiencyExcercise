//
//  PEJRowItemViewModel.h
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 18/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PEJRowItem.h"
#import "PEJNetworkService.h"
#import "PEJNetworkApiClient.h"

@interface PEJRowItemViewModel : NSObject
@property (nonatomic) id<PEJApiClient> client;

-(instancetype)initWith:(PEJRowItem *)rowItem;
-(NSString *)getTitle;
-(NSString *)getDescription;
-(NSString *)getImageURL;
-(void)getImageDataWith:(PEJNetworkResourceCompletion)completionHandler;
@end
