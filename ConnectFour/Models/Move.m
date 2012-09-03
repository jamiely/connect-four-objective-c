//
//  Move.m
//  ConnectFour
//
//  Created by Jamie Ly on 03/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "Move.h"

@implementation Move

- (Move*) initWithColumn: (NSUInteger) col {
    self = [self init];
    self.column = col;
    return self;
}

+ (Move*) moveWithColumn: (NSUInteger) col {
    return [[Move alloc] initWithColumn: col];
}

@end
