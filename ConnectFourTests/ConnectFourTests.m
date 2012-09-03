//
//  ConnectFourTests.m
//  ConnectFourTests
//
//  Created by Jamie Ly on 02/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "ConnectFourTests.h"
#import "Board.h"
#import "Size.h"

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

@end
