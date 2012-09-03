//
//  Board.h
//  ConnectFour
//
//  Created by Jamie Ly on 02/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JLSize;
@class Marker;
@class JLIndex;

@interface Board : NSObject {
    JLSize *size;
    NSMutableArray *contents;
}

@property (nonatomic, strong) JLSize *size;

- (NSArray *) contentsAsArray;
- (BOOL) isEmpty;
- (void) moveWithMarker: (Marker*) marker atIndex: (JLIndex*) index;
- (BOOL) positionAt: (JLIndex*) index hasMarker: (Marker*) marker;

@end
