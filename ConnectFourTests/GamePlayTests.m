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

@end
