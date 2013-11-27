//
//  editprofile.m
//  Breast Cancer
//
//  Created by DeemSysInc on 21/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import "editprofile.h"
#import "BlockAlertView.h"
#import "Reachability.h"
#import "MBProgressHUD.h"
#import "JSON.h"
#import "MBProgressHUD.h"
@interface editprofile ()

@end

@implementation editprofile
@synthesize recorddict;
@synthesize timepick1;
@synthesize timepick2;
@synthesize timepick3;
@synthesize timearray;
@synthesize grouppick;
@synthesize grouppicker;
@synthesize grouparray;
@synthesize time1;
@synthesize time2;
@synthesize time3;
@synthesize ageArray;
@synthesize agepick;
@synthesize agepicker;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)pickerViewTappedage
{
    agepick.hidden=YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    timepick1.hidden=YES;
    timepick2.hidden=YES;
    timepick3.hidden=YES;
     grouppick.hidden=YES;
    agepick.delegate = self;
    agepick.dataSource = self;
    
    agepick.hidden=YES;

    fname.text=[recorddict objectForKey:@"firstname"];
	age.text=[recorddict objectForKey:@"age"];
    city.text=[recorddict objectForKey:@"city"];
    education.text=[recorddict objectForKey:@"education"];
    email.text=[recorddict objectForKey:@"email"];
    medical.text=[recorddict objectForKey:@"medical"];
    mobile.text=[recorddict objectForKey:@"mobile"];
    provider.text=[recorddict objectForKey:@"provider"];
    time1.text=[recorddict objectForKey:@"time11"];
    time2.text=[recorddict objectForKey:@"time21"];
    time3.text=[recorddict objectForKey:@"time31"];
    username.text=[recorddict objectForKey:@"username"];
    gender.text=[recorddict objectForKey:@"gender"];
    ageArray = [[NSArray alloc] initWithObjects:@"Below 12", @"12-20", @"21-30", @"31-40", @"41-50",@"51-60",@"61-70",@"71-80",@"81-90",@"91-100", nil];
    
        timearray=[[NSMutableArray alloc] initWithObjects:@"0-1", @"1-2", @"2-3", @"3-4", @"4-5",@"5-6",@"6-7",@"7-8",@"8-9",@"9-10",@"10-11",@"11-12",@"12-13",@"13-14",@"14-15",@"15-16",@"16-17",@"18-19",@"19-20",@"20-21",@"21-22",@"22-23",@"23-0", nil];
    grouppicker.text=[recorddict objectForKey:@"group"];
   // NSString *ss=grouppicker.text;
    groupfinal=[recorddict objectForKey:@"groupid"];
    grouparray=[recorddict objectForKey:@"Grouplist"];
   int indexValue = [grouparray indexOfObject:[NSString stringWithFormat:@"%@",grouppicker.text]];
   // NSLog(@"index %d",indexValue);
   // NSLog(@"text %@",grouppicker.text);
    selectedgroupid=[groupfinal objectAtIndex:indexValue];
   // NSLog(@"selexted id %@",selectedgroupid);
    selectgroupidold=selectedgroupid;
    
    UITapGestureRecognizer *tapGRage = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pickerViewTappedage)];
    [agepick addGestureRecognizer:tapGRage];
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
        
        return [ageArray count];
    

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
    
    
    else if(pickerView.tag==5)
        return [grouparray objectAtIndex:row];
    else if (pickerView.tag==4)
        return [ageArray objectAtIndex:row];

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
    if (grouppick.hidden==NO) {
        grouppick.hidden=YES;
    }
    if(agepick.hidden==NO)
    {
        agepick.hidden=YES;
    }
    
}

//If the user chooses from the pickerview, it calls this function;
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(pickerView.tag==1)
        
        time1.text=[timearray objectAtIndex:row];
    
    else if(pickerView.tag==2)
        
        time2.text=[timearray  objectAtIndex:row];
        else if(pickerView.tag==5)
    {
        grouppicker.text= [grouparray objectAtIndex:row];
       selectedgroupid=[groupfinal objectAtIndex:row];
    }
    else if(pickerView.tag==3)
        time3.text= [timearray objectAtIndex:row];
    else if(pickerView.tag==4)
         agepicker.text=[ageArray objectAtIndex:row];
    else
        time3.text= [timearray objectAtIndex:row];
    pickerView.hidden=YES;
    //Let's print in the console what the user had chosen;
    // NSLog(@"Chosen item: %@", [itemsArray objectAtIndex:row]);
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

-(IBAction)changegroup:(id)sender
{
    if(grouppick.hidden==YES)
    {
        grouppick.hidden=NO;
    }
    [grouppick reloadAllComponents];
}

