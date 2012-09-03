//
//  Game.h
//  ConnectFour
//
//  Created by Jamie Ly on 03/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Board;

@interface Game : NSObject {
    Board *board;
    NSArray *directions;
}

@property (nonatomic, strong) Board *board;
@property (nonatomic, strong) NSArray *directions;

@end
