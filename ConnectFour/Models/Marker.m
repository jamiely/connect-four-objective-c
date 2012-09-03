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
        a.text = @"X";
    });
    return a;
}

+ (Marker*) B {
    static Marker *b = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        b = [[Marker alloc] init];
        b.text = @"O";
    });
    return b;
}

+ (Marker*) Empty {
    static Marker *b = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        b = [[Marker alloc] init];
        b.text = @" ";
    });
    return b;
}
@end
