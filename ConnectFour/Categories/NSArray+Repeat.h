//
//  NSArray+Repeat.h
//  ConnectFour
//
//  Created by Jamie Ly on 03/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Repeat)

+ (NSArray*) arrayOf: (id) obj repeated: (NSUInteger) times;

@end
