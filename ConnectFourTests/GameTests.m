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

- (void) testShouldHaveDirections {
    NSArray *directions = [NSArray arrayWithObjects: 
        Direction.North,
        Direction.South,
        Direction.East,
        Direction.West,
        Direction.NorthWest,
        Direction.NorthEast,
        Direction.SouthWest,
        Direction.SouthEast
        , nil];
    STAssertArraysEqual(directions, game.directions, @"Game has directions");
}

@end
