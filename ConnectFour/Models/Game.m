//
//  Game.m
//  ConnectFour
//
//  Created by Jamie Ly on 03/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "Game.h"
#import "Board.h"
#import "Move.h"
#import "Direction.h"
#import "JLSize.h"
#import "JLIndex.h"
#import "Marker.h"

@interface Game()
-(int) lowestEmptyRowForColumn: (NSUInteger) col;
-(void) toggleActiveMarker;
@end

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
    activeMarker = Marker.A;
    
    return self;
}

- (void) move: (Move*) _move {
    int r = [self lowestEmptyRowForColumn: _move.column];
    
    if(r < 0) {
        NSLog(@"Warning, invalid move %@", _move);
        return; // @todo, throw exception?
    }
    
    JLIndex *moveIndex = [JLIndex indexWithRow:r andColumn:_move.column];
    [board moveWithMarker: activeMarker atIndex: moveIndex];
    [self toggleActiveMarker];
}

-(int) lowestEmptyRowForColumn: (NSUInteger) col {
    for(int r = board.size.height; r >= 0; r--) {
        JLIndex *index = [JLIndex indexWithRow: r andColumn: col];
        if([board markerAtIndex: index] == Marker.Empty) return r;
    }
    return -1;
}

- (Marker*) markerAtIndex: (JLIndex*) index {
    return [board markerAtIndex: index];
}

-(void) toggleActiveMarker {
    activeMarker = activeMarker == Marker.A ? Marker.B : Marker.A;
}
@end
