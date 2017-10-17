//
//  GameHelper.m
//  Lottery
//
//  Created by admin on 10/15/17.
//  Copyright © 2017 AlfaSoft. All rights reserved.
//

#import "GameHelper.h"
#import "LotteryGame.h"

@implementation GameHelper

-(id) initGames{
    
    Gamelist=[[NSMutableArray alloc]init];
    
    LotteryGame* pick2 =     [[LotteryGame alloc]InitwithName:@"Pick 2" withAmountDigits:2 withGameType:0 withMinRage:0 withMaxRage:9];
    LotteryGame* pick3 =     [[LotteryGame alloc]InitwithName:@"Pick 3" withAmountDigits:3 withGameType:0 withMinRage:0 withMaxRage:9];
    LotteryGame* pick4 =     [[LotteryGame alloc]InitwithName:@"Pick 4" withAmountDigits:4 withGameType:0 withMinRage:0 withMaxRage:9];
    LotteryGame* pick5 =     [[LotteryGame alloc]InitwithName:@"Pick 5" withAmountDigits:5 withGameType:0 withMinRage:0 withMaxRage:9];
    LotteryGame* fantasy5 = [[LotteryGame alloc]InitwithName:@"Fantasy 5" withAmountDigits:5 withGameType:0 withMinRage:1 withMaxRage:36];
    
    LotteryGame* luckyMoney = [[LotteryGame alloc]InitwithName:@"Lucky Money" withAmountDigits:4 withGameType:1 withMinRage:1 withMaxRage:47 withHasMagicNumber:YES withMagicNumberMax:17];
    LotteryGame* powerBall = [[LotteryGame alloc]InitwithName:@"PowerBall" withAmountDigits:5 withGameType:1 withMinRage:1 withMaxRage:69 withHasMagicNumber:YES withMagicNumberMax:26];
    LotteryGame* floridaLotto = [[LotteryGame alloc]InitwithName:@"Florida Lotto" withAmountDigits:5 withGameType:1 withMinRage:1 withMaxRage:53];
    
    
    [Gamelist addObject:pick2];
    [Gamelist addObject:pick3];
    [Gamelist addObject:pick4];
    [Gamelist addObject:pick5];
    [Gamelist addObject:fantasy5];
    
    [Gamelist addObject:luckyMoney];
    [Gamelist addObject:powerBall];
    [Gamelist addObject:floridaLotto];
    
    
    return self;
}

-(NSArray*)getGamesNamesByType:(int) gameType {
    NSMutableArray* arrList = [[NSMutableArray alloc] init];
    for(LotteryGame *game in Gamelist)
    {
        if(game.getGameType == gameType)
            [arrList addObject:game.getGameName];
    }
    return arrList;
}

-(NSArray*)getGameFrequencyByType:(int) gameType{
    NSArray* arr = [NSArray alloc];
    if (gameType == 0){
        arr = @[@"MID",@"EVE",@"BOTH"];
    }
    else
        arr = @[@"WED",@"SAT",@"BOTH"];
    
    return arr;
}

-(LotteryGame*) getLotteryGameByName:(NSString*) selectedGame{
    
    for (LotteryGame *g in Gamelist) {
        if (g.getGameName==selectedGame){
            return g;
        }
    }
    
    return nil;
}

-(NSMutableArray*) generateNumber:(NSString*) selectedGame{
    NSMutableArray* arr = [[NSMutableArray alloc]init];
    
    LotteryGame* g = [self getLotteryGameByName:selectedGame];
    int value;
    int i = 0;
    
    //while and check that is not repetitive
    while(i < g.AmountDigits)
    {
      value = rand()%g.getMaxRange + g.getMinRange;
      if( ![arr containsObject:[NSString stringWithFormat:@"%i",value]])
      {
          i++;
           [arr addObject: [NSString stringWithFormat:@"%i",value  ]];
      }
    }
    
    if( g.HasMagicNumber)
    {
        Boolean createMagic = true;
        while(createMagic)
        {
            value = rand()%g.getMagicNumberMaxRange + g.getMinRange;
            if( ![arr containsObject:[NSString stringWithFormat:@"%i",value]])
            {
                 [arr addObject: [NSString stringWithFormat:@"%i",value  ]];
                createMagic = false;
            }
        }
    }
    
    [arr sortUsingComparator:^NSComparisonResult(NSString* str1,NSString* str2)
     {
         return [str1 compare:str2 options:(NSNumericSearch)];
     }];
    
    return arr;
}

@end
