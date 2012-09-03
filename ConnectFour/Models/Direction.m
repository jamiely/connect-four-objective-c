//
//  Direction.m
//  ConnectFour
//
//  Created by Jamie Ly on 03/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "Direction.h"

@implementation Direction

@synthesize vertical;
@synthesize horizontal;

- (Direction *) initWithVertical: (NSInteger) v andHorizontal: (NSInteger) h {
    self = [self init];
    self.vertical = v;
    self.horizontal = h;
    return self;
}

+ (Direction *) directionWithVertical: (NSInteger) v andHorizontal: (NSInteger) h {
    return [[Direction alloc] initWithVertical: v andHorizontal: h];
}

+ (Direction *) North {
    static Direction *d = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        d = [self directionWithVertical: 1 andHorizontal: 0];
    });
    return d;
}

+ (Direction *) East {
    static Direction *d = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        d = [self directionWithVertical: 0 andHorizontal: 1];
    });
    return d;
}
+ (Direction *) South {
    static Direction *d = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        d = [self directionWithVertical: -1 andHorizontal: 0];
    });
    return d;
}
+ (Direction *) West {
    static Direction *d = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        d = [self directionWithVertical: 0 andHorizontal: -1];
    });
    return d;
}

+ (Direction *) NorthEast {
    static Direction *d = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        d = [self directionWithVertical: 1 andHorizontal: 1];
    });
    return d;
}
+ (Direction *) SouthEast {
    static Direction *d = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        d = [self directionWithVertical: -1 andHorizontal: 1];
    });
    return d;
}

+ (Direction *) NorthWest {
    static Direction *d = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        d = [self directionWithVertical: 1 andHorizontal: -1];
    });
    return d;
}
+ (Direction *) SouthWest {
    static Direction *d = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        d = [self directionWithVertical: -1 andHorizontal: -1];
    });
    return d;
}

@end
