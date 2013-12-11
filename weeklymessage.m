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
#import "weeklymail.h"

@interface weeklymessage ()

@end

@implementation weeklymessage
@synthesize recorddict;
int a;
// Regular Expressions
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
            [recorddict setValue:seq forKey:@"seq"];
            [recorddict setValue:seqmorethan3 forKey:@"seqmorethan3"];
            //NSLog(@"answer5%@",answer1.text);
        }
        else
        {
            BlockAlertView *alert = [BlockAlertView alertWithTitle:@"INFO!" message:@"Invalid answer!Enter a valid number within (0-7)"];
            
            //  [alert setCancelButtonWithTitle:@"Cancel" block:nil];
            [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
            [alert show];
        }
    }
    else
    {
        BlockAlertView *alert = [BlockAlertView alertWithTitle:@"INFO!" message:@"Field should not be empty."];
        
        //  [alert setCancelButtonWithTitle:@"Cancel" block:nil];
        [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
        [alert show];
    }
    if (((([seq isEqual:@"1"])||([seqmorethan3 isEqual:@"1"]))&&(([answer1.text isEqual:@"1"])||([answer1.text isEqual:@"2"])||([answer1.text isEqual:@"3"])||([answer1.text isEqual:@"4"])||[answer1.text isEqual:@"0"]))||([answer1.text isEqual:@"5"]))
    {
        [self performSegueWithIdentifier:@"sms12" sender:self];
    }
    else if (a==1)
    {
        NSLog(@"recorddict in answer1 %@",recorddict);
        [self performSegueWithIdentifier:@"sms1" sender:self];
    }
    else
    {
        NULL;
    }
    
    
    
    
}

// Reset Actions
-(IBAction)clear:(id)sender
{
    answer1.text=@"";
}

- (IBAction)ahtrating:(id)sender
{
    if (seg.selectedSegmentIndex==0)
    {
        answer1.text=@"0";
    }
    if (seg.selectedSegmentIndex==1)
    {
        answer1.text=@"1";
    }
    if (seg.selectedSegmentIndex==2)
    {
        answer1.text=@"2";
    }
    if (seg.selectedSegmentIndex==3)
    {
        answer1.text=@"3";
    }
    if (seg.selectedSegmentIndex==4)
    {
        answer1.text=@"4";
    }
    if (seg.selectedSegmentIndex==5)
    {
        answer1.text=@"5";
    }
    if (seg.selectedSegmentIndex==6)
    {
        answer1.text=@"6";
    }
    if (seg.selectedSegmentIndex==7)
    {
        answer1.text=@"7";
    }
    
    
}
// Keyboard Dismissal
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
    next.clipsToBounds = YES;
    next.layer.cornerRadius = 5.0f;
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
    seq=   [[NSUserDefaults standardUserDefaults]objectForKey:@"Sequenceoccured"];
    seqmorethan3=   [[NSUserDefaults standardUserDefaults]objectForKey:@"Sequenceoccuredmorethan3"];
    NSLog(@"sequence occured %@,count %@",seq,seqmorethan3);
	// Do any additional setup after loading the view.
}

//Data passing to another view controller

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([segue.identifier isEqualToString:@"sms1"])
    {
        
        
        weekmessage2 *destViewController = [segue destinationViewController];
        destViewController.recorddict=recorddict;
        NSLog(@"recorddict in week first %@",recorddict);
        // destViewController.delegate=self;
        
    }
    else if ([segue.identifier isEqualToString:@"sms12"])
    {
        
        
       weeklymail *destViewController = [segue destinationViewController];
        destViewController.recorddict=recorddict;
        NSLog(@"recorddict in weekly first %@",recorddict);
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
- (void)dealloc {
    [seg release];
    [question1 release];
    [next release];
    [super dealloc];
}
@end
