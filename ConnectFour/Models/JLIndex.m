//
//  JLIndex.m
//  ConnectFour
//
//  Created by Jamie Ly on 03/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "JLIndex.h"

@implementation JLIndex

@synthesize row;
@synthesize column;

- (JLIndex*) initWithRow: (NSUInteger) _row andColumn: (NSUInteger) _column {
    self = [self init];
    
    self.row = _row;
    self.column = _column;
    
    return self;
}

- (NSString*) description {
    return [NSString stringWithFormat: @"<Row: %d Column: %d>", self.row, self.column];
}

+ (JLIndex*) indexWithRow: (NSUInteger) _row andColumn: (NSUInteger) _column {
    return [[self alloc] initWithRow: _row andColumn: _column];
}

@end
