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
    Marker *activeMarker;
    Marker *inactiveMarker;
    JLIndex *lastIndex;
}

@property (nonatomic, strong) Board *board;
@property (nonatomic, strong) Marker *activeMarker;
@property (nonatomic, strong) Marker *inactiveMarker;
@property (nonatomic, strong) JLIndex *lastIndex;

- (BOOL) move: (Move*) _move;
- (Marker*) markerAtIndex: (JLIndex*) index;
- (int) lowestEmptyRowForColumn: (NSUInteger) col;
- (BOOL) isWin;

@end
