//
//  PEJRowItemViewModel.m
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 18/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import "PEJRowItemViewModel.h"

@interface PEJRowItemViewModel()
@property PEJRowItem *rowItem;
@property NSData *imageData;
@end

@implementation PEJRowItemViewModel
- (instancetype)initWith:(PEJRowItem *)rowItem {
    self = [super init];
    if (self) {
        _rowItem = rowItem;
        _client = [[PEJNetworkApiClient alloc] init];
    }
    return self;
}

-(NSString *)getTitle {
    if(self.rowItem.title) {
        return self.rowItem.title;
    }
    else {
        return @"";
    }
}

-(NSString *)getDescription {
    if(self.rowItem.itemDescription) {
        return self.rowItem.itemDescription;
    }
    else {
        return @"";
    }
}

-(NSString *)getImageURL {
    if(self.rowItem.imageHref) {
        return self.rowItem.imageHref;
    }
    else {
        return @"";
    }
}

-(void)getImageDataWith:(PEJNetworkResourceCompletion)completionHandler {
    if (self.imageData) {
        if (completionHandler) {
            completionHandler(self.imageData);
        }
    }
    else {
        if (self.rowItem.imageHref) {
            __weak PEJRowItemViewModel *weakSelf = self;
            PEJNetworkService *service = [[PEJNetworkService alloc]initWithApiClient:self.client];
            [service requestImageWithURLString:self.rowItem.imageHref withCompletion:^(NSData *Data) {
                if (Data) {
                    weakSelf.imageData = [[NSData alloc]initWithData:Data];
                    if (completionHandler) {
                        completionHandler(Data);
                    }
                }
            } falure:^(NSError *Error) {
                if (completionHandler) {
                    completionHandler(nil);
                }
            }];
        }
        else {
            if (completionHandler) {
                completionHandler(nil);
            }
        }
    }
}
@end
