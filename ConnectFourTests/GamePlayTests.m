//
//  GamePlayTests.m
//  ConnectFour
//
//  Created by Jamie Ly on 03/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "GamePlayTests.h"
#import "Game.h"
#import "Move.h"
#import "JLIndex.h"
#import "Marker.h"

@implementation GamePlayTests

- (void) setUp {
    [super setUp];

    game = [[Game alloc] init];
}

- (void) testShouldHappenInMovesByChoosingFirstColumn {
    Move *move = [[Move alloc] initWithColumn: 1];
    [game move: move];
    JLIndex *index = [JLIndex indexWithRow:5 andColumn:1];
    STAssertEquals(Marker.A, [game markerAtIndex: index], @"Marker is at correct index");
}


- (void) testShouldHappenInMovesByChoosingSecondColumn {
    Move *move = [Move moveWithColumn: 1];
    [game move: move];
    [game move: move];
    JLIndex *index = [JLIndex indexWithRow:4 andColumn:1];
    STAssertEquals(Marker.B, [game markerAtIndex: index], @"Marker is at correct index");
}

- (void) testShouldStartWithMarkerA {
    STAssertEquals(Marker.A, game.activeMarker, @"Starts with Marker A");
}

- (void) testShouldAlternateBetweenTwoMarkers {
    [game move: [Move moveWithColumn: 1]];
    STAssertEquals(Marker.B, game.activeMarker, @"Markers are equal");
}

- (void) testShouldDetectVerticalMatch {
    Move *moveA = [Move moveWithColumn: 1];
    Move *moveB = [Move moveWithColumn: 2];
    for(int i=0; i<3; i++) {
        STAssertTrue([game move: moveA], @"Move A");
        STAssertTrue([game move: moveB], @"Move B");
    }
    STAssertFalse([game isWin], @"No winner yet");
    [game move: moveA];
    STAssertTrue([game isWin], @"Someone has won");
    
}

- (void) testShouldNotAllowMoveInFullColumn {
    Move *move = [Move moveWithColumn: 1];
    STAssertTrue([game move: move], @"Move Okay");
    STAssertTrue([game move: move], @"Move Okay");
    STAssertTrue([game move: move], @"Move Okay");
    STAssertTrue([game move: move], @"Move Okay");
    STAssertTrue([game move: move], @"Move Okay");
    STAssertTrue([game move: move], @"Move Okay");
    STAssertFalse([game move: move], @"Move NOT Okay");
}

- (void) testShouldDetermineFirstEmptyRowInColumn {
    Move *move = [Move moveWithColumn: 1];
    
    STAssertEquals(5, [game lowestEmptyRowForColumn: 1], @"Lowest column");
    [game move: move];
    
    STAssertEquals(4, [game lowestEmptyRowForColumn: 1], @"Lowest column");
    [game move: move];
    
    STAssertEquals(3, [game lowestEmptyRowForColumn: 1], @"Lowest column");
    [game move: move];
    
    STAssertEquals(2, [game lowestEmptyRowForColumn: 1], @"Lowest column");
    [game move: move];
    
    STAssertEquals(1, [game lowestEmptyRowForColumn: 1], @"Lowest column");
    [game move: move];
    
    STAssertEquals(0, [game lowestEmptyRowForColumn: 1], @"Lowest column");
    [game move: move];
    
    STAssertEquals(-1, [game lowestEmptyRowForColumn: 1], @"Lowest column");
}

@end
