//
//  weekmessage2.m
//  Breast Cancer
//
//  Created by DeemSysInc on 25/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import "weekmessage2.h"

#import "BlockAlertView.h"
#import "weeklymessage.h"
#import "weeklymessage3.h"
#import "weeklymessage4.h"

@interface weekmessage2 ()

@end

@implementation weekmessage2
@synthesize recorddict;
NSString *aaa;
int a;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(BOOL)numbers:(NSString *)country1
{
    NSString *countryFormat1 = @"[1-4]{1}";
    
    //  [(UITextField*)[self.view viewWithTag:101] resignFirstResponder];
    NSPredicate *countryTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", countryFormat1];
    return [countryTest1 evaluateWithObject:country1];
    
}

-(IBAction)send:(id)sender
{
    a=0;
    recorddict=[[NSMutableDictionary alloc]init];
    [recorddict addEntriesFromDictionary:temp];
    
    if(([answer2.text length]!=0))
    {
        a=0;
        NSLog(@"a value %i",a);
        if([self numbers:[answer2 text]]==1)
        {
            a=1;
            NSLog(@"a value %i",a);
            if ([answer2.text isEqual:@"1"])
            {
                answer2.text=@"I Forgot";
            }
            else if ([answer2.text isEqual:@"2"])
            {
                answer2.text=@"I Had side effects";
            }
            else if ([answer2.text isEqual:@"3"])
            {
                answer2.text=@"I ran out of Medication";
            }
            [recorddict setValue:answer2.text forKey:@"answer2"];
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
        NSLog(@"recorddict in answer2 %@",recorddict);
        [self performSegueWithIdentifier:@"sms2" sender:self];
    }
    
    
    
}
-(IBAction)clear:(id)sender
{
    answer2.text=@"";
    
}
-(IBAction)next:(id)sender
{
    recorddict=[[NSMutableDictionary alloc]init];
    [recorddict addEntriesFromDictionary:temp];
    
    NSLog(@"recorddict in answer2 %@",recorddict);
    [self performSegueWithIdentifier:@"sms4" sender:self];
    
}

- (IBAction)forgotsel:(id)sender
{
   
    [iforget setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
    [sideeffects setImage:[UIImage imageNamed:@"unselect.png"] forState:UIControlStateNormal];
    [ranout setImage:[UIImage imageNamed:@"unselect.png"] forState:UIControlStateNormal];
    [others setImage:[UIImage imageNamed:@"unselect.png"] forState:UIControlStateNormal];
    answer2.text=@"1";
}



- (IBAction)sideeffectselected:(id)sender
{
    
    [iforget setImage:[UIImage imageNamed:@"unselect.png"] forState:UIControlStateNormal];
    [sideeffects setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
    [ranout setImage:[UIImage imageNamed:@"unselect.png"] forState:UIControlStateNormal];
    [others setImage:[UIImage imageNamed:@"unselect.png"] forState:UIControlStateNormal];
    answer2.text=@"2";
}

- (IBAction)ranoutselected:(id)sender
{
    [iforget setImage:[UIImage imageNamed:@"unselect.png"] forState:UIControlStateNormal];
    [sideeffects setImage:[UIImage imageNamed:@"unselect.png"] forState:UIControlStateNormal];
    [ranout setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
    [others setImage:[UIImage imageNamed:@"unselect.png"] forState:UIControlStateNormal];
    answer2.text=@"3";
}

- (IBAction)othersselected:(id)sender
{
    [iforget setImage:[UIImage imageNamed:@"unselect.png"] forState:UIControlStateNormal];
    [sideeffects setImage:[UIImage imageNamed:@"unselect.png"] forState:UIControlStateNormal];
    [ranout setImage:[UIImage imageNamed:@"unselect.png"] forState:UIControlStateNormal];
    [others setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
    answer2.text=@"4";
}





- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [answer2 resignFirstResponder];
    
}
-(void)dismissKeyboard {
    [answer2 resignFirstResponder];
    [question2 resignFirstResponder];
    
}
- (IBAction)hideKeyboard:(id)sender
{
    // NSLog(@"hideKeyboard");
    [sender resignFirstResponder];
}
-(void)back
{
    
}
- (void)viewDidLoad
{
    send.clipsToBounds = YES;
    send.layer.cornerRadius = 10.0f;
    next.clipsToBounds = YES;
    next.layer.cornerRadius = 10.0f;
    a=0;
    temp=[[NSMutableDictionary alloc]init];
    temp=recorddict;
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
    answer2.delegate=self;
	// Do any additional setup after loading the view.
    NSArray *words = [NSArray arrayWithObjects: @"Nice job!", @"Keep it up!", @"Nice, keep up the good work!",@" Well done!",@"Good job, keeping up with your meds!",@"Nicely done!",@"Wonderful!",@"Nicely done!", nil ];
    reinforce=[words objectAtIndex:arc4random()%[words count]];
    NSLog(@"random %@",reinforce);
    inforce.text=reinforce;
    // NSLog(@"reinforcement %@",inforce.text);
    aaa=[recorddict objectForKey:@"answer1"];
    // NSLog(@"aaa value %@",aaa);
    hiddenfield.text=aaa;
    NSLog(@"hidden field %@",hiddenfield.text);
    if (([aaa isEqual:@"0"])||([aaa isEqual:@"1"])||([aaa isEqual:@"2"])||([aaa isEqual:@"3"])||([aaa isEqual:@"4"])||([aaa isEqual:@"5"]))
    {
        question2.hidden=FALSE;
        answer2.hidden=FALSE;
        send.hidden=FALSE;
        clear.hidden=FALSE;
        next.hidden=TRUE;
        inforce.hidden=TRUE;
        iforget.hidden=FALSE;
        sideeffects.hidden=FALSE;
        ranout.hidden=FALSE;
        others.hidden=FALSE;
        forgotlabel.hidden=FALSE;
        sideeffectlabel.hidden=FALSE;
        ranoutlabel.hidden=FALSE;
        otherslabel.hidden=FALSE;
        
    }
    else     {
        question2.hidden=TRUE;
        answer2.hidden=TRUE;
        send.hidden=TRUE;
        clear.hidden=TRUE;
        next.hidden=FALSE;
        inforce.hidden=FALSE;
        iforget.hidden=TRUE;
        sideeffects.hidden=TRUE;
        ranout.hidden=TRUE;
        others.hidden=TRUE;
        forgotlabel.hidden=TRUE;
        sideeffectlabel.hidden=TRUE;
        ranoutlabel.hidden=TRUE;
        otherslabel.hidden=TRUE;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([segue.identifier isEqualToString:@"sms2"])
    {
        weeklymessage3 *destViewController = [segue destinationViewController];
        destViewController.recorddict=recorddict;
        NSLog(@"recorddict from second page %@",recorddict);
        // destViewController.delegate=self;
        
    }
    else if ([segue.identifier isEqualToString:@"sms4"])
    {
        weeklymessage4 *destViewController = [segue destinationViewController];
        destViewController.recorddict=recorddict;
        NSLog(@"recorddict from second page %@",recorddict);
        // destViewController.delegate=self;
        
    }
    
    
    
    
}


- (void)dealloc {
    [inforce release];
    [sideeffects release];
    [ranout release];
    [others release];
    [forgotlabel release];
    [sideeffectlabel release];
    [ranoutlabel release];
    [otherslabel release];
    [iforget release];
    [question2 release];
    [super dealloc];
}
@end
