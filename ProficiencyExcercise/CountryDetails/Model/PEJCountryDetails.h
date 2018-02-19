//
//  PEJCountryDetails.h
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 18/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PEJCountryDetails : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSMutableArray* rows;

-(instancetype)initWithDictionary:(NSDictionary *) dictionary;
@end
