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
#import <CFNetwork/CFNetwork.h>
#import "SKPSMTPMessage.h"
#import "NSData+Base64Additions.h"
#import "Reachability.h"
#import "MBProgressHUD.h"


@interface weeklymail ()

@end

@implementation weeklymail
@synthesize recorddict;
int a;

-(BOOL)numbers:(NSString *)country1
{
    NSString *countryFormat1 = @"[1-2]{1}";
    
    //  [(UITextField*)[self.view viewWithTag:101] resignFirstResponder];
    NSPredicate *countryTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", countryFormat1];
    return [countryTest1 evaluateWithObject:country1];
    
}
-(void)updatetable
{
    NSLog(@"update started");
    NSString *useridnumber = [[NSUserDefaults standardUserDefaults] objectForKey:@"loginid"];
    NSString *resultResponse2=[self HttpPostEntityFirstsequence:@"loginid" ForValue1:useridnumber EntityThird:@"authkey" ForValue3:@"rzTFevN099Km39PV"];
    
    NSError *error2;
    SBJSON *json2 = [[SBJSON new] autorelease];
    // NSLog(@"response %@",resultResponse);
	NSDictionary *luckyNumbers2 = [json2 objectWithString:resultResponse2 error:&error2];
    
    if (luckyNumbers2 == nil)
    {
        ////NSLog(@"Failed");
        
    }
    else
    {
        
        NSDictionary* menu = [luckyNumbers2 objectForKey:@"serviceresponse"];
        //////NSLog(@"Menu id: %@", [menu objectForKey:@"success"]);
        
        if ([[menu objectForKey:@"success"] isEqualToString:@"Yes"])
        {
            
            HUD.labelText = @"Completed.";
            HUD.customView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]] autorelease];
            HUD.mode = MBProgressHUDModeCustomView;
            [HUD hide:YES afterDelay:0];
        }
        else
        {
            BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Oh Snap!" message:@"Failed to update weekly evaluation result."];
            
            [HUD hide:YES];
            
            [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
            [alert show];
            
        }
    }
    
}
-(NSString *)HttpPostEntityFirstsequence:(NSString*)firstEntity ForValue1:(NSString*)value1  EntityThird:(NSString*)thirdEntity ForValue3:(NSString*)value3
{
    //getting weekly evaluation sequence occurence
    HUD.labelText = @"Updating Weekly evaluation result...";
    
    NSString *post =[[NSString alloc] initWithFormat:@"%@=%@&%@=%@",firstEntity,value1,thirdEntity,value3];
    NSURL *url=[NSURL URLWithString:@"http://www.medsmonit.com/bcreasearch/Service/genericUpdate.php?service=sequenceUpdate"];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSError *error;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSString *data=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    NSLog(@" post %@ ",post);
    
    NSLog(@"result for update %@ ",data);
    
    return data;
    
}
- (IBAction)hideKeyboard:(id)sender
{
    //  NSLog(@"hideKeyboard");
    [sender resignFirstResponder];
}
-(IBAction)send:(id)sender
{
    [self updatetable];
    //recorddict=[[NSMutableDictionary alloc]init];
    if(([mailanswer.text length]!=0))
    {
        a=0;
        if([self numbers:[mailanswer text]]==1)
        {
            a=1;
            NSLog(@"a value %i",a);
            NSString*proemail= [[NSUserDefaults standardUserDefaults]objectForKey:@"Provideremail"];
            NSString*patusername=[[NSUserDefaults standardUserDefaults]objectForKey:@"Participantusername"];
            //smtp email composing
            
            if (([mailanswer.text isEqual:@"1"])&&(cont=@"1"))
            {
                //mail compose
                
                // NSLog(@"Start Sending");
                SKPSMTPMessage *emailMessage = [[SKPSMTPMessage alloc] init];
                emailMessage.fromEmail = @"learnguild@gmail.com";
                
                emailMessage.toEmail =[[NSUserDefaults standardUserDefaults]objectForKey:@"Provideremail"];
                emailMessage.relayHost = @"smtp.gmail.com";
                
                emailMessage.requiresAuth = YES;
                emailMessage.login = @"learnguild@gmail.com"; //sender email address
                emailMessage.pass = @"deemsys@123"; //sender email password
                emailMessage.subject =@"BCResearch App Weekly Message Details";
                //[NSString stringWithFormat:@"Hi User %@",[recorddict objectForKey:@"UserName"]];
                emailMessage.wantsSecure = YES;
                emailMessage.delegate = self;
                
                // you must include <SKPSMTPMessageDelegate> to your class
                NSString *messageBody= [NSString stringWithFormat:@"Hi %@ \n\n welcome to BC Research App. \n\n The participant %@ under your treatment had misses his/her medications frequently thrice in a row entering values less than 5.\n\n Also he wants the admin to contact him.\n\n Thank you.",[[NSUserDefaults standardUserDefaults]objectForKey:@"Providerusername"],[[NSUserDefaults standardUserDefaults]objectForKey:@"Participantusername"]];
                
                NSDictionary *plainMsg = [NSDictionary
                                          dictionaryWithObjectsAndKeys:@"text/plain",kSKPSMTPPartContentTypeKey,
                                          messageBody,kSKPSMTPPartMessageKey,@"8bit",kSKPSMTPPartContentTransferEncodingKey,nil];
                emailMessage.parts = [NSArray arrayWithObjects:plainMsg,nil];
                [emailMessage send];
            }
            else if(([mailanswer.text isEqual:@"1"])&&(count=@"1"))
            {
                //mail compose
                
                // NSLog(@"Start Sending");
                SKPSMTPMessage *emailMessage = [[SKPSMTPMessage alloc] init];
                emailMessage.fromEmail = @"learnguild@gmail.com";
                
                emailMessage.toEmail =[[NSUserDefaults standardUserDefaults]objectForKey:@"Provideremail"];
                emailMessage.relayHost = @"smtp.gmail.com";
                
                emailMessage.requiresAuth = YES;
                emailMessage.login = @"learnguild@gmail.com"; //sender email address
                emailMessage.pass = @"deemsys@123"; //sender email password
                emailMessage.subject =@"BCResearch App Weekly Message Details";
                //[NSString stringWithFormat:@"Hi User %@",[recorddict objectForKey:@"UserName"]];
                emailMessage.wantsSecure = YES;
                emailMessage.delegate = self;
                
                // you must include <SKPSMTPMessageDelegate> to your class
                NSString *messageBody= [NSString stringWithFormat:@"Hi %@ \n\n welcome to BC Research App. \n\n The participant %@ under your treatment had misses his/her medications 4 times out of 12 weekly assessments entering values less than 5.\n\n Also he wants the admin to contact him.\n\n Thank you.",[[NSUserDefaults standardUserDefaults]objectForKey:@"Providerusername"],[[NSUserDefaults standardUserDefaults]objectForKey:@"Participantusername"]];
                
                NSDictionary *plainMsg = [NSDictionary
                                          dictionaryWithObjectsAndKeys:@"text/plain",kSKPSMTPPartContentTypeKey,
                                          messageBody,kSKPSMTPPartMessageKey,@"8bit",kSKPSMTPPartContentTransferEncodingKey,nil];
                emailMessage.parts = [NSArray arrayWithObjects:plainMsg,nil];
                [emailMessage send];
            }
            
            
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
        [self performSegueWithIdentifier:@"sms15" sender:self];
    }
    else
    {
        NULL;
    }
    
    
}

- (IBAction)yesact:(id)sender
{
    mailanswer.text=@"1";
    [yesb setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
    
    [nob setImage:[UIImage imageNamed:@"unselect.png"] forState:UIControlStateNormal];
}

- (IBAction)noact:(id)sender
{
    mailanswer.text=@"1";
    [yesb setImage:[UIImage imageNamed:@"unselect.png"] forState:UIControlStateNormal];
    
    [nob setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
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
#pragma mark SKPSMTPMessage Delegate Methods
- (void)messageState:(SKPSMTPState)messageState;
{
    
    
    //insert into database
    
    
}


-(void)messageSent:(SKPSMTPMessage *)message
{
    if (a==1)
    {
        NSLog(@"recorddict in answer1 %@",recorddict);
        [self performSegueWithIdentifier:@"sms15" sender:self];
    }
}
// On Failure
-(void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error{
    // open an alert with just an OK button
    
    // NSLog(@"delegate - error(%d): %@", [error code], [error localizedDescription]);
   
}

- (void)viewDidLoad
{
    next.clipsToBounds = YES;
    next.layer.cornerRadius = 5.0f;
    NSString*sequenceocc=[[NSUserDefaults standardUserDefaults]objectForKey:@"Sequenceoccured"];
    NSString*sequenceoccmore=[[NSUserDefaults standardUserDefaults]objectForKey:@"Sequenceoccuredmorethan3"];
  cont= [recorddict objectForKey:@"seq"];
    count=[recorddict objectForKey: @"seqmorethan3"];
    NSLog(@"cont value%@",cont);
    NSLog(@"count value%@",count);
    
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
    
    
    if ([segue.identifier isEqualToString:@"sms15"])
    {
        weekmessage2 *destViewController = [segue destinationViewController];
        destViewController.recorddict=recorddict;
        NSLog(@"recorddict in week first %@",recorddict);
        // destViewController.delegate=self;
        
    }
}

- (void)dealloc {
    
    [yesb release];
    [nob release];
    [next release];
    [super dealloc];
}
@end
