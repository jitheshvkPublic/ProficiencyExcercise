//
//  PEJCountryDetailsViewModelTests.m
//  ProficiencyExcerciseTests
//
//  Created by Jithesh Valsan on 19/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Utilities.h"
#import "PEJCountryDetails.h"
#import "PEJCountryDetailsViewModel.h"
#import "Utilities.h"
#import "PEJMockApiClient.h"

@interface PEJCountryDetailsViewModelTests : XCTestCase

@end

@implementation PEJCountryDetailsViewModelTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGetDetails {
    PEJCountryDetailsViewModel *viewModel = [[PEJCountryDetailsViewModel alloc] initWith:[[PEJCountryDetails alloc]init]];
    XCTAssertNotNil(viewModel);
    viewModel.client = [[PEJMockApiClient alloc]init];
    
     XCTestExpectation *asyncExpectation = [self expectationWithDescription:@"testGetDetails"];
    
    [viewModel getDetailsWith:^{
        [asyncExpectation fulfill];
        XCTAssertTrue([viewModel.getTitle isEqualToString:@"Canada"]);
        XCTAssertNotNil(viewModel.getRowItems);
    } failure:^(NSError *Error) {
        [asyncExpectation fulfill];
        XCTAssertNotNil(Error);
    }];
    
    [self waitForExpectationsWithTimeout:1 handler:^(NSError *error) {
        XCTAssertNil(error);
    }];
}

- (void)testPEJCountryDetailsViewModel {
    NSError *jsonError;
    NSData *objectData = [CountryDetailsWithAllValues dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:objectData options:NSJSONReadingMutableContainers error:&jsonError];
    
    PEJCountryDetails *countryDetails = [[PEJCountryDetails alloc]initWithDictionary:jsonDictionary];
    PEJCountryDetailsViewModel *viewModel = [[PEJCountryDetailsViewModel alloc] initWith:countryDetails];
    XCTAssertNotNil(viewModel);
    XCTAssertTrue([viewModel.getTitle isEqualToString:jsonDictionary[PEJCountryDetailTitle]]);
}

- (void)testPerformanceGetDetails{
    // This is an example of a performance test case.
    [self measureBlock:^{
        PEJCountryDetailsViewModel *viewModel = [[PEJCountryDetailsViewModel alloc] initWith:[[PEJCountryDetails alloc]init]];
        viewModel.client = [[PEJMockApiClient alloc]init];
        
        [viewModel getDetailsWith:^{
        } failure:^(NSError *Error) {
        }];
    }];
}

@end
