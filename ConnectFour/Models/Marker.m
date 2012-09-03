//
//  Marker.m
//  ConnectFour
//
//  Created by Jamie Ly on 03/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "Marker.h"

@implementation Marker

+ (Marker*) A {
    static Marker *a = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        a = [[Marker alloc] init];
    });
    return a;
}

+ (Marker*) B {
    static Marker *b = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        b = [[Marker alloc] init];
    });
    return b;
}
@end
