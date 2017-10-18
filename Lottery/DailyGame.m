//
//  ViewController.m
//  Lottery
//
//  Created by admin on 10/15/17.
//  Copyright © 2017 AlfaSoft. All rights reserved.
//

#import "DailyGame.h"
#import "GameHelper.h"

@interface DailyGame ()
@property (weak, nonatomic) IBOutlet UIPickerView *pickerDaily;
@property (weak, nonatomic) IBOutlet UIButton *btnQP;

@property (strong,nonatomic) NSArray *gameNames;
@property (strong,nonatomic) NSArray *gameFrequency;
@property (strong, nonatomic) GameHelper *gh;

@property (weak, nonatomic) IBOutlet UILabel *lblResult;
@property (strong, nonatomic) NSMutableArray* arr;

@property (weak, nonatomic) IBOutlet UIButton *btnPlay;

//buttons to show the numbers picked
@property (weak, nonatomic) IBOutlet UIButton *btnNumber1;
@property (weak, nonatomic) IBOutlet UIButton *btnNumber2;
@property (weak, nonatomic) IBOutlet UIButton *btnNumber3;
@property (weak, nonatomic) IBOutlet UIButton *btnNumber4;
@property (weak, nonatomic) IBOutlet UIButton *btnNumber5;


//buttons for the result
@property (weak, nonatomic) IBOutlet UIButton *btnResult1;
@property (weak, nonatomic) IBOutlet UIButton *btnResult2;
@property (weak, nonatomic) IBOutlet UIButton *btnResult3;
@property (weak, nonatomic) IBOutlet UIButton *btnResult4;
@property (weak, nonatomic) IBOutlet UIButton *btnResult5;

@property (weak, nonatomic) IBOutlet UIButton *btnResult11;
@property (weak, nonatomic) IBOutlet UIButton *btnResult22;
@property (weak, nonatomic) IBOutlet UIButton *btnResult33;
@property (weak, nonatomic) IBOutlet UIButton *btnResult44;
@property (weak, nonatomic) IBOutlet UIButton *btnResult55;


//
@end

@implementation DailyGame

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.gh = [[GameHelper alloc] initGames];
    
    self.gameNames = [self.gh getGamesNamesByType:0];
    self.gameFrequency = [self.gh getGameFrequencyByType:0];
    
    self.pickerDaily.delegate= self;

    //hide all buttons
    
    [self HideButtons];
    self.lblResult.hidden = true;
    [self.lblResult setTextAlignment:NSTextAlignmentCenter];
    //
}

#pragma Picker methods
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

///change the selection of the game
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self HideButtons];
    [self HideResultButtons];
     self.btnPlay.hidden = YES;
    self.lblResult.hidden = YES;
}

///btnquick Pick button
- (IBAction)btnPressed:(id)sender {
    NSInteger row = [self.pickerDaily selectedRowInComponent:0];
    NSString *selectedGame = [self.gameNames objectAtIndex:row ];
    self.arr = [self.gh generateNumber:selectedGame];
    self.lblResult.hidden = true;
    for(int i = 0 ; i < self.arr.count ; i ++){
        switch (i) {
            case 0:
                [self.btnNumber1 setTitle:self.arr[i] forState:UIControlStateNormal];
                self.btnNumber1.hidden = false;
                break;
            case 1:
                [self.btnNumber2 setTitle:self.arr[i] forState:UIControlStateNormal];
                self.btnNumber2.hidden = false;
                break;
            case 2:
                [self.btnNumber3 setTitle:self.arr[i] forState:UIControlStateNormal];
                self.btnNumber3.hidden = false;
                break;
            case 3:
                [self.btnNumber4 setTitle:self.arr[i] forState:UIControlStateNormal];
                self.btnNumber4.hidden = false;
                break;
            case 4:
                [self.btnNumber5 setTitle:self.arr[i] forState:UIControlStateNormal];
                self.btnNumber5.hidden = false;
                break;

            default:
                break;
        }
    }
    
    self.btnPlay.hidden = false;
    [self HideResultButtons];
    
    
    
}

