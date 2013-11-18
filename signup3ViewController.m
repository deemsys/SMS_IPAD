//
//  signup3ViewController.m
//  SMSIPAD
//
//  Created by DeemSysInc on 12/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import "signup3ViewController.h"
#import "BlockAlertView.h"
#import <CFNetwork/CFNetwork.h>
#import "SKPSMTPMessage.h"
#import "NSData+Base64Additions.h"

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






@interface signup3ViewController ()

@end

@implementation signup3ViewController
@synthesize timepick1;
@synthesize timepicker1;
@synthesize timepick2;
@synthesize timepick3;
@synthesize timepicker2;
@synthesize timepicker3;
@synthesize timearray;

@synthesize recorddict;
@synthesize providerpick;
@synthesize providerpicker;
@synthesize grouppick;
@synthesize grouppicker;
@synthesize providerarray;
@synthesize grouparray;

#pragma mark - UIPickerView DataSource


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
    timepick1.hidden=YES;
    timepick2.hidden=YES;
    timepick3.hidden=YES;
    timepicker1.text=@"0-1";
    timepicker2.text=@"0-1";
    timepicker3.text=@"0-1";
   /* grouppick.dataSource=self;
    grouppick.delegate=self;
    providerpick.delegate=self;
    providerpick.dataSource=self;*/
    providerpick.hidden=YES;
    grouppick.hidden=YES;
    timearray=[[NSMutableArray alloc] initWithObjects:@"0-1", @"1-2", @"2-3", @"3-4", @"4-5",@"5-6",@"6-7",@"7-8",@"8-9",@"9-10",@"10-11",@"11-12",@"12-13",@"13-14",@"14-15",@"15-16",@"16-17",@"18-19",@"19-20",@"20-21",@"21-22",@"22-23",@"23-0", nil];
    providerpicker.text=@"Apollo";
    providerarray=[[NSMutableArray alloc] initWithObjects:@"Below 12", @"12-20", @"21-30", @"31-40", @"41-50",@"51-60",@"61-70",@"71-80",@"81-90",@"91-100", nil];
    
    grouppicker.text=@"cancer";
    grouparray=[[NSMutableArray alloc] initWithObjects:@"Below 12", @"12-20", @"21-30", @"31-40", @"41-50",@"51-60",@"61-70",@"71-80",@"81-90",@"91-100", nil];
    UITapGestureRecognizer *tapGR3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pickerViewTapped3)];
    [providerpick addGestureRecognizer:tapGR3];
    UITapGestureRecognizer *tapGR4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pickerViewTapped4)];
    [grouppick addGestureRecognizer:tapGR4];
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pickerViewTapped)];
    [timepick1 addGestureRecognizer:tapGR];
    UITapGestureRecognizer *tapGR1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pickerViewTapped1)];
    [timepick2 addGestureRecognizer:tapGR1];
    UITapGestureRecognizer *tapGR2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pickerViewTapped2)];
    [timepick3 addGestureRecognizer:tapGR2];

    
	// Do any additional setup after loading the view.
}
- (void)pickerViewTapped
{
    timepick1.hidden=YES;
}
- (void)pickerViewTapped1
{
    timepick2.hidden=YES;
}
- (void)pickerViewTapped2

{
    timepick3.hidden=YES;
}
- (void)pickerViewTapped3
{
    providerpick.hidden=YES;
}
- (void)pickerViewTapped4

{
    grouppick.hidden=YES;
}

#pragma mark - UIPickerView DataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(pickerView.tag==1)
        
        return [timearray count];
    
    else if(pickerView.tag==2)
        
        return [timearray count];
    
    else if (pickerView.tag==3)
        
        return [timearray count];
    else if(pickerView.tag==4)
        
        return [providerarray count];
    
    else if (pickerView.tag==5)
        
        return [grouparray count];
    else
        return 1;
}


#pragma mark - UIPickerView Delegate
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 30.0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(pickerView.tag==1)
        
        return [timearray objectAtIndex:row];
    
    else if(pickerView.tag==2)
        
        return [timearray  objectAtIndex:row];
    
    else if(pickerView.tag==3)
        
        return [timearray  objectAtIndex:row];
    
    else if(pickerView.tag==4)
        
        return [providerarray  objectAtIndex:row];
    
    else if(pickerView.tag==5)
        return [grouparray objectAtIndex:row];
    else
         return [timearray  objectAtIndex:row];
    
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(timepick1.hidden==NO)
    {
        timepick1.hidden=YES;
    }
    if (timepick2.hidden==NO) {
        timepick2.hidden=YES;
    }
    if (timepick3.hidden==NO) {
       timepick3.hidden=YES;
    }
    if (providerpick.hidden==NO) {
        providerpick.hidden=YES;
    }
    if (grouppick.hidden==NO) {
        grouppick.hidden=YES;
    }

}

