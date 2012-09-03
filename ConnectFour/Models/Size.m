//
//  Size.m
//  ConnectFour
//
//  Created by Jamie Ly on 02/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "Size.h"

@implementation JLSize

@synthesize height;
@synthesize width;

- (JLSize*) init {
    self = [super init];
    
    self.height = 0;
    self.width = 0;
    
    return self;
}

@end