- (IBAction)btnWinningNumbers:(id)sender {
    [self HideResultButtons];
    
    NSInteger row = [self.pickerDaily selectedRowInComponent:0];
    //get if they select play with both
    NSInteger row2 = [self.pickerDaily selectedRowInComponent:1];
    
    NSString *selectedGame = [self.gameNames objectAtIndex:row ];
    
    UIColor *Color = [UIColor redColor];
    NSMutableArray* arrResult = [[NSMutableArray alloc] init];
    NSMutableArray* arrResult2 = [[NSMutableArray alloc] init];
    arrResult = [self.gh generateNumber:selectedGame];
    arrResult2 = [self.gh generateNumber:selectedGame];
    Boolean guessed = false;
    int count = 0;
    int count2 = 0;
    Boolean guessed2 = false;
    for(int i = 0; i < arrResult.count ; i ++)
    {
        NSString* a = arrResult[i];
        guessed = [self searchInArray:[a integerValue] :self.arr];
        
        switch (i) {
            case 0:
                [self.btnResult1 setTitle:arrResult[i] forState:UIControlStateNormal];
                self.btnResult1.hidden = false;
                if(guessed){
                    self.btnResult1.backgroundColor = Color ;
                    count++;
                }
                if(row2 ==2) //play with both
                {
                    guessed2 = [self searchInArray:[arrResult2[i] integerValue] :self.arr];
                    [self.btnResult11 setTitle:arrResult2[i] forState:UIControlStateNormal];
                    self.btnResult11.hidden = false;
                    if(guessed2){
                        self.btnResult11.backgroundColor = Color ;
                        count2++;
                    }
                }
                break;
            case 1:
                [self.btnResult2 setTitle:arrResult[i] forState:UIControlStateNormal];
                self.btnResult2.hidden = false;
                if(guessed){
                    self.btnResult2.backgroundColor = Color ;
                    count++;
                }
                if(row2 ==2) //play with both
                {
                    guessed2 = [self searchInArray:[arrResult2[i] integerValue] :self.arr];
                    [self.btnResult22 setTitle:arrResult2[i] forState:UIControlStateNormal];
                    self.btnResult22.hidden = false;
                    if(guessed2){
                        self.btnResult22.backgroundColor = Color ;
                        count2++;
                    }
                }
                break;
            case 2:
                [self.btnResult3 setTitle:arrResult[i] forState:UIControlStateNormal];
                self.btnResult3.hidden = false;
                if(guessed){
                    self.btnResult3.backgroundColor = Color ;
                    count++;
                }
                if(row2 ==2) //play with both
                {
                    guessed2 = [self searchInArray:[arrResult2[i] integerValue] :self.arr];
                    [self.btnResult33 setTitle:arrResult2[i] forState:UIControlStateNormal];
                    self.btnResult33.hidden = false;
                    if(guessed2){
                        self.btnResult33.backgroundColor = Color ;
                        count2++;
                    }
                }
                break;
            case 3:
                [self.btnResult4 setTitle:arrResult[i] forState:UIControlStateNormal];
                self.btnResult4.hidden = false;
                if(guessed){
                    self.btnResult4.backgroundColor = Color;
                    count++;
                }
                if(row2 ==2) //play with both
                {
                    guessed2 = [self searchInArray:[arrResult2[i] integerValue] :self.arr];
                    [self.btnResult44 setTitle:arrResult2[i] forState:UIControlStateNormal];
                    self.btnResult44.hidden = false;
                    if(guessed2){
                        self.btnResult44.backgroundColor = Color ;
                        count2++;
                    }
                }
                break;
            case 4:
                [self.btnResult5 setTitle:arrResult[i] forState:UIControlStateNormal];
                self.btnResult5.hidden = false;
                if(guessed){
                    self.btnResult5.backgroundColor = Color ;
                    count++;
                }
                if(row2 ==2) //play with both
                {
                    guessed2 = [self searchInArray:[arrResult2[i] integerValue] :self.arr];
                    [self.btnResult55 setTitle:arrResult2[i] forState:UIControlStateNormal];
                    self.btnResult55.hidden = false;
                    if(guessed2){
                        self.btnResult55.backgroundColor = Color ;
                        count2++;
                    }
                }
                break;
                
            default:
                break;
        }
        
        self.lblResult.hidden = false;
    }
    
    NSMutableString* message = [[NSMutableString alloc]init];
    [message appendString:@"You have guessed "];
    [message appendString:[NSString stringWithFormat:@"%i",count] ];
    [message appendString:@" numbers"] ;
    
    if(row2 == 2)
    {
         [message appendString:@" \n in FIRST GAME"] ;
        [message appendString:@" and "] ;
        [message appendString:[NSString stringWithFormat:@"%i",count2] ];
        [message appendString:@" in SECOND GAME "] ;
    }
    if(count == arrResult.count || count2 == arrResult.count)
    {
        [message appendString:@" \n \n"] ;
        [message appendString:@" !!!YOU ARE A WINNER!!!"] ;
    }
    _lblResult.text = message;
}


