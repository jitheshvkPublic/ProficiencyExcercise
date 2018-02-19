//
//  MockData.h
//  ProficiencyExcerciseTests
//
//  Created by Jithesh Valsan on 19/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const CountryDetailsWithAllValues = @"{\"title\":\"Canada\",\"rows\":[{\"description\":\"Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony\",\"imageHref\":\"http://fyimusic.ca/wp-content/uploads/2008/06/hockey-night-in-canada.thumbnail.jpg\",\"title\" : \"Beavers\"}]}";

static NSString * const CountryDetailsWithEmptyRows = @"{\"title\":\"Canada\",\"rows\":[]}";

static NSString * const CountryDetailsWithNullTitle = @"{\"title\":null,\"rows\":[]}";


static NSString * const RowItemWithAllValues = @"{\"description\":\"Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony\",\"imageHref\":\"http://fyimusic.ca/wp-content/uploads/2008/06/hockey-night-in-canada.thumbnail.jpg\",\"title\" : \"Beavers\"}";

static NSString * const RowItemWithAllNullValues = @"{\"description\":null,\"imageHref\":null,\"title\" : null}";

@interface MockData : NSObject
@end
