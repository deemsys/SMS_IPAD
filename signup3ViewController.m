//
//  signup3ViewController.m
//  SMSIPAD
//
//  Created by DeemSysInc on 12/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import "signup3ViewController.h"
#import "BlockAlertView.h"

@interface signup3ViewController ()

@end

@implementation signup3ViewController
@synthesize timepick1;
@synthesize timepicker1;
@synthesize timepick2;
@synthesize timepick3;
@synthesize timepicker2;
@synthesize timepicker3;
@synthesize timearray;
@synthesize reslabel;
@synthesize switch1;
@synthesize recorddict;

#pragma mark - UIPickerView DataSource


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(IBAction)toggleEnabledTextForSwitch1onSomeLabel:(id)sender
{
    if (switch1.on)
    {
        reslabel.text=@"Start";
    }
    else
    {
        reslabel.text=@"Stop";
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    timepick1.hidden=YES;
    timepick2.hidden=YES;
    timepick3.hidden=YES;
    timepicker1.text=@"0-1";
    timepicker2.text=@"0-1";
    timepicker3.text=@"0-1";
    timearray=[[NSMutableArray alloc] initWithObjects:@"0-1", @"1-2", @"2-3", @"3-4", @"4-5",@"5-6",@"6-7",@"7-8",@"8-9",@"9-10",@"10-11",@"11-12",@"12-13",@"13-14",@"14-15",@"15-16",@"16-17",@"18-19",@"19-20",@"20-21",@"21-22",@"22-23",@"23-0", nil];
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pickerViewTapped)];
    [timepick1 addGestureRecognizer:tapGR];
    UITapGestureRecognizer *tapGR1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pickerViewTapped1)];
    [timepick2 addGestureRecognizer:tapGR1];
    UITapGestureRecognizer *tapGR2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pickerViewTapped2)];
    [timepick3 addGestureRecognizer:tapGR2];

    
	// Do any additional setup after loading the view.
}
- (void)pickerViewTapped
{
    timepick1.hidden=YES;
}
- (void)pickerViewTapped1
{
    timepick2.hidden=YES;
}
- (void)pickerViewTapped2

{
    timepick3.hidden=YES;
}
#pragma mark - UIPickerView DataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(pickerView.tag==1)
        
        return [timearray count];
    
    else if(pickerView.tag==2)
        
        return [timearray count];
    
    else if (pickerView.tag==3)
        
        return [timearray count];
    else
        return 1;
    
}


#pragma mark - UIPickerView Delegate
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 30.0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(pickerView.tag==1)
        
        return [timearray objectAtIndex:row];
    
    else if(pickerView.tag==2)
        
        return [timearray  objectAtIndex:row];
    
    else
        return [timearray objectAtIndex:row];
    
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(timepick1.hidden==NO)
    {
        timepick1.hidden=YES;
    }
    if (timepick2.hidden==NO) {
        timepick2.hidden=YES;
    }
    if (timepick3.hidden==NO) {
       timepick3.hidden=YES;
    }
}

//If the user chooses from the pickerview, it calls this function;
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(pickerView.tag==1)
        
        timepicker1.text=[timearray objectAtIndex:row];
    
    else if(pickerView.tag==2)
        
       timepicker2.text=[timearray  objectAtIndex:row];
    
    else
        timepicker3.text= [timearray objectAtIndex:row];
    //Let's print in the console what the user had chosen;
    // NSLog(@"Chosen item: %@", [itemsArray objectAtIndex:row]);
}

 -(IBAction)changeTimeInLabel1:(id)sender
{
    if (timepick1.hidden==YES)
    {
        timepick1.hidden=NO;
        
    }
}
-(IBAction)changeTimeInLabel2:(id)sender
{
    if (timepick2.hidden==YES)
    {
        timepick2.hidden=NO;
        
    }
}
-(IBAction)changeTimeInLabel3:(id)sender
{
    if (timepick3.hidden==YES)
    {
        timepick3.hidden=NO;
        
    }
}
-(IBAction)submit:(id)sender
{
    [recorddict setValue:timepicker1.text forKey:@"Preferred Time1"];
    [recorddict setValue:timepicker2.text forKey:@"Preferred Time2"];
    [recorddict setValue:timepicker3.text forKey:@"Preferred Time3"];
    [recorddict setValue:reslabel.text forKey:@"startchat"];
    NSLog(@"complete list %@",recorddict);
    BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Congrats" message:@"Registration Successful!!"];
    
   [alert setDestructiveButtonWithTitle:@"x" block:nil];
    [alert show];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
