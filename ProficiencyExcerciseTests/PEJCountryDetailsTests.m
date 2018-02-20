//
//  PEJCountryDetailsTests.m
//  ProficiencyExcerciseTests
//
//  Created by Jithesh Valsan on 19/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PEJCountryDetails.h"
#import "Utilities.h"
#import "MockData.h"

@interface PEJCountryDetailsTests : XCTestCase

@end

@implementation PEJCountryDetailsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPEJCountryDetailsWithAllValues {
    NSError *jsonError;
    NSData *objectData = [CountryDetailsWithAllValues dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:objectData options:NSJSONReadingMutableContainers error:&jsonError];
    
    PEJCountryDetails *countryDetails = [[PEJCountryDetails alloc]initWithDictionary:jsonDictionary];
    XCTAssertNotNil(countryDetails);
    XCTAssertTrue([countryDetails.title isEqualToString:jsonDictionary[PEJCountryDetailTitle]]);
    XCTAssertEqual(countryDetails.rows, jsonDictionary[PEJCountryDetailRows]);
    
    NSDictionary *firstObject = [jsonDictionary[PEJCountryDetailRows] objectAtIndex:0];
    XCTAssertEqual(countryDetails.rows[0], firstObject);
}

- (void)testPEJCountryDetailsWithEmptyRows {
    NSError *jsonError;
    NSData *objectData = [CountryDetailsWithEmptyRows dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:objectData options:NSJSONReadingMutableContainers error:&jsonError];
    
    PEJCountryDetails *countryDetails = [[PEJCountryDetails alloc]initWithDictionary:jsonDictionary];
    XCTAssertNotNil(countryDetails);
    XCTAssertTrue([countryDetails.title isEqualToString:jsonDictionary[PEJCountryDetailTitle]]);
    XCTAssertEqual(countryDetails.rows, jsonDictionary[PEJCountryDetailRows]);
}

- (void)testPEJCountryDetailsWithNullTitle {
    NSError *jsonError;
    NSData *objectData = [CountryDetailsWithNullTitle dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:objectData options:NSJSONReadingMutableContainers error:&jsonError];
    
    PEJCountryDetails *countryDetails = [[PEJCountryDetails alloc]initWithDictionary:jsonDictionary];
    XCTAssertNotNil(countryDetails);
    XCTAssertNil(countryDetails.title);
    XCTAssertEqual(countryDetails.rows, jsonDictionary[PEJCountryDetailRows]);
}

@end
