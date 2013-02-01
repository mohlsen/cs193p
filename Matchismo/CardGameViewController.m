//
//  CardGameViewController.m
//  Matchismo
//
//  Created by The Ohlsens on 1/30/13.
//  Copyright (c) 2013 mohlsen.com. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation CardGameViewController

//need to init the deck
- (PlayingCardDeck *)deck
{
    if (!_deck) _deck = [[PlayingCardDeck alloc] init];
    return _deck;
}

- (void) setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"Flips updated to %d", self.flipCount);
}

- (IBAction)flipCard:(UIButton *)sender {
    
    sender.selected = !sender.isSelected;
    
    //only update the flipcount and draw a card when fliped to face side of card (selected)
    if (sender.isSelected) {
        
        self.flipCount++;
        
        //draw a card (need to cast since drawRandomCard return a Card*
        PlayingCard *drawnCard = (PlayingCard*)[self.deck drawRandomCard];
        
        //if we used all 52, then drawnCard will be nil
        if (drawnCard) {
            //now build the text for the card, drawnCard.rank is an int, so look up the rankStrings using the rank (int)
            NSString* cardTitle = [NSString stringWithFormat:@"%@%@", [PlayingCard rankStrings][drawnCard.rank], drawnCard.suit];

            //finally set the titlemtext for the selected state
            [sender setTitle:cardTitle
                    forState:UIControlStateSelected];
        } else {
            //all used up!
            [sender setTitle:@"🚫"
                    forState:UIControlStateSelected];
        }
        
    }

    
    
    
}


@end
