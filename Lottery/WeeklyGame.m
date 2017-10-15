//
//  WeeklyGame.m
//  Lottery
//
//  Created by admin on 10/15/17.
//  Copyright © 2017 AlfaSoft. All rights reserved.
//

#import "WeeklyGame.h"
#import "GameHelper.h"

@interface WeeklyGame ()
@property (weak, nonatomic) IBOutlet UIPickerView *pickerWeekly;
@property (strong,nonatomic) NSArray *gameNames;
@property (strong,nonatomic) NSArray *gameFrequency;
@property (strong, nonatomic) GameHelper *gh;

@property (weak, nonatomic) IBOutlet UILabel *lblYourNumbers;

@property (weak, nonatomic) IBOutlet UILabel *lblResult;
@property (strong, nonatomic) NSMutableArray* arr;


@end

@implementation WeeklyGame

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.gh = [[GameHelper alloc] initGames];
    
    self.gameNames = [self.gh getGamesNamesByType:1];
    self.gameFrequency = [self.gh getGameFrequencyByType:1];
    
    self.pickerWeekly.delegate= self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component == 0)
        return [self.gameNames count];
    else
        return [self.gameFrequency count];
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component == 0)
        return self.gameNames[row];
    else
        return self.gameFrequency[row];
}

- (IBAction)btnPress:(id)sender {
    NSInteger row = [self.pickerWeekly selectedRowInComponent:0];
    
    
    NSString *selectedGame = [self.gameNames objectAtIndex:row ];
    
    self.arr = [self.gh generateNumber:selectedGame];
    
    NSMutableString* text = [[NSMutableString alloc] init];
    
    for(int i = 0 ; i < self.arr.count ; i ++){
        [text appendString:self.arr[i]];
        if(i != self.arr.count - 1)
            [text appendString:@"-"];
    }
    
    self.lblYourNumbers.text = text;

}

@end
