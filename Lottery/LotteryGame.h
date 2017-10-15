//
//  LotteryGame.h
//  Lottery
//
//  Created by admin on 10/15/17.
//  Copyright © 2017 AlfaSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LotteryGame : NSObject

@property (getter=getGameName,setter=setName:) NSString* Name;
@property (getter=getAmountDigits,setter=setAmountDigits:) int AmountDigits;
@property (getter=getGameType, setter=setGameType:) int GameType;
@property (getter=getMinRange, setter=setMinRange:)int MinRange;
@property (getter=getMaxRange, setter=setMaxRange:)int MaxRange;

@property (getter=getHasMagicNumber, setter=setHasMagicNumber:) BOOL HasMagicNumber;
@property (getter=getMagicNumberMaxRange, setter=setMagicNumberMaxRange:)int MaxMagicNumberRange;

-(id) InitwithName:(NSString*) name withAmountDigits:(int) amount withGameType:(int) gameType withMinRage:(int) minRange withMaxRage:(int) maxRange;

-(id) InitwithName:(NSString*) name withAmountDigits:(int) amount withGameType:(int) gameType withMinRage:(int) minRange withMaxRage:(int)maxRange
withHasMagicNumber:(BOOL) hasMagicNumber withMagicNumberMax:(int) maxMagicNumber;

@end
