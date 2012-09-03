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

@end
