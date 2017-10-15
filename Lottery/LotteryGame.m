//
//  LotteryGame.m
//  Lottery
//
//  Created by admin on 10/15/17.
//  Copyright © 2017 AlfaSoft. All rights reserved.
//

#import "LotteryGame.h"

@implementation LotteryGame

-(id) InitwithName:(NSString *)name withAmountDigits:(int)amount withGameType:(int)gameType withMinRage:(int) minRange withMaxRage:(int) maxRange
{
    self.Name = name;
    self.AmountDigits = amount;
    self.GameType = gameType;
    self.MinRange = minRange;
    self.MaxRange = maxRange;
    
    return self;
}


-(id) InitwithName:(NSString*) name withAmountDigits:(int) amount withGameType:(int) gameType withMinRage:(int) minRange withMaxRage:(int)maxRange
withHasMagicNumber:(BOOL) hasMagicNumber withMagicNumberMax:(int) maxMagicNumber{
    
    self.Name = name;
    self.AmountDigits = amount;
    self.GameType = gameType;
    self.MinRange = minRange;
    self.MaxRange = maxRange;
    
    self.HasMagicNumber= hasMagicNumber;
    self.MaxMagicNumberRange = maxMagicNumber;
    
    return self;
}

@end
