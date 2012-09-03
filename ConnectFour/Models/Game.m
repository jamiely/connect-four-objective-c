//
//  Game.m
//  ConnectFour
//
//  Created by Jamie Ly on 03/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "Game.h"
#import "Board.h"
#import "Direction.h"

@implementation Game

@synthesize board;
@synthesize directions;

- (Game*) init {
    self = [super init];
    
    board = [[Board alloc] init];
    directions = [NSArray arrayWithObjects: 
        Direction.North,
        Direction.South,
        Direction.East,
        Direction.West,
        Direction.NorthWest,
        Direction.NorthEast,
        Direction.SouthWest,
        Direction.SouthEast
        , nil];
    
    return self;
}

@end
