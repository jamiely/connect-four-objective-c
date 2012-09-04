//
//  BoardView.h
//  ConnectFour
//
//  Created by Jamie Ly on 03/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Board;
@protocol BoardViewDelegate;

@interface BoardView : UIView {
    Board *board;
    UIView *positionViewContainer;
    NSArray *positionViews;
    
    // images
    UIImage *imageEmpty;
    UIImage *imageA;
    UIImage *imageB;
    
    id<BoardViewDelegate> delegate;
}

@property (nonatomic, strong) Board *board;
@property (nonatomic, strong) id<BoardViewDelegate> delegate;

- (id) initWithFrame: (CGRect) frame andBoard: (Board*) _board;

@end

@protocol BoardViewDelegate <NSObject>
- (void) boardView: (BoardView*) _boardView didSelectColumn: (NSUInteger) column;
@end
