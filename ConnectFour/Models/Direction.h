//
//  Direction.h
//  ConnectFour
//
//  Created by Jamie Ly on 03/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Direction : NSObject

@property (nonatomic, assign) NSInteger vertical;
@property (nonatomic, assign) NSInteger horizontal;

- (Direction *) initWithVertical: (NSInteger) v andHorizontal: (NSInteger) h;

+ (Direction *) directionWithVertical: (NSInteger) v andHorizontal: (NSInteger) h;

+ (Direction *) North;
+ (Direction *) East;
+ (Direction *) South;
+ (Direction *) West;

+ (Direction *) NorthEast;
+ (Direction *) SouthEast;

+ (Direction *) NorthWest;
+ (Direction *) SouthWest;


@end
