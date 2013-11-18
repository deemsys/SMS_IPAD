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
    firstname.delegate=self;
    username.delegate=self;
    mobilenum.delegate=self;
    email.delegate=self;
    
 recorddict=[[NSMutableDictionary alloc]init];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];

	// Do any additional setup after loading the view.
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    c=0;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}



- (IBAction)hideKeyboard:(id)sender
{
    //NSLog(@"hideKeyboard");
    [sender resignFirstResponder];
}

-(void)dismissKeyboard {
    [firstname resignFirstResponder];
    [username resignFirstResponder];
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
   NSString *mobileFormat1 =  @"[4-6]{1}[0-9]{9}?";
   //  NSString *mobileFormat1=@"((?([0-9]{3}))?[-. ]?([0-9]{3})[-. ]?([0-9]{4}))";
    [(UITextField*)[self.view viewWithTag:101] resignFirstResponder];
    NSPredicate *mobileTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileFormat1];
    return [mobileTest1 evaluateWithObject:mobilenumber];
    
}

-(IBAction)next:(id)sender
{
 
if(([firstname.text length]!=0)&&([mobilenum.text length]!=0)&&([username.text length]!=0)&&([email.text length]!=0))
{
    if ([self alphabeticvalidation:firstname.text]==1)
    {
        if ([self alphanumericvalidation:username.text]==1)
        {
          if ([self validateMobile:mobilenum.text]==1)
          {
              if ([self validateEmail:email.text]==1)
              {
                  c=1;
                  [recorddict setValue:firstname.text forKey:@"FirstName"];
                  [recorddict setValue:username.text forKey:@"UserName"];
                  [recorddict setValue:mobilenum.text forKey:@"Mobilenum"];
                  [recorddict setValue:email.text forKey:@"email"];
                  
                  
                  
              }
              else
              {
                  BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Oh Snap!" message:@"Enter Valid emailid."];
                  [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
                  [alert show];
              }
          }
          else
          {
              BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Oh Snap!" message:@"Enter Valid Mobilenumber."];
              [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
              [alert show];
          }

            
        }
        else
        {
            BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Oh Snap!" message:@"Enter Valid Username."];
            [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
            [alert show];
        }
    }
    else
    {
        BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Oh Snap!" message:@"Enter Valid Firstname."];
        [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
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
