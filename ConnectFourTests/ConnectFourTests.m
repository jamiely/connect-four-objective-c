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

@interface ConnectFourTests()
- (NSArray *) stringToIndices: (NSString*) s;
- (NSUInteger) strToUInt: (NSString*) s;
@end

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

#pragma mark - Board tests

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
    STAssertFalse([board positionAt: index hasMarker: Marker.B], @"Position does not have marker.");
}

- (void) testShouldCheckForBoundedness {
    NSArray *bounded = [self stringToIndices: @"0 0, 3 3"];
    
    [bounded enumerateObjectsUsingBlock:^(JLIndex *index, NSUInteger idx, BOOL *stop) {
        STAssertTrue([board isInBounds: index], @"Index is within bounds");
    }];
    
    NSArray *unbounded = [self stringToIndices: @"6 0, 0 7"];
    
    [unbounded enumerateObjectsUsingBlock:^(JLIndex *index, NSUInteger idx, BOOL *stop) {
        STAssertFalse([board isInBounds: index],
            [NSString stringWithFormat: @"Index %@ is NOT within bounds", index]);
    }];
}

- (void) testShouldConvertIndexObjectsToArrayIndices {
    NSArray *indices = [self stringToIndices: @"0 0, 0 3, 0 6, 1 0, 1 1, 2 0, 2 1, 5 6"];
    int expectedIndices[8] = {0, 3, 6, 7, 8, 14, 15, 41};
    for(uint i = 0, c = [indices count]; i < c; i++) {
        JLIndex *index = [indices objectAtIndex:i];
        STAssertEquals((NSUInteger)expectedIndices[i], [board indexToInt: index],
            @"Index matches int");
    }
}

- (void) testShouldReturnMarkerWhenUpdatePositionIsCalled {
    STAssertEqualObjects(Marker.A, [board updatePosition: 0 withMarker: Marker.A], @"Markers are the same");
}

- (void) testShouldReturnTrueWhenValidMove {
    JLIndex *index = [JLIndex indexWithRow: 0 andColumn: 2];
    STAssertTrue([board moveWithMarker: Marker.A atIndex: index], @"Move was valid");
}

- (void) testShouldReturnCorrectMarkerAfterMove {
    JLIndex *index = [JLIndex indexWithRow: 0 andColumn: 2];
    [board moveWithMarker: Marker.A atIndex: index];
    STAssertEquals(Marker.A, [board markerAtIndex: index], @"Markers match");
}

- (void) testHasAvailableMoves {
    STAssertTrue([board hasAvailableMoves], @"Has available moves");
}

- (void) testShouldDetectWhenNoMoves {
    NSArray *indices = [board indices];
    [indices enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [board moveWithMarker: Marker.A atIndex: obj];
        NSLog(@"move index: %@", obj);
    }];
    STAssertFalse([board hasAvailableMoves], @"Board does not have any moves left");
}

#pragma mark - Helper functions

- (NSArray *) stringToIndices: (NSString*) s {
    NSArray *stringPoints = [s componentsSeparatedByString: @","];
    NSMutableArray *rtn = [NSMutableArray array];
    
    [stringPoints enumerateObjectsUsingBlock:^(NSString *strPt, NSUInteger idx, BOOL *stop) {
        NSArray *nums = [[strPt stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] componentsSeparatedByString:@" "];
        NSUInteger r = [self strToUInt:[nums objectAtIndex: 0]],
                   c = [self strToUInt:[nums objectAtIndex: 1]];
        NSLog(@"stringToIndices: \"%@\" converted to Row: %d Column: %d", strPt, r, c);
        [rtn addObject: [JLIndex indexWithRow: r andColumn: c]];
    }];
    
    return [NSArray arrayWithArray: rtn];
}

- (NSUInteger) strToUInt: (NSString*) s {
    return [[s stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]] intValue];
}

@end
