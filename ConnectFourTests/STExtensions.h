//
//  STExtensions.h
//  ConnectFour
//
//  Created by Jamie Ly on 03/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#ifndef ConnectFour_STExtensions_h
#define ConnectFour_STExtensions_h

#define STAssertArraysEqual(a, b, msg) \
    STAssertEquals(a.count, b.count, @"Array lengths are equal"); \
    for(uint i=0, count = a.count; i < count; i++) { \
        STAssertEqualObjects([a objectAtIndex: i], [b objectAtIndex: i], \
            [NSString stringWithFormat: @"Index %d of arrays are equal", i]); \
    }
#endif
