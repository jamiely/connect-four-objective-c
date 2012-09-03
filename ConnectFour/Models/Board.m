//
//  Board.m
//  ConnectFour
//
//  Created by Jamie Ly on 02/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "Board.h"
#import "JLSize.h"
#import "JLIndex.h"
#import "Marker.h"
#import "NSString+Repeat.h"

@interface Board ()

- (NSUInteger) indexToInt: (JLIndex*) index;

@end

@implementation Board

@synthesize size;

- (Board*) init {
    self = [super init];
    
    size = [[JLSize alloc] init];
    size.width = 7;
    size.height = 6;
    
    contents = [NSMutableArray arrayWithArray:
        [@"" repeat: size.width * size.height]];
    
    return self;
}

- (NSArray *) contentsAsArray {
    return [NSArray arrayWithArray: contents];
}

- (BOOL) isEmpty {
    BOOL empty = YES;
    for(int i=0, c=contents.count; i < c; i ++)
        empty = empty && [contents objectAtIndex:i] == @"";
    return empty;
}

- (BOOL) moveWithMarker: (Marker*) marker atIndex: (JLIndex*) index {
    NSUInteger i = [self indexToInt:index];
    
    // Must be within bounds
    if(i >= contents.count) return NO;
    
    // Must be an empty position
    if([contents objectAtIndex: i] != @"") return NO;
    
    [contents replaceObjectAtIndex: i withObject: marker];
    return YES;
}

- (BOOL) positionAt: (JLIndex*) index hasMarker: (Marker*) marker {
    return [contents objectAtIndex: [self indexToInt:index]] == marker;
}

- (NSUInteger) indexToInt: (JLIndex*) index {
    return index.row * size.width + index.column;
}

- (BOOL) isInBounds: (JLIndex*) index {
    return index.row < size.height && index.column < size.width;
}

- (Marker*) updatePosition: (NSUInteger) position withMarker: (Marker*) marker {
    if(position >= contents.count) return nil;
    
    [contents replaceObjectAtIndex: position withObject: marker];
    return marker;
}

- (Marker*) markerAtIndex: (JLIndex*) index {
    if(! [self isInBounds: index]) return nil;
    
    return [contents objectAtIndex: [self indexToInt: index]];
}

- (BOOL) hasAvailableMoves {
    BOOL __block hasMoves = false;
    [contents enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        hasMoves = hasMoves || obj == @"";
        if(hasMoves) {
            (*stop) = YES;
            NSLog(@"Stopped checking available moves at position %d",  idx);
        }
    }];
    return hasMoves;
}

- (NSArray*) indices {
    static NSArray *_indices = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSMutableArray *a = [NSMutableArray array];
        for(uint r = 0; r < size.height; r++) {
            for(uint c = 0; c < size.width; c++) {
                [a addObject: [JLIndex indexWithRow: r andColumn: c]];
            }
        }
        _indices = [NSArray arrayWithArray: a];
    });
    return _indices;
}

@end
