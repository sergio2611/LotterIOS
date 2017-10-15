//
//  GameHelper.h
//  Lottery
//
//  Created by admin on 10/15/17.
//  Copyright © 2017 AlfaSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LotteryGame.h"

@interface GameHelper : NSObject{
    NSMutableArray *Gamelist;
}


-(id) initGames;
-(NSArray*)getGamesNamesByType:(int) gameType;
-(NSArray*)getGameFrequencyByType:(int) gameType;
-(NSMutableArray*) generateNumber:(NSString*) selectedGame;
-(LotteryGame*) getLotteryGameByName:(NSString*) selectedGame;

@end
