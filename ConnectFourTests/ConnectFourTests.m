//
//  ConnectFourTests.m
//  ConnectFourTests
//
//  Created by Jamie Ly on 02/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "ConnectFourTests.h"
#import "Board.h"
#import "JLSize.h"
#import "JLIndex.h"
#import "NSString+Repeat.h"
#import "STExtensions.h"
#import "Marker.h"

@implementation ConnectFourTests

- (void)setUp
{
    [super setUp];
    board = [[Board alloc] init];
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

// board tests
- (void) testShouldHaveASizeOf7ColumnsAnd6Rows {
    JLSize *size = board.size;
    STAssertEquals((NSUInteger)7, size.width, @"Width is correct");
    STAssertEquals((NSUInteger)6, size.height, @"Height is correct");
}

- (void) testShouldMatchAnEmptyBoard {
    NSArray *empty = [@"" repeat: 42];
    STAssertArraysEqual(empty, [board contentsAsArray], @"Board contents are empty");
}

- (void) testShouldReturnTrueWhenEmpty {
    STAssertTrue(board.isEmpty, @"Board is empty");
}

- (void) testShouldReturnPositionIsTrueWhenAppropriate {
    JLIndex *index = [[JLIndex alloc] initWithRow: 3 andColumn: 2];
    Marker *marker = [[Marker alloc] init];
    [board moveWithMarker: marker atIndex: index];
    STAssertTrue([board positionAt: index hasMarker: marker], @"Board has marker");
}

@end
