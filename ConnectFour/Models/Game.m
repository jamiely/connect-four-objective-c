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
-(void) toggleActiveMarker;
-(BOOL) checkIndex:(JLIndex*) index hasMarker: (Marker*) marker
    inDirection: (Direction*) direction withSteps: (NSUInteger) steps;
-(BOOL) isWinAtIndex: (JLIndex*) index;

+ (NSArray*) directions;
@end

@implementation Game

@synthesize board;
@synthesize activeMarker;
@synthesize inactiveMarker;
@synthesize lastIndex;

- (Game*) init {
    self = [super init];
    
    board = [[Board alloc] init];

    activeMarker = Marker.A;
    inactiveMarker = Marker.B;
    
    return self;
}

- (BOOL) move: (Move*) _move {
    int r = [self lowestEmptyRowForColumn: _move.column];
    
    if(r < 0) {
        NSLog(@"Warning, invalid move %@", _move);
        return NO; // @todo, throw exception?
    }
    
    lastIndex = [JLIndex indexWithRow:r andColumn:_move.column];
    [board moveWithMarker: activeMarker atIndex: lastIndex];
    [self toggleActiveMarker];
    
    return YES;
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
    Marker *tmp = inactiveMarker;
    inactiveMarker = activeMarker;
    activeMarker = tmp;
}

-(BOOL) checkIndex:(JLIndex*) index hasMarker: (Marker*) marker
    inDirection: (Direction*) direction withSteps: (NSUInteger) steps {
    if(steps == 0) return YES;
    else if([board isInBounds: index]
        && [board positionAt:index hasMarker:marker]) {
        JLIndex *newIndex =
            [JLIndex indexWithRow: index.row + direction.vertical
                        andColumn: index.column + direction.horizontal];
        return [self checkIndex: newIndex hasMarker:marker
            inDirection:direction withSteps:steps-1];
    }
    else return NO;
}
-(BOOL) isWinAtIndex: (JLIndex*) index {
    if(! [board isInBounds: index]) return NO;
    
    Marker *m = [board markerAtIndex: index];
    if(m == Marker.Empty) return NO;
    
    BOOL __block _isWin = NO;
    [[Game directions] enumerateObjectsUsingBlock:^(Direction *dir, NSUInteger idx, BOOL *stop) {
        if([self checkIndex: index hasMarker: m inDirection: dir withSteps:4]) {
            _isWin = YES;
            (*stop) = YES;
        }
    }];
    
    return _isWin;
}
- (BOOL) isWin {
    BOOL __block _isWin = FALSE;
    [[board indices] enumerateObjectsUsingBlock:^(JLIndex *index, NSUInteger idx, BOOL *stop) {
        if([self isWinAtIndex: index]) {
            _isWin = YES;
            (*stop) = YES;
        }
    }];
    return _isWin;
}

+ (NSArray*) directions {
    static NSArray *_dir = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _dir =  @[
            Direction.North,
            Direction.South,
            Direction.East,
            Direction.West,
            Direction.NorthWest,
            Direction.NorthEast,
            Direction.SouthWest,
            Direction.SouthEast
            ];
    });
    return _dir;
}
@end
