//
//  Marker.h
//  ConnectFour
//
//  Created by Jamie Ly on 03/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Marker : NSObject

@property (nonatomic, strong) NSString *text;

+ (Marker*) A;
+ (Marker*) B;
+ (Marker*) Empty;

@end
