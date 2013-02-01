//
//  Card.h
//  Matchismo
//
//  Created by The Ohlsens on 1/30/13.
//  Copyright (c) 2013 mohlsen.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter = isFaceUp) BOOL faceUP;
@property (nonatomic, getter = isUnplayable) BOOL unplayable;

-(int)match:(NSArray *) otherCards;

@end
