//
//  JLIndex.h
//  ConnectFour
//
//  Created by Jamie Ly on 03/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JLIndex : NSObject

@property (nonatomic, assign) NSUInteger row;
@property (nonatomic, assign) NSUInteger column;

- (JLIndex*) initWithRow: (NSUInteger) _row andColumn: (NSUInteger) _column;

@end
