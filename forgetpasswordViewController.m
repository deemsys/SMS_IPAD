//
//  forgetpasswordViewController.m
//  SMSIPAD
//
//  Created by DeemsysInc on 11/14/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import "forgetpasswordViewController.h"
#import "BlockAlertView.h"
@interface forgetpasswordViewController ()

@end

@implementation forgetpasswordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated
{
    prefKeyDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                         toEmail, TO_EMAIL_PREF_KEY,
                         fromEmail, FROM_EMAIL_PREF_KEY,
                         relayHost, RELAY_HOST_PREF_KEY,
                         SSLSwitch, USE_SSL_BOOL_PREF_KEY,
                         useAuthSwitch, USE_AUTH_BOOL_PREF_KEY,
                         login, AUTH_USERNAME_PREF_KEY,
                         password, AUTH_PASSWORD_PREF_KEY,
                         subject, MESSAGE_SUBJECT_PREF_KEY,
                         messageBody, MESSAGE_BODY_PREF_KEY,
                         sig, MESSAGE_SIG_PREF_KEY,
                         sendImageSwitch, SEND_IMAGE_BOOL_PREF_KEY,
                         sendVCFSwitch, SEND_VCARD_BOOL_PREF_KEY,
                         nil];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *pref_keys = [NSArray arrayWithArray:[prefKeyDictionary allKeys]];
    for (id pref_key in pref_keys)
    {
        id ui_element = [prefKeyDictionary objectForKey:pref_key];
        if ([ui_element isKindOfClass:[UITextField class]])
        {
            ((UITextField *)ui_element).text = [defaults stringForKey:pref_key];
        }
        else if ([ui_element isKindOfClass:[UISwitch class]])
        {
            ((UISwitch *)ui_element).on = [defaults boolForKey:pref_key];
        }
    }
    
}
#pragma mark SKPSMTPMessage Delegate Methods
- (void)messageState:(SKPSMTPState)messageState;
{
    NSLog(@"HighestState:%d", HighestState);
    if (messageState > HighestState)
        HighestState = messageState;
    
    ProgressBar.progress = (float)HighestState/(float)kSKPSMTPWaitingSendSuccess;
}

#pragma mark IBActions

- (IBAction)sendpassword:(id)sender
{
    NSString * password1 = @"";
  //  NSString*finaltext=@"Hi user,your password is";
       NSString *letters = @"abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ123456789+@";
   
       NSString *pw = @"";
       NSRange r;
  
        int PASSWORD_LENGTH=6;
        for (int i=0; i<PASSWORD_LENGTH; i++)
          {
              int  index = (arc4random()%[letters length])+1;
                    r.location=index;
                  r.length=1;
                   pw = [letters substringWithRange:r]  ;
                   password1 = [password1 stringByAppendingString:[NSString stringWithFormat:@"%@",pw]];
              
               }
    
    
    
  //  finaltext=[finaltext stringByAppendingString:[NSString stringWithFormat:@"%@",password1]];
    
    
    
    
    NSLog(@"Start Sending");
    SKPSMTPMessage *emailMessage = [[SKPSMTPMessage alloc] init];
    emailMessage.fromEmail = @"learnguild@gmail.com";
    //sender email address
    emailMessage.toEmail = emailid.text;  //receiver email address
    emailMessage.relayHost = @"smtp.gmail.com";
        emailMessage.requiresAuth = YES;
    emailMessage.login = @"learnguild@gmail.com"; //sender email address
    emailMessage.pass = @"deemsys@123"; //sender email password
    emailMessage.subject =@"Hi user";
    emailMessage.wantsSecure = YES;
    emailMessage.delegate = self; // you must include <SKPSMTPMessageDelegate> to your class
    NSString *messageBody = [NSString stringWithFormat:@"Hi .\n welcome to BC Research App. \n\n Your Password:%@",password1];

    
    NSDictionary *plainMsg = [NSDictionary
                              dictionaryWithObjectsAndKeys:@"text/plain",kSKPSMTPPartContentTypeKey,
                              messageBody,kSKPSMTPPartMessageKey,@"8bit",kSKPSMTPPartContentTransferEncodingKey,nil];
    emailMessage.parts = [NSArray arrayWithObjects:plainMsg,nil];
     Spinner.hidden = NO;
    [Spinner startAnimating];
    ProgressBar.hidden = NO;
    HighestState = 0;

    [emailMessage send];
    // sending email- will take little time to send so its better to use indicator with message showing sending...}


    
}

-(void)messageSent:(SKPSMTPMessage *)message{
    NSLog(@"delegate - message sent");
    BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Done!" message:@"Password sent."];
    [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
    [alert show];
    [Spinner stopAnimating];
}
// On Failure
-(void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error{
    // open an alert with just an OK button
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
     [Spinner stopAnimating];
    NSLog(@"delegate - error(%d): %@", [error code], [error localizedDescription]);
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
//[[UINavigationBar appearance] setBarTintColor:[UIColor yellowColor]];
  

	// Do any additional setup after loading the view.
}

- (IBAction)hideKeyboard:(id)sender
{
    //NSLog(@"hideKeyboard");
    [sender resignFirstResponder];
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
