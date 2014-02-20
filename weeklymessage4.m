//
//  weeklymessage4.m
//  Breast Cancer
//
//  Created by DeemSysInc on 23/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import "weeklymessage4.h"
#import "weeklymessage3.h"
#import "weeklymessage5.h"
#import "BlockAlertView.h"
#import <CFNetwork/CFNetwork.h>
#import "SKPSMTPMessage.h"
#import "NSData+Base64Additions.h"
#import "Reachability.h"
#import "MBProgressHUD.h"


#define FROM_EMAIL_PREF_KEY @"kFromEmailPreferenceKey"
#define TO_EMAIL_PREF_KEY @"kToEmailPreferenceKey"
#define RELAY_HOST_PREF_KEY @"kRelayHostPreferenceKey"
#define USE_SSL_BOOL_PREF_KEY @"kUseSSLBoolPreferenceKey"
#define USE_AUTH_BOOL_PREF_KEY @"kUseAuthBoolPreferenceKey"
#define AUTH_USERNAME_PREF_KEY @"kAuthUsernamePreferenceKey"
#define AUTH_PASSWORD_PREF_KEY @"kAuthPasswordPreferenceKey"
#define MESSAGE_SUBJECT_PREF_KEY @"kMessageSubjectPreferenceKey"
#define MESSAGE_BODY_PREF_KEY @"kMessageBodyPreferenceKey"
#define MESSAGE_SIG_PREF_KEY @"kMessageSigPreferenceKey"
#define SEND_IMAGE_BOOL_PREF_KEY @"kSendImageBoolPreferenceKey"
#define SEND_VCARD_BOOL_PREF_KEY @"kSendVcardBoolPreferenceKey"

@interface weeklymessage4 ()

@end

@implementation weeklymessage4
@synthesize recorddict;
int a;

-(BOOL)numbers:(NSString *)country1
{
    NSString *countryFormat1 = @"[1-2]{1}";
    
    //  [(UITextField*)[self.view viewWithTag:101] resignFirstResponder];
    NSPredicate *countryTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", countryFormat1];
    return [countryTest1 evaluateWithObject:country1];
    
}




