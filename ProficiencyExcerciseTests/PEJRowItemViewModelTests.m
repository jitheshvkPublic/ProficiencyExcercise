//
//  PEJRowItemViewModelTests.m
//  ProficiencyExcerciseTests
//
//  Created by Jithesh Valsan on 19/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PEJRowItemViewModel.h"
#import "PEJRowItem.h"
#import "Utilities.h"
#import "MockData.h"
#import "PEJMockApiClient.h"

@interface PEJRowItemViewModelTests : XCTestCase

@end

@implementation PEJRowItemViewModelTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPEJRowItemViewModelWithAllValues {
    NSError *jsonError;
    NSData *objectData = [RowItemWithAllValues dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:objectData options:NSJSONReadingMutableContainers error:&jsonError];
    
    PEJRowItem *rowItem = [[PEJRowItem alloc]initWithDictionary:jsonDictionary];
    XCTAssertNotNil(rowItem);
    
    PEJRowItemViewModel *viewModel = [[PEJRowItemViewModel alloc]initWith:rowItem];
    XCTAssertNotNil(viewModel);
    XCTAssertEqual(viewModel.getTitle, jsonDictionary[PEJRowItemTitle]);
    XCTAssertEqual(viewModel.getDescription, jsonDictionary[PEJRowItemDescription]);
    XCTAssertEqual(viewModel.getImageURL, jsonDictionary[PEJRowItemImageHref]);
}

- (void)testPEJRowItemViewModelWithNullValues {
    NSError *jsonError;
    NSData *objectData = [RowItemWithAllNullValues dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:objectData options:NSJSONReadingMutableContainers error:&jsonError];
    
    PEJRowItem *rowItem = [[PEJRowItem alloc]initWithDictionary:jsonDictionary];
    PEJRowItemViewModel *viewModel = [[PEJRowItemViewModel alloc]initWith:rowItem];
    XCTAssertNotNil(viewModel);
    XCTAssertTrue([viewModel.getTitle isEqualToString:@""]);
    XCTAssertTrue([viewModel.getImageURL isEqualToString:@""]);
    XCTAssertTrue([viewModel.getDescription isEqualToString:@""]);
}

- (void)testGetImageData {
    NSError *jsonError;
    NSData *objectData = [RowItemWithAllValues dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:objectData options:NSJSONReadingMutableContainers error:&jsonError];
    
    PEJRowItem *rowItem = [[PEJRowItem alloc]initWithDictionary:jsonDictionary];
    PEJRowItemViewModel *viewModel = [[PEJRowItemViewModel alloc]initWith:rowItem];
    XCTAssertNotNil(viewModel);
    viewModel.client = [[PEJMockApiClient alloc]init];
    
    XCTestExpectation *asyncExpectation = [self expectationWithDescription:@"testGetImageData"];
    
    [viewModel getImageDataWith:^(NSData *Data) {
        [asyncExpectation fulfill];
        
        XCTAssertNotNil(Data);
    }];
    
    [self waitForExpectationsWithTimeout:1 handler:^(NSError *error) {
        XCTAssertNil(error);
    }];
}

- (void)testPerformanceGetDetails{
    // This is an example of a performance test case.
    [self measureBlock:^{
        PEJRowItemViewModel *viewModel = [[PEJRowItemViewModel alloc]initWith:[[PEJRowItem alloc]init]];
        viewModel.client = [[PEJMockApiClient alloc]init];
        [viewModel getImageDataWith:nil];
    }];
}
@end
