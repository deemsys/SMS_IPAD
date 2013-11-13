//
//  signup2ViewController.m
//  SMSIPAD
//
//  Created by DeemSysInc on 12/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import "signup2ViewController.h"
#import "signup3ViewController.h"

@interface signup2ViewController ()

@end

@implementation signup2ViewController
@synthesize recorddict;
@synthesize agepick;
@synthesize ageArray;
@synthesize agepicker;
@synthesize seggender;
@synthesize providerpick;
@synthesize providerpicker;
@synthesize grouppick;
@synthesize grouppicker;
@synthesize providerarray;
@synthesize grouparray;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    agepick.delegate = self;
    agepick.dataSource = self;
    grouppick.dataSource=self;
    grouppick.delegate=self;
    providerpick.delegate=self;
    providerpick.dataSource=self;
    agepick.hidden=YES;
    providerpick.hidden=YES;
    grouppick.hidden=YES;
    agepicker.text=@"Below 12";
ageArray = [[NSArray alloc] initWithObjects:@"Below 12", @"12-20", @"21-30", @"31-40", @"41-50",@"51-60",@"61-70",@"71-80",@"81-90",@"91-100", nil];
    providerpicker.text=@"Apollo";
    providerarray=[[NSMutableArray alloc] initWithObjects:@"Below 12", @"12-20", @"21-30", @"31-40", @"41-50",@"51-60",@"61-70",@"71-80",@"81-90",@"91-100", nil];
    
    grouppicker.text=@"cancer";
   grouparray=[[NSMutableArray alloc] initWithObjects:@"Below 12", @"12-20", @"21-30", @"31-40", @"41-50",@"51-60",@"61-70",@"71-80",@"81-90",@"91-100", nil];
    
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pickerViewTapped)];
    [agepick addGestureRecognizer:tapGR];
    UITapGestureRecognizer *tapGR1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pickerViewTapped1)];
    [providerpick addGestureRecognizer:tapGR1];
    UITapGestureRecognizer *tapGR2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pickerViewTapped2)];
    [grouppick addGestureRecognizer:tapGR2];
	// Do any additional setup after loading the view.
}
- (void)pickerViewTapped
{
        agepick.hidden=YES;
}
- (void)pickerViewTapped1
{
    providerpick.hidden=YES;
}
- (void)pickerViewTapped2

{
   grouppick.hidden=YES;
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
    
      return [ageArray count];
    
    else if(pickerView.tag==2)
    
        return [providerarray count];
    
   else if (pickerView.tag==3)
    
        return [grouparray count];
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
        
        return [ageArray objectAtIndex:row];
    
    else if(pickerView.tag==2)
        
        return [providerarray  objectAtIndex:row];
    
    else
        return [grouparray objectAtIndex:row];
    

}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(agepick.hidden==NO)
    {
        agepick.hidden=YES;
    }
    if (providerpick.hidden==NO) {
        providerpick.hidden=YES;
    }
    if (grouppick.hidden==NO) {
        grouppick.hidden=YES;
    }
}

//If the user chooses from the pickerview, it calls this function;
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(pickerView.tag==1)
        
        agepicker.text=[ageArray objectAtIndex:row];
    
    else if(pickerView.tag==2)
        
    providerpicker.text=[providerarray  objectAtIndex:row];
    
    else
        grouppicker.text= [grouparray objectAtIndex:row];
    //Let's print in the console what the user had chosen;
   // NSLog(@"Chosen item: %@", [itemsArray objectAtIndex:row]);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)changeage:(id)sender
{
    if(agepick.hidden==YES)
    {
    agepick.hidden=NO;
    }
}
-(IBAction)seggenderclicked:(id)sender
{
    if([seggender selectedSegmentIndex]==0)
    {
      gender.text=@"Male";
    }
    else if ([seggender selectedSegmentIndex]==1)
    {
        gender.text=@"Female";

    }
}
-(IBAction)changeprovider:(id)sender
{
    if(providerpick.hidden==YES)
    {
        providerpick.hidden=NO;
    }
}
-(IBAction)changegroup:(id)sender
{
    if(grouppick.hidden==YES)
    {
        grouppick.hidden=NO;
    }
}
-(IBAction)next:(id)sender
{
    [recorddict setValue:gender.text forKey:@"Gender"];
    [recorddict setValue:agepicker.text forKey:@"Age"];
    [recorddict setValue:providerpicker.text forKey:@"Provider"];
    [recorddict setValue:grouppicker.text forKey:@"group"];
    c=1;
}
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    
    //NSLog(@"identifier %@",identifier);
    if([identifier isEqual:@"signup2to3"])
    {
        if (c==1)
        {
            return YES;
        }
        else
        {
            
            return NO;
        }
    }
    else
        return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([segue.identifier isEqualToString:@"signup2to3"])
    {
        
        
        signup3ViewController *destViewController = [segue destinationViewController];
        destViewController.recorddict=recorddict;
        NSLog(@"recorddict in signup2 %@",recorddict);
        // destViewController.delegate=self;
        
    }
    
    
    
}


@end
