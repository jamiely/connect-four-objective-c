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

- (void) moveWithMarker: (Marker*) marker atIndex: (JLIndex*) index {
    NSUInteger i = [self indexToInt:index];
    [contents replaceObjectAtIndex: i withObject: marker];
}

- (BOOL) positionAt: (JLIndex*) index hasMarker: (Marker*) marker {
    return [contents objectAtIndex: [self indexToInt:index]] == marker;
}

- (NSUInteger) indexToInt: (JLIndex*) index {
    return index.row * size.width + index.column;
}

@end
