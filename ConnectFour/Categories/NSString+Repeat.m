//
//  NSString+Repeat.m
//  ConnectFour
//
//  Created by Jamie Ly on 03/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "NSString+Repeat.h"

@implementation NSString (Repeat)
- (NSArray*) repeat: (NSUInteger) times {
    NSMutableArray *tmp = [NSMutableArray arrayWithCapacity:times];
    for (int i = 0; i < times; i++) {
        [tmp addObject: [self copy]];
    }
    return [NSArray arrayWithArray:tmp];
}
@end