//If the user chooses from the pickerview, it calls this function;
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(pickerView.tag==1)
        
        timepicker1.text=[timearray objectAtIndex:row];
    
    else if(pickerView.tag==2)
        
       timepicker2.text=[timearray  objectAtIndex:row];
    else if(pickerView.tag==4)
        
        providerpicker.text=[providerarray  objectAtIndex:row];
    
    else if(pickerView.tag==5)
        grouppicker.text= [grouparray objectAtIndex:row];
    else if(pickerView.tag==3)
        timepicker3.text= [timearray objectAtIndex:row];
    else
        timepicker3.text= [timearray objectAtIndex:row];

    //Let's print in the console what the user had chosen;
    // NSLog(@"Chosen item: %@", [itemsArray objectAtIndex:row]);
}
-(void)viewWillAppear:(BOOL)animated
{
    c=0;
}

 -(IBAction)changeTimeInLabel1:(id)sender
{
    if (timepick1.hidden==YES)
    {
        timepick1.hidden=NO;
        
    }
}
-(IBAction)changeTimeInLabel2:(id)sender
{
    if (timepick2.hidden==YES)
    {
        timepick2.hidden=NO;
        
    }
}
-(IBAction)changeTimeInLabel3:(id)sender
{
    if (timepick3.hidden==YES)
    {
        timepick3.hidden=NO;
        
    }
}
-(IBAction)changeprovider:(id)sender
{
    if(providerpick.hidden==YES)
    {
        providerpick.hidden=NO;
    }
}
-(IBAction)changegroup:(id)sender
{
    if(grouppick.hidden==YES)
    {
        grouppick.hidden=NO;
    }
}

-(IBAction)submit:(id)sender
{
    [recorddict setValue:timepicker1.text forKey:@"Preferred Time1"];
    [recorddict setValue:timepicker2.text forKey:@"Preferred Time2"];
    [recorddict setValue:timepicker3.text forKey:@"Preferred Time3"];
    [recorddict setValue:providerpicker.text forKey:@"Provider"];
    [recorddict setValue:grouppicker.text forKey:@"group"];
    NSLog(@"complete list %@",recorddict);
      NSString * password1 = @"";
   // NSString*finaltext=@"Hi user,your password is";
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
    
    
    
   // finaltext=[finaltext stringByAppendingString:[NSString stringWithFormat:@"%@",password1]];
    
    
    
    
    NSLog(@"Start Sending");
    SKPSMTPMessage *emailMessage = [[SKPSMTPMessage alloc] init];
    emailMessage.fromEmail = @"learnguild@gmail.com";
    
    emailMessage.toEmail = [recorddict objectForKey:@"email"];//receiver email address
    emailMessage.relayHost = @"smtp.gmail.com";
    
    emailMessage.requiresAuth = YES;
    emailMessage.login = @"learnguild@gmail.com"; //sender email address
    emailMessage.pass = @"deemsys@123"; //sender email password
    emailMessage.subject =@"BCResearch App Registration";
    //[NSString stringWithFormat:@"Hi User %@",[recorddict objectForKey:@"UserName"]];
    emailMessage.wantsSecure = YES;
    emailMessage.delegate = self;
    
    
    // you must include <SKPSMTPMessageDelegate> to your class
    NSString *messageBody= [NSString stringWithFormat:@"Hi %@ \n\n welcome to BC Research App. \n\n Please find the login Credentials for your Registration.\n\n Username: %@\n\n Password:%@",[recorddict objectForKey:@"UserName"],[recorddict objectForKey:@"UserName"],password1];

        NSDictionary *plainMsg = [NSDictionary
                              dictionaryWithObjectsAndKeys:@"text/plain",kSKPSMTPPartContentTypeKey,
                              messageBody,kSKPSMTPPartMessageKey,@"8bit",kSKPSMTPPartContentTransferEncodingKey,nil];
    emailMessage.parts = [NSArray arrayWithObjects:plainMsg,nil];
    Spinner.hidden = NO;
    [Spinner startAnimating];
    ProgressBar.hidden = NO;
    HighestState = 0;

    [emailMessage send];
    
    
   
}
#pragma mark SKPSMTPMessage Delegate Methods
- (void)messageState:(SKPSMTPState)messageState;
{
    NSLog(@"HighestState:%d", HighestState);
    if (messageState > HighestState)
        HighestState = messageState;
    
    ProgressBar.progress = (float)HighestState/(float)kSKPSMTPWaitingSendSuccess;
}


-(void)messageSent:(SKPSMTPMessage *)message{
    NSLog(@"delegate - message sent");
   
     BlockAlertView *alert1 = [BlockAlertView alertWithTitle:@"Registration successful!" message:@"Password have been sent to your mail."];
    [alert1 setDestructiveButtonWithTitle:@"Ok" block:nil];
    [alert1 show];
    [Spinner stopAnimating];
    Spinner.hidden=YES;
    ProgressBar.hidden=YES;
}
// On Failure
-(void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error{
    // open an alert with just an OK button
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
    NSLog(@"delegate - error(%d): %@", [error code], [error localizedDescription]);
    [Spinner stopAnimating];
    Spinner.hidden=YES;
    ProgressBar.hidden=YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
