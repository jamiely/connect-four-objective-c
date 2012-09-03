//
//  Move.h
//  ConnectFour
//
//  Created by Jamie Ly on 03/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Move : NSObject

@property (nonatomic, assign) NSUInteger column;

- (Move*) initWithColumn: (NSUInteger) col;
+ (Move*) moveWithColumn: (NSUInteger) col;

@end
