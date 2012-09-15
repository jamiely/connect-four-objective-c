//
//  GameTests.m
//  ConnectFour
//
//  Created by Jamie Ly on 03/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "GameTests.h"
#import "Game.h"
#import "Direction.h"
#import "STExtensions.h"

@implementation GameTests

- (void) setUp {
    [super setUp];
    game = [[Game alloc] init];
}

- (void) testShouldHaveBoard {
    STAssertNotNil(game.board, @"A game should have a board");
}

@end
