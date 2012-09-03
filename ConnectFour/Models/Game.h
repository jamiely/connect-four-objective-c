//
//  Game.h
//  ConnectFour
//
//  Created by Jamie Ly on 03/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Board;
@class Move;
@class Marker;
@class JLIndex;

@interface Game : NSObject {
    Board *board;
    NSArray *directions;
    Marker *activeMarker;
}

@property (nonatomic, strong) Board *board;
@property (nonatomic, strong) NSArray *directions;
@property (nonatomic, strong) Marker *activeMarker;

- (BOOL) move: (Move*) _move;
- (Marker*) markerAtIndex: (JLIndex*) index;
- (int) lowestEmptyRowForColumn: (NSUInteger) col;
- (BOOL) isWin;

@end
