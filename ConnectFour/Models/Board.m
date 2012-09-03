//
//  Board.m
//  ConnectFour
//
//  Created by Jamie Ly on 02/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "Board.h"
#import "Size.h"

@implementation Board

@synthesize size;

- (Board*) init {
    self = [super init];
    
    size = [[JLSize alloc] init];
    size.width = 7;
    size.height = 6;
    
    return self;
}

@end
