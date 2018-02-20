//
//  PEJRowItemTests.m
//  ProficiencyExcerciseTests
//
//  Created by Jithesh Valsan on 19/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PEJRowItem.h"
#import "MockData.h"
#import "Utilities.h"

@interface PEJRowItemTests : XCTestCase

@end

@implementation PEJRowItemTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRowItemWithAllValues {
    NSError *jsonError;
    NSData *objectData = [RowItemWithAllValues dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:objectData options:NSJSONReadingMutableContainers error:&jsonError];
    
    PEJRowItem *rowItem = [[PEJRowItem alloc]initWithDictionary:jsonDictionary];
    XCTAssertNotNil(rowItem);
    XCTAssertTrue([rowItem.title isEqualToString:jsonDictionary[PEJRowItemTitle]]);
    XCTAssertTrue([rowItem.itemDescription isEqualToString: jsonDictionary[PEJRowItemDescription]]);
    XCTAssertTrue([rowItem.imageHref isEqualToString:jsonDictionary[PEJRowItemImageHref]]);
}

- (void)testRowItemWithAllNullValues {
    NSError *jsonError;
    NSData *objectData = [RowItemWithAllNullValues dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:objectData options:NSJSONReadingMutableContainers error:&jsonError];
    
    PEJRowItem *rowItem = [[PEJRowItem alloc]initWithDictionary:jsonDictionary];
    XCTAssertNotNil(rowItem);
    XCTAssertNil(rowItem.title);
    XCTAssertNil(rowItem.itemDescription);
    XCTAssertNil(rowItem.imageHref);
}

@end
