//
//  CardGameViewController.m
//  Matchismo
//
//  Created by The Ohlsens on 1/30/13.
//  Copyright (c) 2013 mohlsen.com. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation CardGameViewController

- (void) setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"Flips updated to %d", self.flipCount);
}

- (IBAction)flipCard:(UIButton *)sender {
    
    sender.selected = !sender.isSelected;
    self.flipCount++;
    
    //Your homework is to make each flip draw a new card (instead of showing A♣ all the time).
    //Just add a deck property to your Controller
    //then draw a random card from it with each flip to fac up.
    
}


@end
