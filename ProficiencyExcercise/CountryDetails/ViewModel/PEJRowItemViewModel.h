//
//  PEJRowItemViewModel.h
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 18/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PEJRowItem.h"

@interface PEJRowItemViewModel : NSObject
-(instancetype)initWith:(PEJRowItem *)rowItem;
-(NSString *)getTitle;
-(NSString *)getDescription;
-(NSString *)getImageURL;
@end
