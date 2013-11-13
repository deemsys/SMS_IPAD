//
//  signupViewController.m
//  SMSIPAD
//
//  Created by DeemSysInc on 12/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import "signupViewController.h"

@interface signupViewController ()

@end

@implementation signupViewController
@synthesize recorddict;
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
 recorddict=[[NSMutableDictionary alloc]init];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
	// Do any additional setup after loading the view.
}
-(void)dismissKeyboard {
    [firstname resignFirstResponder];
    [mobilecode resignFirstResponder];
    [mobilenum resignFirstResponder];
    [email resignFirstResponder];
    
    }
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)validateEmail:(NSString*)candidate{
    NSString *emailFormat1 = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    
    NSPredicate *emailTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailFormat1];
    return [emailTest1 evaluateWithObject:candidate];
    
}
-(IBAction)clear:(id)sender{
    for (UIView *subview in [self.view subviews])
        if([subview isKindOfClass:[UITextField class]])
            [(UITextField*)subview setText:@""];

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

-(BOOL)validateMobile:(NSString*)mobilenumber{
    NSString *mobileFormat1 =  @"[0-9]{10}?";
    
    [(UITextField*)[self.view viewWithTag:101] resignFirstResponder];
    NSPredicate *mobileTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileFormat1];
    return [mobileTest1 evaluateWithObject:mobilenumber];
    
}
-(IBAction)sendmobilecode:(id)sender{
    
}
-(IBAction)verifyemail:(id)sender
{
    
}

-(IBAction)next:(id)sender
{
 
if(([firstname.text length]!=0)&&([mobilenum.text length]!=0)&&([mobilecode.text length]!=0)&&([email.text length]!=0))
{
    if ([self alphabeticvalidation:firstname.text]==1)
    {
        if ([self validateMobile:mobilenum.text]==1)
        {
          if ([self alphanumericvalidation:mobilecode.text]==1)
          {
              if ([self validateEmail:email.text]==1)
              {
                  c=1;
                  [recorddict setValue:firstname.text forKey:@"FirstName"];
                  [recorddict setValue:mobilecode.text forKey:@"Mobilecode"];
                  [recorddict setValue:mobilenum.text forKey:@"Mobilenum"];
                  [recorddict setValue:email.text forKey:@"email"];
                  
                  
                  
              }
              else
              {
                  BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Oh Snap!" message:@"Enter Valid emailid."];
                  [alert setDestructiveButtonWithTitle:@"x" block:nil];
                  [alert show];
              }
          }
          else
          {
              BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Oh Snap!" message:@"Enter Valid Mobile Code."];
              [alert setDestructiveButtonWithTitle:@"x" block:nil];
              [alert show];
          }

            
        }
        else
        {
            BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Oh Snap!" message:@"Enter Valid Mobile Number."];
            [alert setDestructiveButtonWithTitle:@"x" block:nil];
            [alert show];
        }
    }
    else
    {
        BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Oh Snap!" message:@"Enter Valid Firstname."];
        [alert setDestructiveButtonWithTitle:@"x" block:nil];
        [alert show];
    }
}
 else
 {
     BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Oh Snap!" message:@"Enter all the required fields."];
     [alert setDestructiveButtonWithTitle:@"OK" block:nil];
     [alert show];

 }
}
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    
    //NSLog(@"identifier %@",identifier);
    if([identifier isEqual:@"signup1to2"])
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
    
    
    if ([segue.identifier isEqualToString:@"signup1to2"])
    {
        
        
       signup2ViewController *destViewController = [segue destinationViewController];
        destViewController.recorddict=recorddict;
        NSLog(@"recorddict in signup1 %@",recorddict);
        // destViewController.delegate=self;
        
    }
    
    
    
}


@end
