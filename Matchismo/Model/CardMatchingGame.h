//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by The Ohlsens on 2/1/13.
//  Copyright (c) 2013 mohlsen.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (id) initWithCardCount:(NSInteger)cardCount
               usingDeck:(Deck *)deck;

- (void) flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int totalScore;
@property (nonatomic, readonly) int lastScore;

@end

