//
//  BoardViewController.h
//  ConnectFour
//
//  Created by Jamie Ly on 03/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BoardView.h"

@class Game;
@class BoardView;

@interface BoardViewController : UIViewController <BoardViewDelegate> {
    Game *game;
    BoardView *boardView;
}

@property (nonatomic, strong) Game *game;

@end
