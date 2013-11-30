//
//  weeklymail.m
//  Breast Cancer
//
//  Created by DeemSysInc on 30/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import "weeklymail.h"
#import "weekmessage2.h"
#import "BlockAlertView.h"

@interface weeklymail ()

@end

@implementation weeklymail
@synthesize recorddict;
int a;

-(BOOL)numbers:(NSString *)country1
{
    NSString *countryFormat1 = @"[0-7]{1}";
    
    //  [(UITextField*)[self.view viewWithTag:101] resignFirstResponder];
    NSPredicate *countryTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", countryFormat1];
    return [countryTest1 evaluateWithObject:country1];
    
}

-(IBAction)send:(id)sender
{
    recorddict=[[NSMutableDictionary alloc]init];
    if(([mailanswer.text length]!=0))
    {
        a=0;
        if([self numbers:[mailanswer text]]==1)
        {
            a=1;
            NSLog(@"a value %i",a);
            //[recorddict setValue:mailanswer.text forKey:@"answer1"];
            //NSLog(@"answer5%@",answer1.text);
            
        }
        else
        {
            BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Oh Snap!" message:@"Answer you submitted is Invalid."];
            
            //  [alert setCancelButtonWithTitle:@"Cancel" block:nil];
            [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
            [alert show];
        }
    }
    else
    {
        BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Oh Snap!" message:@"Field should not be empty."];
        
        //  [alert setCancelButtonWithTitle:@"Cancel" block:nil];
        [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
        [alert show];
    }
    if (a==1)
    {
        NSLog(@"recorddict in answer1 %@",recorddict);
        [self performSegueWithIdentifier:@"sms13" sender:self];
    }
    else
    {
        NULL;
    }
    
    
}

-(IBAction)clear:(id)sender
{
    mailanswer.text=@"";
}
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
    UIButton *home = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *homeImage = [UIImage imageNamed:@" "]  ;
    [home setBackgroundImage:homeImage forState:UIControlStateNormal];
    [home addTarget:self action:@selector(back)
   forControlEvents:UIControlEventTouchUpInside];
    home.frame = CGRectMake(0, 0, 50, 30);
    UIBarButtonItem *cancelButton = [[[UIBarButtonItem alloc]
                                      initWithCustomView:home] autorelease];
    self.navigationItem.leftBarButtonItem = cancelButton;
    
	// Do any additional setup after loading the view.
}

-(void)back
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([segue.identifier isEqualToString:@"sms13"])
    {
        weekmessage2 *destViewController = [segue destinationViewController];
        destViewController.recorddict=recorddict;
        NSLog(@"recorddict in week first %@",recorddict);
        // destViewController.delegate=self;
        
    }
}

@end
