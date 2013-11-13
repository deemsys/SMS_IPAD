//
//  smsmainviewcontrollerViewController.m
//  SMSIPAD
//
//  Created by DeemSysInc on 08/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import "smsmainviewcontrollerViewController.h"
#import "WelcomeViewController.h"
#import "signupViewController.h"

@interface smsmainviewcontrollerViewController ()

@end

@implementation smsmainviewcontrollerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    recorddict=[[NSMutableDictionary alloc]init];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];

	// Do any additional setup after loading the view, typically from a nib.
}
-(void)dismissKeyboard {
    [password resignFirstResponder];
    [phonenumber resignFirstResponder];
     }
-(BOOL)alphanumericvalidation:(NSString *)country1
{
    NSString *countryFormat1 = @"(?:[A-Za-z0-9]+)";
    
    // [(UITextField*)[self.view viewWithTag:101] resignFirstResponder];
    NSPredicate *countryTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", countryFormat1];
    return [countryTest1 evaluateWithObject:country1];
    
}
-(BOOL)validateMobile:(NSString*)mobilenumber{
    NSString *mobileFormat1 =  @"[0-9]{10}?";
    
    [(UITextField*)[self.view viewWithTag:101] resignFirstResponder];
    NSPredicate *mobileTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileFormat1];
    return [mobileTest1 evaluateWithObject:mobilenumber];
    
}
-(IBAction)signin:(id)sender
{
   if(([phonenumber.text length]!=0)&&([password.text length]!=0))
   {
      if([self validateMobile:phonenumber.text]==1)
      {
       if([self alphanumericvalidation:password.text]==1)
       {
           [recorddict setValue:phonenumber.text forKey:@"Phonenumber"];
           [recorddict setValue:password.text forKey:@"Password"];
           a=1;
       }
          else
          {
              BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Oh Snap!" message:@"Enter valid Password."];
              
              //  [alert setCancelButtonWithTitle:@"Cancel" block:nil];
              [alert setDestructiveButtonWithTitle:@"x" block:nil];
              [alert show];
          }
      }
       else
       {
           BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Oh Snap!" message:@"Enter valid Phonenumber."];
           
           //  [alert setCancelButtonWithTitle:@"Cancel" block:nil];
           [alert setDestructiveButtonWithTitle:@"x" block:nil];
           [alert show];
       }
   }
    else
    {
        BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Oh Snap!" message:@"Enter all the required fields."];
        
     // [alert setCancelButtonWithTitle:@"Cancel" block:nil];
       [alert setDestructiveButtonWithTitle:@"OK" block:nil];
        [alert show];

    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if([identifier isEqual:@"Welcome"])
    {

    if(a==1)
    {
        return  YES;
    }
    else
        return NO;
        
    }
    else if([identifier isEqual:@"signup"])
        return YES;
    else
        return NO;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   if([segue.identifier isEqualToString:@"Welcome"])
   {
       WelcomeViewController*destViewController = [segue destinationViewController];
       destViewController.recorddict=recorddict;
       NSLog(@"recorddict in welcome %@",recorddict);

   }
    if([segue.identifier isEqualToString:@"signup"])
    {
        signupViewController*destViewController = [segue destinationViewController];
        
        
    }
}
@end
