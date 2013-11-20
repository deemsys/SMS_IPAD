//
//  signup2ViewController.m
//  SMSIPAD
//
//  Created by DeemSysInc on 12/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import "signup2ViewController.h"
#import "signup3ViewController.h"
#import "BlockAlertView.h"

@interface signup2ViewController ()

@end

@implementation signup2ViewController
@synthesize recorddict;
@synthesize agepick;
@synthesize ageArray;
@synthesize agepicker;
@synthesize seggender;
@synthesize gender;



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
    
    agepick.hidden=YES;
    city.delegate=self;
    education.delegate=self;
    medicaldetails.delegate=self;
   
    agepicker.text=@"Below 12";
ageArray = [[NSArray alloc] initWithObjects:@"Below 12", @"12-20", @"21-30", @"31-40", @"41-50",@"51-60",@"61-70",@"71-80",@"81-90",@"91-100", nil];
    
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pickerViewTapped)];
    [agepick addGestureRecognizer:tapGR];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];

	// Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
    c=0;
}
-(void)dismissKeyboard
{
    [city resignFirstResponder];
    [education resignFirstResponder];
    [medicaldetails resignFirstResponder];
}
- (void)pickerViewTapped
{
        agepick.hidden=YES;
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
    
        return [ageArray objectAtIndex:row];
    
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(agepick.hidden==NO)
    {
        agepick.hidden=YES;
    }
    if (agepick) agepick.hidden = !agepick.hidden;
   }

//If the user chooses from the pickerview, it calls this function;
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(pickerView.tag==1)
        
        agepicker.text=[ageArray objectAtIndex:row];
    pickerView.hidden=YES;
    
   
    //Let's print in the console what the user had chosen;
   // NSLog(@"Chosen item: %@", [itemsArray objectAtIndex:row]);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)alphabeticvalidation:(NSString *)country1
{
    NSString *countryFormat1 = @"(?:[A-Za-z]+)";
    
    // [(UITextField*)[self.view viewWithTag:101] resignFirstResponder];
    NSPredicate *countryTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", countryFormat1];
    return [countryTest1 evaluateWithObject:country1];
    
}
-(BOOL)alphanumericvalidation:(NSString *)country1
{
    NSString *countryFormat1 = @"(?:[A-Za-z0-9]+)";
    
    // [(UITextField*)[self.view viewWithTag:101] resignFirstResponder];
    NSPredicate *countryTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", countryFormat1];
    return [countryTest1 evaluateWithObject:country1];
    
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
      gender.text=@"0";
    }
    else if ([seggender selectedSegmentIndex]==1)
    {
        gender.text=@"1";

    }
}
-(IBAction)next:(id)sender
{
    [recorddict setValue:gender.text forKey:@"Gender"];
    [recorddict setValue:agepicker.text forKey:@"Age"];
    [recorddict setValue:city.text forKey:@"City"];
    [recorddict setValue:education.text forKey:@"Education"];
    [recorddict setValue:medicaldetails.text forKey:@"Medicaldetails"];
      c=1;
    
    /* if(([city.text length]!=0)&&([education.text length]!=0)&&([medicaldetails.text length]!=0))
    {
        if([self alphabeticvalidation:city.text]==1)
        {
            if([self alphabeticvalidation:education.text]==1)
            {
                if ([self alphanumericvalidation:medicaldetails.text]==1) {
                    
              
    [recorddict setValue:gender.text forKey:@"Gender"];
    [recorddict setValue:agepicker.text forKey:@"Age"];
    [recorddict setValue:city.text forKey:@"City"];
    [recorddict setValue:education.text forKey:@"Education"];
    [recorddict setValue:medicaldetails.text forKey:@"Medicaldetails"];
    
    c=1;
                }
            else
                {
                    BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Oh Snap!" message:@"Enter Valid Medical details."];
                        [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
                        [alert show];
                    }

            }
            else
            {
                BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Oh Snap!" message:@"Enter Valid Education detail."];
                [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
                [alert show];
            }

            
        }
        else
        {
            BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Oh Snap!" message:@"Enter Valid city."];
        [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
        [alert show];
        }
    }
    else
    {
        BlockAlertView *alert=[[BlockAlertView alloc]initWithTitle:@"Oh Snap!" message:@"Enter all the required fields"];
        [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
        [alert show];
        
        
    }*/
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
-(IBAction)clear:(id)sender
{
    for (UIView *subview in [self.view subviews])
        if([subview isKindOfClass:[UITextField class]])
            [(UITextField*)subview setText:@""];
    medicaldetails.text=@"";
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



- (IBAction)hideKeyboard:(id)sender
{
   // NSLog(@"hideKeyboard");
    [sender resignFirstResponder];
}

@end
