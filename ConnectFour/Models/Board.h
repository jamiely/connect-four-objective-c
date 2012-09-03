//
//  Board.h
//  ConnectFour
//
//  Created by Jamie Ly on 02/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JLSize;

@interface Board : NSObject {
    JLSize *size;
}

@property (nonatomic, strong) JLSize *size;

@end