-(void) HideButtons
{
    self.btnNumber1.hidden = YES;
    [self.btnNumber1 setTitle:@"" forState:UIControlStateNormal];
    self.btnNumber2.hidden = YES;
     [self.btnNumber2 setTitle:@"" forState:UIControlStateNormal];
    self.btnNumber3.hidden = YES;
     [self.btnNumber3 setTitle:@"" forState:UIControlStateNormal];
    self.btnNumber4.hidden = YES;
     [self.btnNumber4 setTitle:@"" forState:UIControlStateNormal];
    self.btnNumber5.hidden = YES;
     [self.btnNumber5 setTitle:@"" forState:UIControlStateNormal];
    
    
    
    self.btnPlay.hidden = YES;
    

    [self HideResultButtons];
}

-(void) HideResultButtons{
    self.btnResult1.hidden = YES;
    [self.btnResult1 setTitle:@"" forState:UIControlStateNormal];
    self.btnResult1.backgroundColor = [UIColor lightGrayColor] ;
    self.btnResult2.hidden = YES;
    [self.btnResult2 setTitle:@"" forState:UIControlStateNormal];
    self.btnResult2.backgroundColor = [UIColor lightGrayColor] ;
    self.btnResult3.hidden = YES;
    [self.btnResult3 setTitle:@"" forState:UIControlStateNormal];
    self.btnResult3.backgroundColor = [UIColor lightGrayColor] ;
    self.btnResult4.hidden = YES;
    [self.btnResult4 setTitle:@"" forState:UIControlStateNormal];
    self.btnResult4.backgroundColor = [UIColor lightGrayColor] ;
    self.btnResult5.hidden = YES;
    [self.btnResult5 setTitle:@"" forState:UIControlStateNormal];
    self.btnResult5.backgroundColor = [UIColor lightGrayColor] ;
    
    //other result if they play other game
    self.btnResult11.hidden = YES;
    [self.btnResult11 setTitle:@"" forState:UIControlStateNormal];
    self.btnResult11.backgroundColor = [UIColor lightGrayColor] ;
    self.btnResult22.hidden = YES;
    [self.btnResult22 setTitle:@"" forState:UIControlStateNormal];
    self.btnResult22.backgroundColor = [UIColor lightGrayColor] ;
    self.btnResult33.hidden = YES;
    [self.btnResult33 setTitle:@"" forState:UIControlStateNormal];
    self.btnResult33.backgroundColor = [UIColor lightGrayColor] ;
    self.btnResult44.hidden = YES;
    [self.btnResult44 setTitle:@"" forState:UIControlStateNormal];
    self.btnResult44.backgroundColor = [UIColor lightGrayColor] ;
    self.btnResult55.hidden = YES;
    [self.btnResult55 setTitle:@"" forState:UIControlStateNormal];
    self.btnResult55.backgroundColor = [UIColor lightGrayColor] ;
    
    
}

-(Boolean) searchInArray:(NSInteger)value :(NSMutableArray*) arr
{
    if([arr containsObject:[NSString stringWithFormat:@"%li",value]])
       return true;
    else
        return false;
    
}



@end
