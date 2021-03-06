//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by The Ohlsens on 2/1/13.
//  Copyright (c) 2013 mohlsen.com. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic, readwrite) int totalScore;
@property (nonatomic, readwrite) int lastScore;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

//designitated initializer
-(id) initWithCardCount:(NSInteger)cardCount
              usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i= 0; i < cardCount; i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            } else {
                self.cards[i] = card;
            }
        }
    }
    
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index <self.cards.count)? self.cards[index] : nil;
}

#define FLIP_COST 1
#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2

- (void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isUnplayable) {
        
        if (!card.isFaceUp) {
            
            self.lastScore = 0;
            
            //match made?
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.lastScore = matchScore * MATCH_BONUS;
                    } else {
                        otherCard.faceUP = NO;
                        self.lastScore = -MISMATCH_PENALTY;
                    }
                }
                
            }
                       
            self.totalScore += self.lastScore - FLIP_COST;
        }
        
        
        
        card.faceUP = !card.isFaceUp;
    }
}
@end

//TODO Page 73 in Lecture 3 slides