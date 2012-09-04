//
//  IndexView.h
//  ConnectFour
//
//  Created by Jamie Ly on 03/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JLIndex;
@class Board;

@interface IndexView : UIImageView {
    JLIndex *index;
    Board *board;
}

@property (nonatomic, strong) JLIndex *index;
@property (nonatomic, strong) Board *board;

- (id) initWithImage:(UIImage *)image andBoard: (Board*) _board
                                      andIndex: (JLIndex*) _index;

@end
