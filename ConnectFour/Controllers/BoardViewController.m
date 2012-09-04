//
//  BoardViewController.m
//  ConnectFour
//
//  Created by Jamie Ly on 03/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "BoardViewController.h"
#import "JLSize.h"
#import "Move.h"
#import "Game.h"
#import "Board.h"
#import "JLIndex.h"
#import "BoardView.h"

@interface BoardViewController ()
- (void) setupGame;
@end

@implementation BoardViewController

@synthesize game;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // do nothing
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupGame];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) setupGame {
    boardView = [[BoardView alloc] initWithFrame: self.view.frame andBoard: game.board];
    [self.view addSubview: boardView];
    boardView.delegate = self;
}

- (void) boardView:(BoardView *)_boardView didSelectColumn:(NSUInteger)column {
    Move *move = [Move moveWithColumn: column];
    if([game move: move]) {
        [boardView updateIndex: game.lastIndex];
    }
    else {
        [[[UIAlertView alloc] initWithTitle:@"Alert"
                                    message: @"That column is full."
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil]
                          show];
    }
}

@end