-(IBAction)changeage:(id)sender
{
    if(agepick.hidden==YES)
    {
        agepick.hidden=NO;
    }
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

- (IBAction)submit:(id)sender
{
    if(([fname.text length]!=0)&&([mobile.text length]!=0)&&([username.text length]!=0)&&([email.text length]!=0))
    {
       
            if ([self alphabeticvalidation:fname.text]==1)
            {
                if ([self alphanumericvalidation:username.text]==1)
                {
                    if ([self validateMobile:mobile.text]==1)
                    {
                        if ([self validateEmail:email.text]==1)
                        {
                          
                            [recorddict setValue:fname.text forKey:@"FirstName"];
                            [recorddict setValue:username.text forKey:@"UserName"];
                            [recorddict setValue:mobile.text forKey:@"Mobilenum"];
                            [recorddict setValue:email.text forKey:@"email"];
                            [recorddict setValue:age.text forKey:@"age"];
                            [recorddict setValue:city.text forKey:@"city"];
                            [recorddict setValue:education.text forKey:@"education"];
                            [recorddict setValue:medical.text forKey:@"medical"];
                           [recorddict setObject:selectedgroupid forKey:@"Groupid"];
                            [recorddict setValue:time1.text forKey:@"Preferred Time1"];
                            [recorddict setValue:time2.text forKey:@"Preferred Time2"];
                            [recorddict setValue:time3.text forKey:@"Preferred Time3"];
                            [recorddict setValue:provider.text forKey:@"Provider"];
                            [recorddict setValue:grouppicker.text forKey:@"group"];
                            NSLog(@"complete patient list %@",recorddict);

                        
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

    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];
    HUD.delegate = self;
    HUD.labelText = @"Updating....";
    [HUD show:YES];
    [self performSelector:@selector(signUpMethod)withObject:nil afterDelay:0.2 ];
}
-(void)signUpMethod
{
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
    
    
    NSString*loginid=[[NSUserDefaults standardUserDefaults]objectForKey:@"loginid"];
    NSLog(@"userid %@",loginid);
    NSString *resultResponse=[self HttpPostEntityFirst:@"loginid" ForValue1:loginid EntitySecond:@"authkey" ForValue2:@"rzTFevN099Km39PV"];
    
    //  NSLog(@"********%@",resultResponse);
    //   NSLog(@"REGISTRATION");
    
    NSError *error;
    
    SBJSON *json = [[SBJSON new] autorelease];
    NSDictionary *luckyNumbers = [json objectWithString:resultResponse error:&error];
     NSDictionary* menu = [luckyNumbers objectForKey:@"serviceresponse"];
    //NSLog(@"%@ lucky numbers",luckyNumbers);
    if (luckyNumbers == nil)
    {
        
        //NSLog(@"luckyNumbers == nil");
        
    }
    else
    {
        
       
        
        
            if ([[menu objectForKey:@"success"] isEqualToString:@"Yes"])
            {
                
                
                
                // NSLog(@"Start Sending");
                HUD.labelText = @"Completed.";
                HUD.customView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]] autorelease];
                HUD.mode = MBProgressHUDModeCustomView;
                [HUD hide:YES afterDelay:0];
                
                //NSLog(@"success");
                
                BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Info!" message:@"successfully updated!"];
                
                
                [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
                [alert show];
                
                
                
            }
            else if ([[menu objectForKey:@"success"] isEqualToString:@"No"]&&[[menu objectForKey:@"message"] isEqualToString:@"Already Exist"])
            {
               // NSLog(@"Start Sending in email exist");
                BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Info!" message:@"Emailid already exist!"];
                
                
                [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
                [alert show];
                
            }
            else
            {
               // NSLog(@"else Start Sending");
                BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Info!" message:@"Updation Failed!"];
                
                
                [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
                [alert show];
            }
            
        
     
        
        
        [HUD hide:YES];
    }
    
}

-(NSString *)HttpPostEntityFirst:(NSString*)firstEntity ForValue1:(NSString*)value1 EntitySecond:(NSString*)secondEntity ForValue2:(NSString*)value2
{
    
    // NSString *authKey=@"rzTFevN099Km39PV";
    // NSString *userId=@"alagar@ajsquare.net";
    
    
    //NSLog(@"HTTP");
    NSString*firstname=fname.text;
    NSString *username1=username.text;
    NSString*mobnum=mobile.text;
    NSString*gend;
    NSString *emailid=email.text;
    NSString *oldemail=[recorddict objectForKey:@"email"];
    NSString*age1=agepicker.text;
    NSString*city1=city.text;
    NSString*edu=education.text;
    NSString *meddet=medical.text;
    NSString*pt1=time1.text;
    NSString*pt2=time2.text;
    NSString*pt3=time3.text;
    NSString*prov=provider.text;
    NSString*group=grouppicker.text;
    if([gender.text isEqualToString:@"Female"]||[gender.text isEqualToString:@"female"])
    {
        gend=@"1";
    }
    else
    {
        gend=@"0";
    }
  // NSLog(@"%@ selected groupid",selectedgroupid);
    
    NSString *post =[[NSString alloc] initWithFormat:@"%@=%@&fname=%@&mobile_num=%@&gender=%@&city=%@&education=%@&medical_details=%@&time1=%@&time2=%@&time3=%@&Provider_name=%@&group_name=%@&age=%@&username1=%@&groupid=%@&email=%@&oldemailid=%@&%@=%@",firstEntity,value1,firstname,mobnum,gend,city1,edu,meddet,pt1,pt2,pt3,prov,group,age1,username1,selectedgroupid,emailid,oldemail,secondEntity,value2];
    
  NSLog(@"post %@",post);
    
    NSURL *url=[NSURL URLWithString:@"http://localhost:8888/bcreasearch/Service/genericUpdate.php?service=patientupdate"];
    
    
    
    // NSLog(@"%@",post);
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
   // NSLog(@"postlenth%@",postLength);
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
    
    NSLog(@"%@",data);
    
    
    
    
    
    
    return data;
    
}

@end
