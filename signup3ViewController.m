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
#import "Reachability.h"
#import "MBProgressHUD.h"
#import "JSON.h"
#import "signup2ViewController.h"
#import "signupViewController.h"

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
    groupidlist=[recorddict objectForKey:@"Groupid"];
    // NSMutableArray *names=[recorddict objectForKey:@"Providersname"];
    
    timearray=[[NSMutableArray alloc] initWithObjects:@"0-1", @"1-2", @"2-3", @"3-4", @"4-5",@"5-6",@"6-7",@"7-8",@"8-9",@"9-10",@"10-11",@"11-12",@"12-13",@"13-14",@"14-15",@"15-16",@"16-17",@"18-19",@"19-20",@"20-21",@"21-22",@"22-23",@"23-0", nil];
    providerpicker.text=@"Select provider";
    providerarray=[recorddict objectForKey:@"Providersname"];
    groupfinal=[[NSMutableArray alloc]init];
    grouppicker.text=@"Select group";
    grouparray=[recorddict objectForKey:@"Groupname"];
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
    {
        providerpicker.text=[providerarray  objectAtIndex:row];
        [self collectgroup:providerpicker.text];
        
    }
    else if(pickerView.tag==5)
    {
        grouppicker.text= [grouparray objectAtIndex:row];
        // selectedgroupid=[groupidlist objectAtIndex:row];
    }
    else if(pickerView.tag==3)
        timepicker3.text= [timearray objectAtIndex:row];
    else
        timepicker3.text= [timearray objectAtIndex:row];
    pickerView.hidden=YES;
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
        grouppicker.text=@"Select group";
        providerpick.hidden=NO;
    }
}
-(IBAction)changegroup:(id)sender
{
    if(grouppick.hidden==YES)
    {
        grouppick.hidden=NO;
    }
    [grouppick reloadAllComponents];
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[CYCustomMultiSelectPickerView class]]) {
            [view removeFromSuperview];
        }
    }
    
    multiPickerView = [[CYCustomMultiSelectPickerView alloc] initWithFrame:CGRectMake(0,[UIScreen mainScreen].bounds.size.height - 260-20, 320, 260+44)];
    
    //  multiPickerView.backgroundColor = [UIColor redColor];
    multiPickerView.entriesArray = entries;
    multiPickerView.entriesSelectedArray = entriesSelected;
    multiPickerView.multiPickerDelegate = self;
    
    [self.view addSubview:multiPickerView];
    
    [multiPickerView pickerShow];
    
}
-(void)returnChoosedPickerString:(NSMutableArray *)selectedEntriesArr
{
    NSLog(@"selectedArray=%@",selectedEntriesArr);
    
    NSString *dataStr = [selectedEntriesArr componentsJoinedByString:@","];
    selectedgroupid=[[NSMutableArray alloc]init];
    showLbl.text = dataStr;
    
    entriesSelected = [[NSArray arrayWithArray:selectedEntriesArr] retain];
    if([selectedEntriesArr count]<=4)
    {
        grouppicker.text=dataStr;
    for (int i=0; i<[selectedEntriesArr count]; i++)
    {
        int indexValue = [grouparray indexOfObject:[selectedEntriesArr objectAtIndex:i]];
        //NSLog(@"%d %@ %lu",indexValue,[selectedEntriesArr objectAtIndex:i],(unsigned long)[grouparray indexOfObject:[selectedEntriesArr objectAtIndex:i]]);
        [selectedgroupid addObject:[groupidlist objectAtIndex:indexValue]];
    }
        
    // NSLog(@"index %d",indexValue);
    // NSLog(@"selectedgroupid %@",selectedgroupid);
    [recorddict setObject:selectedEntriesArr forKey:@"selectedgroups"];
    [recorddict setObject:selectedgroupid forKey:@"selectedgroupsid"];
    
    }
    else
    {
        BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Oh snap!" message:@"Please select maximum 4 groups."];
        
        //  [alert setCancelButtonWithTitle:@"Cancel" block:nil];
        [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
        [alert show];
    }
    
}

-(IBAction)submit:(id)sender
{
    if(![providerpicker.text isEqualToString:@"Select provider"]&&![grouppicker.text isEqualToString:@"Select group"])
    {
        [recorddict setValue:timepicker1.text forKey:@"Preferred Time1"];
        [recorddict setValue:timepicker2.text forKey:@"Preferred Time2"];
        [recorddict setValue:timepicker3.text forKey:@"Preferred Time3"];
        [recorddict setValue:providerpicker.text forKey:@"Provider"];
        // [recorddict setValue:grouppicker.text forKey:@"group"];
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
        // NSLog(@"%@ password",password1);
        [recorddict setValue:password1 forKey:@"pass"];
        
        HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
        [self.navigationController.view addSubview:HUD];
        HUD.delegate = self;
        HUD.labelText = @"Registering....";
        [HUD show:YES];
        [self performSelector:@selector(signUpMethod)withObject:nil afterDelay:0.2 ];
        
    }
    
    else
    {
        BlockAlertView *alert1 = [BlockAlertView alertWithTitle:@"Oh snap!" message:@"Select Provider and group detail."];
        [alert1 setDestructiveButtonWithTitle:@"Ok" block:nil];
        [alert1 show];
    }
    
    
}
#pragma mark SKPSMTPMessage Delegate Methods
- (void)messageState:(SKPSMTPState)messageState;
{
    // NSLog(@"HighestState:%d", HighestState);
    if (messageState > HighestState)
        HighestState = messageState;
    
    ProgressBar.progress = (float)HighestState/(float)kSKPSMTPWaitingSendSuccess;
    
    
    //insert into database
    
    
}


-(void)messageSent:(SKPSMTPMessage *)message{
    // NSLog(@"delegate - message sent");
    
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
    // NSLog(@"delegate - error(%d): %@", [error code], [error localizedDescription]);
    [Spinner stopAnimating];
    Spinner.hidden=YES;
    ProgressBar.hidden=YES;
}

-(void)signUpMethod
{
    NSString*email=[recorddict objectForKey:@"email"];
    NSString *username1=[recorddict objectForKey:@"UserName"];
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
    
    
    
    //for username
    NSString *resultResponse=[self HttpPostEntityFirst:@"email" ForValue1:email EntitySecond:@"authkey" ForValue2:@"rzTFevN099Km39PV"];
    
    //  NSLog(@"********%@",resultResponse);
    //   NSLog(@"REGISTRATION");
    
    NSError *error;
    
    SBJSON *json = [[SBJSON new] autorelease];
    NSDictionary *luckyNumbers = [json objectWithString:resultResponse error:&error];
    
    //NSLog(@"%@ lucky numbers",luckyNumbers);
    if (luckyNumbers == nil)
    {
        
        //NSLog(@"luckyNumbers == nil");
        
    }
    else
    {
        
        NSDictionary* menu = [luckyNumbers objectForKey:@"serviceresponse"];
        // NSLog(@"Menu id: %@", [menu objectForKey:@"servicename"]);
        
        
        
        if ([[menu objectForKey:@"servicename"] isEqualToString:@"Signup"])
        {
            if ([[menu objectForKey:@"success"] isEqualToString:@"Yes"])
            {
                
                
                
                // NSLog(@"Start Sending");
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
                
                [recorddict objectForKey:@"pass"];
                
                // you must include <SKPSMTPMessageDelegate> to your class
                NSString *messageBody= [NSString stringWithFormat:@"Hi %@ \n\n welcome to BC Research App. \n\n Please find the login Credentials for your Registration.\n\n Username: %@\n\n Password:%@",[recorddict objectForKey:@"UserName"],[recorddict objectForKey:@"UserName"],
                                        [recorddict objectForKey:@"pass"]];
                
                NSDictionary *plainMsg = [NSDictionary
                                          dictionaryWithObjectsAndKeys:@"text/plain",kSKPSMTPPartContentTypeKey,
                                          messageBody,kSKPSMTPPartMessageKey,@"8bit",kSKPSMTPPartContentTransferEncodingKey,nil];
                emailMessage.parts = [NSArray arrayWithObjects:plainMsg,nil];
                Spinner.hidden = NO;
                [Spinner startAnimating];
                ProgressBar.hidden = NO;
                HighestState = 0;
                
                [emailMessage send];
                
                HUD.labelText = @"Completed.";
                HUD.customView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]] autorelease];
                HUD.mode = MBProgressHUDModeCustomView;
                [HUD hide:YES afterDelay:0];
                
                //NSLog(@"success");
                
                BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Info!" message:@"Registration successful!"];
                
                
                [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
                [alert show];
                
                
                
            }
            else if ([[menu objectForKey:@"success"] isEqualToString:@"No"])
            {
                BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Info!" message:@"Registration failed!"];
                
                
                [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
                [alert show];
                
            }
            else
            {
                
                if ([[menu objectForKey:@"message"] isEqualToString:@"Already Exist"])
                {
                    
                    
                    
                    BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Oh Snap!" message:@"Emailid Already Exits and active."];
                    
                    //  [alert setCancelButtonWithTitle:@"Cancel" block:nil];
                    [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
                    [alert show];
                    
                    [HUD hide:YES];
                    return;
                }
                
                
            }
        }
        else if ([[menu objectForKey:@"emaill"]  isEqualToString:@""])
        {
            // NSLog(@"fail");
            
            BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Failed!" message:@"Registration Failed."];
            
            
            [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
            [alert show];
            
        }
        else
        {
            
            
            BlockAlertView *alert = [BlockAlertView alertWithTitle:@"password!" message:@"Incorrect Password."];
            
            //  [alert setCancelButtonWithTitle:@"Cancel" block:nil];
            [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
            [alert show];
            
            
            
        }
        
        
        [HUD hide:YES];
        
    }
}

-(NSString *)HttpPostEntityFirst:(NSString*)firstEntity ForValue1:(NSString*)value1 EntitySecond:(NSString*)secondEntity ForValue2:(NSString*)value2
{
    
    NSArray *arrayWithIDs=[recorddict objectForKey:@"selectedgroups"];
    NSArray *arrayWithIDvalues=[recorddict objectForKey:@"selectedgroupsid"];
    NSString *postVarArrayString = @"";
    NSString *postVarArrayStringid = @"";
    int j=[arrayWithIDs count];
    //NSString *separator= @"&";;
    for (int i=0; i<[arrayWithIDs count]; i++) {
        postVarArrayString = [NSString stringWithFormat:@"%@%@", postVarArrayString, [arrayWithIDs objectAtIndex:i] ];
        postVarArrayStringid = [NSString stringWithFormat:@"%@%d", postVarArrayStringid, [[arrayWithIDvalues objectAtIndex:i] integerValue]];
        if(i==j-1)
        {
            postVarArrayString = [NSString stringWithFormat:@"%@", postVarArrayString];
            postVarArrayStringid =  [NSString stringWithFormat:@"%@", postVarArrayStringid];
        }
        else
        {
            postVarArrayString = [NSString stringWithFormat:@"%@-", postVarArrayString];
            postVarArrayStringid =  [NSString stringWithFormat:@"%@-", postVarArrayStringid];
        }
        
        
    }
    
    
    //NSLog(@"HTTP");
    NSString*groupname=grouppicker.text;
    NSString*fname= [recorddict objectForKey:@"FirstName"];
    NSString *username1=[recorddict objectForKey:@"UserName"];
    NSString*mobnum=[recorddict objectForKey:@"Mobilenum"];
    NSString*gend=[recorddict objectForKey:@"Gender"];
    NSString*age=[recorddict objectForKey:@"Age"];
    NSString*city=[recorddict objectForKey:@"City"];
    NSString*edu=[recorddict objectForKey:@"Education"];
    NSString *meddet=[recorddict objectForKey:@"Medicaldetails"];
    NSString*pt1=[recorddict objectForKey:@"Preferred Time1"];
    NSString*pt2=[recorddict objectForKey:@"Preferred Time2"];
    NSString*pt3=[recorddict objectForKey:@"Preferred Time3"];
    NSString*prov=[recorddict objectForKey:@"Provider"];
    // NSString*group=[recorddict objectForKey:@"group"];
    NSString*password1=[recorddict objectForKey:@"pass"];
    NSLog(@"%@ group",postVarArrayString);
    NSLog(@"%@ groupid",postVarArrayStringid);
    
    NSString *post =[[NSString alloc] initWithFormat:@"%@=%@&fname=%@&mobile_num=%@&gender=%@&city=%@&education=%@&medical_details=%@&time1=%@&time2=%@&time3=%@&Provider_name=%@&group_name=%@&age=%@&username1=%@&pass=%@&groupid=%@&groupname=%@&%@=%@",firstEntity,value1,fname,mobnum,gend,city,edu,meddet,pt1,pt2,pt3,prov,postVarArrayString,age,username1,password1,postVarArrayStringid,groupname,secondEntity,value2];
    
    NSURL *url=[NSURL URLWithString:@"http://localhost:8888/bcreasearch/Service/participantregister.php?service=partinsert"];
    
    
    
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
-(void)collectgroup:(NSString*)providername
{
    groupfinal=[[NSMutableArray alloc]init];
    NSArray*groupname=[recorddict objectForKey:@"Groupname"];
    NSArray*createdby=[recorddict objectForKey:@"Createdby"];
    for (int i=0;i<[createdby count];i++)
    {
        // NSLog(@"vales createdby %@",[createdby objectAtIndex:i]);
        //  NSLog(@"vales providernaem %@",providername);
        // NSLog(@"vales createdby %@",[groupname objectAtIndex:i]);
        if([[createdby objectAtIndex:i]isEqualToString:providername])
        {
            [groupfinal addObject:[groupname objectAtIndex:i]];
        }
        
    }
    entries = groupfinal;
    
    entriesSelected = [[NSArray alloc] init];
    
    
	selectionStates = [[NSMutableDictionary alloc] init];
    
  	for (NSString *key in entries){
        BOOL isSelected = NO;
        for (NSString *keyed in entriesSelected) {
            if ([key isEqualToString:keyed]) {
                isSelected = YES;
            }
        }
        [selectionStates setObject:[NSNumber numberWithBool:isSelected] forKey:key];
    }
    
    // NSLog(@"vales in f*n call %@",groupfinal);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
