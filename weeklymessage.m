//
//  weeklymessage.m
//  Breast Cancer
//
//  Created by DeemSysInc on 20/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import "weeklymessage.h"
#import "BlockUI.h"
#import "BlockAlertView.h"
#import "weekmessage2.h"
#import "weeklymessage4.h"

@interface weeklymessage ()

@end

@implementation weeklymessage
@synthesize recorddict;
int a;

-(BOOL)numbers:(NSString *)country1
{
    NSString *countryFormat1 = @"[0-7]{1}";
    
    //  [(UITextField*)[self.view viewWithTag:101] resignFirstResponder];
    NSPredicate *countryTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", countryFormat1];
    return [countryTest1 evaluateWithObject:country1];
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(IBAction)send:(id)sender
{
    recorddict=[[NSMutableDictionary alloc]init];
    if(([answer1.text length]!=0))
    {
        a=0;
        if([self numbers:[answer1 text]]==1)
        {
            a=1;
            NSLog(@"a value %i",a);
            [recorddict setValue:answer1.text forKey:@"answer1"];
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
        [self performSegueWithIdentifier:@"sms1" sender:self];
    }
    else
    {
        NULL;
    }
    
    
    
}
-(IBAction)clear:(id)sender
{
    answer1.text=@"";
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [answer1 resignFirstResponder];
}
-(void)back
{
    
}
-(void)dismissKeyboard {
    [question1 resignFirstResponder];
    [answer1 resignFirstResponder];
}
- (IBAction)hideKeyboard:(id)sender
{
    // NSLog(@"hideKeyboard");
    [sender resignFirstResponder];
}
- (void)viewDidLoad
{
    
    UIButton *home = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *homeImage = [UIImage imageNamed:@" "]  ;
    [home setBackgroundImage:homeImage forState:UIControlStateNormal];
    [home addTarget:self action:@selector(back)
   forControlEvents:UIControlEventTouchUpInside];
    home.frame = CGRectMake(0, 0, 50, 30);
    UIBarButtonItem *cancelButton = [[[UIBarButtonItem alloc]
                                      initWithCustomView:home] autorelease];
    self.navigationItem.leftBarButtonItem = cancelButton;
    
    [super viewDidLoad];
    answer1.delegate=self;
    BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Weekly Evaluation" message:@"System Begins Your Evaluation."];
    
    //  [alert setCancelButtonWithTitle:@"Cancel" block:nil];
    // [alert setDestructiveButtonWithTitle:@"ok" block:nil];
    [alert setCancelButtonWithTitle:@"ok" block:nil];
    [alert show];
	// Do any additional setup after loading the view.
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([segue.identifier isEqualToString:@"sms1"])
    {
        
        
        weekmessage2 *destViewController = [segue destinationViewController];
        destViewController.recorddict=recorddict;
        NSLog(@"recorddict in week first %@",recorddict);
        // destViewController.delegate=self;
        
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    a=0;
    //  self.view.frame=CGRectMake(0,0,50,50);
}
@end