-(IBAction)send:(id)sender
{
    NSString*prousername=  [[NSUserDefaults standardUserDefaults]objectForKey:@"Providerusername"];
    NSString*proemail= [[NSUserDefaults standardUserDefaults]objectForKey:@"Provideremail"];
    NSString*patientemail= [[NSUserDefaults standardUserDefaults]objectForKey:@"Participantemail"];
    NSString*patusername=[[NSUserDefaults standardUserDefaults]objectForKey:@"Participantusername"];
    NSString*weekno=[[NSUserDefaults standardUserDefaults]objectForKey:@"Weeknum"];
    NSLog(@"providerusername:%@\n,email:%@\n,patemail:%@\n,patusername:%@\n,weekno:%@\n",prousername,proemail,patientemail,patusername,weekno);
    
    a=0;
   // recorddict=[[NSMutableDictionary alloc]init];
    [recorddict addEntriesFromDictionary:temp];
    if(([answer4.text length]!=0))
    {
        a=0;
        if([self numbers:[answer4 text]]==1)
        {
            a=1;
            NSLog(@"a value %i",a);
            if ([answer4.text isEqual:@"1"])
            {
                answer4.text=@"Yes";
            }
            else if ([answer4.text isEqual:@"2"])
            {
                answer4.text=@"No";
            }
            
            [recorddict setValue:answer4.text forKey:@"answer3"];
           
            NSLog(@"answer4 value%@",answer4.text);
            if ([answer4.text isEqualToString:@"Yes"])
            {
                //mail compose
                
                 NSLog(@"Start Sending");
                SKPSMTPMessage *emailMessage = [[SKPSMTPMessage alloc] init];
                emailMessage.fromEmail = @"learnguild@gmail.com";
                
                emailMessage.toEmail = [[NSUserDefaults standardUserDefaults]objectForKey:@"Provideremail"];
                //receiver email address
                emailMessage.relayHost = @"smtp.gmail.com";
                
                emailMessage.requiresAuth = YES;
                emailMessage.login = @"learnguild@gmail.com"; //sender email address
                emailMessage.pass = @"deemsys@123"; //sender email password
                emailMessage.subject =@"BCResearch App Weekly Message Details";
                //[NSString stringWithFormat:@"Hi User %@",[recorddict objectForKey:@"UserName"]];
                emailMessage.wantsSecure = YES;
                emailMessage.delegate = self;
                
                [recorddict objectForKey:@"pass"];
                
                // you must include <SKPSMTPMessageDelegate> to your class
                NSString *messageBody= [NSString stringWithFormat:@"Hi %@ \n\n welcome to BC Research App. \n\n Weekly Message Details for the BCResearch App Participants.\n\n Participant Name: %@\n\n Week Number : %@ \n\n Over for the past seven days on how many days did you take a dose of your AHT medication? : %@ \n\n What made you miss some doses? : %@ \n\n Would you like the app to send an email to your provider? : %@",[[NSUserDefaults standardUserDefaults]objectForKey:@"Providerusername"],[[NSUserDefaults standardUserDefaults]objectForKey:@"Participantusername"],[[NSUserDefaults standardUserDefaults]objectForKey:@"Weeknum"],[recorddict objectForKey:@"answer1"],[recorddict objectForKey:@"answer2"],[recorddict objectForKey:@"answer3"]];
                
                NSDictionary *plainMsg = [NSDictionary
                                          dictionaryWithObjectsAndKeys:@"text/plain",kSKPSMTPPartContentTypeKey,
                                          messageBody,kSKPSMTPPartMessageKey,@"8bit",kSKPSMTPPartContentTransferEncodingKey,nil];
                emailMessage.parts = [NSArray arrayWithObjects:plainMsg,nil];
                [emailMessage send];
                NSLog(@"mail sent to pro");
            }
            //Acknowledgement for participants
            {
                SKPSMTPMessage *emailMessage = [[SKPSMTPMessage alloc] init];
                emailMessage.fromEmail = @"learnguild@gmail.com";
                
                emailMessage.toEmail = [[NSUserDefaults standardUserDefaults]objectForKey:@"Participantemail"];;//receiver email address
                emailMessage.relayHost = @"smtp.gmail.com";
                
                emailMessage.requiresAuth = YES;
                emailMessage.login = @"learnguild@gmail.com"; //sender email address
                emailMessage.pass = @"deemsys@123"; //sender email password
                emailMessage.subject =@"BCResearch App Weekly Message Details";
                //[NSString stringWithFormat:@"Hi User %@",[recorddict objectForKey:@"UserName"]];
                emailMessage.wantsSecure = YES;
                emailMessage.delegate = self;
                
                [recorddict objectForKey:@"pass"];
                
                // you must include <SKPSMTPMessageDelegate> to your class
                NSString *messageBody= [NSString stringWithFormat:@"Hi %@ \n\n welcome to BC Research App. \n\n Your Weekly Message Details has been Submitted to your respective Provider Successfully..\n\n Keep on Answering your Weekly Assessments.\n\n Thankyou. ",@"Uday"];
                
                NSDictionary *plainMsg = [NSDictionary
                                          dictionaryWithObjectsAndKeys:@"text/plain",kSKPSMTPPartContentTypeKey,
                                          messageBody,kSKPSMTPPartMessageKey,@"8bit",kSKPSMTPPartContentTransferEncodingKey,nil];
                emailMessage.parts = [NSArray arrayWithObjects:plainMsg,nil];
                [emailMessage send];
                
                NSLog(@"mail sent to pat");
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
        NSLog(@"recorddict in answer3 %@",recorddict);
        HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
        [self.navigationController.view addSubview:HUD];
        HUD.delegate = self;
        HUD.labelText = @"Saving....";
        [HUD show:YES];
        [self performSelector:@selector(signUpMethod)withObject:nil afterDelay:0.2 ];
        
        
        [self performSegueWithIdentifier:@"sms10" sender:self];
    }
    else
    {
        NULL;
    }
    
}
#pragma mark SKPSMTPMessage Delegate Methods
- (void)messageState:(SKPSMTPState)messageState;
{
    
    
    //insert into database
    
    
}


-(void)messageSent:(SKPSMTPMessage *)message
{
    
}
// On Failure
-(void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error{
    // open an alert with just an OK button
    
    // NSLog(@"delegate - error(%d): %@", [error code], [error localizedDescription]);
    
}

-(void)signUpMethod
{
    // NSString*email=[recorddict objectForKey:@"email"];
    //NSString *username1=[recorddict objectForKey:@"UserName"];
    //  NSLog(@"Signup");
    
    Reachability* wifiReach = [[Reachability reachabilityWithHostName: @"www.apple.com"] retain];
	NetworkStatus netStatus = [wifiReach currentReachabilityStatus];
    
	switch (netStatus)
	{
		case NotReachable:
		{
			isConnect=NO;
			//NSLog(@"Access Not Available");
			break;
		}
			
		case ReachableViaWWAN:
		{
			isConnect=YES;
			//NSLog(@"Reachable WWAN");
			break;
		}
		case ReachableViaWiFi:
		{
			isConnect=YES;
			//NSLog(@"Reachable WiFi");
			break;
		}
	}
	
	
    
    if(isConnect)
    {
        
    }
    //  imgName=@"Connected.png";
    else
    {
        HUD.labelText = @"Check network connection....";
        HUD.customView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]] autorelease];
        HUD.mode = MBProgressHUDModeCustomView;
        [HUD hide:YES afterDelay:1];
        return;
    }
    
    
    NSString*loginid= [[NSUserDefaults standardUserDefaults] objectForKey:@"loginid"];
    //for username
    NSString *resultResponse=[self HttpPostEntityFirst:@"loginid" ForValue1:loginid EntitySecond:@"authkey" ForValue2:@"rzTFevN099Km39PV"];
    
    //  NSLog(@"********%@",resultResponse);
    //   NSLog(@"REGISTRATION");
    
    NSError *error;
    
    SBJSON *json = [[SBJSON new] autorelease];
    NSDictionary *luckyNumbers = [json objectWithString:resultResponse error:&error];
    if (luckyNumbers == nil)
    {
        
        //NSLog(@"luckyNumbers == nil");
        
    }
    else
    {
        
        NSDictionary* menu = [luckyNumbers objectForKey:@"serviceresponse"];
        // NSLog(@"Menu id: %@", [menu objectForKey:@"servicename"]);
        
        
        
        
        if ([[menu objectForKey:@"success"] isEqualToString:@"Yes"])
        {
            [HUD hide:YES];
            BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Info!" message:@"Message Evaluation  Successful!"];
            
            
            [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
            [alert show];
        }
        else if ([[menu objectForKey:@"success"] isEqualToString:@"No"])
        {
            
            BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Info!" message:@"Message Evaluation  failed!"];
            
            
            [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
            [alert show];
            [HUD hide:YES];
            
        }
        
        [HUD hide:YES];
        
    }
    
    
    
}
-(NSString *)HttpPostEntityFirst:(NSString*)firstEntity ForValue1:(NSString*)value1 EntitySecond:(NSString*)secondEntity ForValue2:(NSString*)value2
{
    NSString *weeklyvisit=[[NSUserDefaults standardUserDefaults]objectForKey:@"weeklyvisit"];
    NSString*weekl=  [[NSUserDefaults standardUserDefaults]objectForKey:@"Weeklogid"];
    NSString *weeknum=[[NSUserDefaults standardUserDefaults]objectForKey:@"Weeknum"];
    NSString *weekdate=[[NSUserDefaults standardUserDefaults]objectForKey:@"Weekdate"];
    NSLog(@"l=%@,n=%@,d=%@",weekl,weeknum, weekdate);
    int n=[[recorddict objectForKey:@"answer1"]integerValue];
    int countcol;
    
  
        if(n<=5)
        {
            countcol=1;
        }
        else
            countcol=0;
    
    NSString *post =[[NSString alloc] initWithFormat:@"%@=%@&answer1=%@&answer2=%@&answer3=%@&weeknum=%@&weekdate=%@&weeklogid=%@&countcol=%d&%@=%@",firstEntity,value1,[recorddict objectForKey:@"answer1"],[recorddict objectForKey:@"answer2"],[recorddict objectForKey:@"answer3"],weeknum,weekdate,weekl,countcol,secondEntity,value2];
    
    NSURL *url=[NSURL URLWithString:@"http://localhost:8888/bcreasearch/Service/participantregister.php?service=weeklyevaluation"];
    
    
    
    NSLog(@"%@",post);
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    NSLog(@"postlenth%@",postLength);
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    //when we user https, we need to allow any HTTPS cerificates, so add the one line code,to tell teh NSURLRequest to accept any https certificate, i'm not sure //about the security aspects
    
    
    //    [NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
    
    NSError *error;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSString *data=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    
    
    NSLog(@"response %@",data);
    
    
    
    
    
    return data;
    
}
-(IBAction)clear:(id)sender
{
    answer4.text=@"";
}
-(void)dismissKeyboard
{
    [answer4 resignFirstResponder];
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [answer4 resignFirstResponder];
}
- (IBAction)hideKeyboard:(id)sender
{
    // NSLog(@"hideKeyboard");
    [sender resignFirstResponder];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)back
{
    
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
    answer4.delegate=self;
	// Do any additional setup after loading the view.
    
    temp=[[NSMutableDictionary alloc]init];
    temp=recorddict;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([segue.identifier isEqualToString:@"sms10"])
    {
        weeklymessage5 *destViewController = [segue destinationViewController];
        destViewController.recorddict=recorddict;
        NSLog(@"recorddict from fourth page %@",recorddict);
        // destViewController.delegate=self;
        
    }
    
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [super dealloc];
}
@end
