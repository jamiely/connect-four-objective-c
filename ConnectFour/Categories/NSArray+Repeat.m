//
//  NSArray+Repeat.m
//  ConnectFour
//
//  Created by Jamie Ly on 03/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "NSArray+Repeat.h"

@implementation NSArray (Repeat)

+ (NSArray*) arrayOf: (id) obj repeated: (NSUInteger) times {
    NSMutableArray *tmp = [NSMutableArray arrayWithCapacity: times];
    for(int i = 0; i < times; i++) {
        [tmp addObject: obj];
    }
    return [NSArray arrayWithArray: tmp];
}

@end
