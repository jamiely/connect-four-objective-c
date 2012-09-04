//
//  BoardView.m
//  ConnectFour
//
//  Created by Jamie Ly on 03/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "BoardView.h"
#import "Board.h"
#import "JLSize.h"
#import "JLIndex.h"
#import "IndexView.h"

@interface BoardView()
- (void) setupBoard;
- (void) setupImages;
- (void) handleTap:(UITapGestureRecognizer *)recognizer;
@end

@implementation BoardView

@synthesize board;
@synthesize delegate;

- (id) initWithFrame: (CGRect) frame andBoard: (Board*) _board {
    self = [self initWithFrame:frame];
    if(self) {
        board = _board;
        [self setupImages];
        [self setupBoard];
    }
    return self;
}

- (void) setupImages {
    imageEmpty = [[UIImage alloc] initWithContentsOfFile:
        [[NSBundle mainBundle] pathForResource:@"empty" ofType:@"png"]];
    imageA = [[UIImage alloc] initWithContentsOfFile:
        [[NSBundle mainBundle] pathForResource:@"a" ofType:@"png"]];
    imageB = [[UIImage alloc] initWithContentsOfFile:
        [[NSBundle mainBundle] pathForResource:@"b" ofType:@"png"]];
}

- (void) setupBoard {
    CGRect viewBounds = self.bounds;
    CGFloat viewWidth = viewBounds.size.width,
            viewHeight = viewBounds.size.height;

    positionViewContainer = [[UIView alloc] initWithFrame: viewBounds];

    int boardRows = board.size.height,
        boardCols = board.size.width;
        
    CGFloat posViewWidth = viewWidth / boardCols,
            posViewHeight = viewHeight / boardRows;

    NSMutableArray *tmp = [NSMutableArray arrayWithCapacity: boardRows*boardCols];
    for(int r=0; r<boardRows; r++) {
        for(int c=0; c<boardCols; c++) {
            UIImageView *iv = [[IndexView alloc]
                initWithImage: imageEmpty
                     andBoard: self.board
                     andIndex: [JLIndex indexWithRow: r andColumn: c]];
            UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]
                initWithTarget: self action:@selector(handleTap:)];
            [iv addGestureRecognizer: gesture];
            
            CGRect vFrame = CGRectMake(c * posViewWidth, r * posViewHeight,
                posViewWidth, posViewHeight);
            iv.frame = vFrame;
            [positionViewContainer addSubview: iv];
            [tmp addObject: iv];
        }
    }
    
    [self addSubview: positionViewContainer];
    positionViews = [NSArray arrayWithArray: tmp];
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer {
    IndexView *indexView = (IndexView*) recognizer.view;
    if(delegate) {
        [delegate boardView: self didSelectColumn: indexView.index.column];
    }
}
@end
