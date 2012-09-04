//
//  IndexView.m
//  ConnectFour
//
//  Created by Jamie Ly on 03/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "IndexView.h"
#import "JLIndex.h"

@implementation IndexView

@synthesize board;
@synthesize index;

- (id) initWithImage:(UIImage *)image andBoard: (Board*) _board
                                      andIndex: (JLIndex*) _index {
    self = [self initWithImage: image];
    if(self) {
        board = _board;
        index = _index;
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (NSString*) accessibilityLabel {
    return [NSString stringWithFormat:@"Index (%@) Image (%@)",
        index, [super accessibilityLabel]];
}

@end
