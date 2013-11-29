//
//  WelcomeViewController.m
//  SMSIPAD
//
//  Created by DeemSysInc on 12/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import "WelcomeViewController.h"
#import "MBProgressHUD.h"
#import "Reachability.h"
#import "MBProgressHUD.h"
#import "JSON.h"
#import "BlockAlertView.h"
@interface WelcomeViewController ()

@end

@implementation WelcomeViewController
@synthesize recorddict;
@synthesize switch1;
@synthesize resLabel1;
@synthesize eval;

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
- (IBAction) toggleEnabledTextForSwitch1onSomeLabel: (id) sender
{
    NSString*select;
	if (switch1.on)
    {
      select=@"1";
   resLabel1.text = @"On";
    }
	else
    {
        
        select=@"0";
    resLabel1.text = @"Off";
    }
    NSString *resultResponse=[self HttpPostEntityFirstmessagestream:@"patientid" ForValue1:[[NSUserDefaults standardUserDefaults] objectForKey:@"loginid"] EntitySecond:@"messagestream" ForValue2:select EntityThird:@"authkey" ForValue3:@"rzTFevN099Km39PV"];
    
    
    
    
    NSError *error;
    
    SBJSON *json = [[SBJSON new] autorelease];
    NSDictionary *luckyNumbers = [json objectWithString:resultResponse error:&error];
    
    if (luckyNumbers == nil)
    {
        ////NSLog(@"Failed");
        
    }
    else
    {
        
        NSDictionary* menu = [luckyNumbers objectForKey:@"serviceresponse"];
        //////NSLog(@"Menu id: %@", [menu objectForKey:@"success"]);
        
        if ([[menu objectForKey:@"success"] isEqualToString:@"Yes"])
        {
            
            BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Oh Snap!" message:@"Message stream updation successful."];
            
            [HUD hide:YES];
            
            [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
            [alert show];

            
        }
        else
        {
            BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Oh Snap!" message:@"Message stream updation failed."];
            
            [HUD hide:YES];
            
            [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
            [alert show];
            
        }
        
        
    }
    
    

}

-(void)sunc
{
    
    
    
    
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
	[self.navigationController.view addSubview:HUD];
    
    
	HUD.delegate = self;
	HUD.labelText = @"Loading...";
    [HUD show:YES];
    [self performSelector:@selector(sunc1) withObject:nil afterDelay:0.2 ];
}
-(IBAction)sunc1
{
    // [[UIApplication sharedApplication] cancelAllLocalNotifications];
    NSString *useridnumber = [[NSUserDefaults standardUserDefaults] objectForKey:@"loginid"];
    
    
    
    Reachability* wifiReach = [[Reachability reachabilityWithHostName: @"www.apple.com"] retain];
	NetworkStatus netStatus = [wifiReach currentReachabilityStatus];
    
	switch (netStatus)
	{
		case NotReachable:
		{
			isConnect=NO;
			NSLog(@"Access Not Available");
			break;
		}
			
		case ReachableViaWWAN:
		{
			isConnect=YES;
			NSLog(@"Reachable WWAN");
			break;
		}
		case ReachableViaWiFi:
		{
			isConnect=YES;
            NSLog(@"Reachable WiFi");
			break;
		}
	}
	
	
    
    if(isConnect)
    {
        
    }
    
    else
    {
        HUD.labelText = @"Check network connection....";
        HUD.customView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]] autorelease];
        HUD.mode = MBProgressHUDModeCustomView;
        [HUD hide:YES afterDelay:2];
        return;
    }
    
    //  NSLog(@"patid %@",useridnumber);
    
    
    NSString *resultResponse=[self HttpPostEntityFirst:@"patid" ForValue1:useridnumber  EntityThird:@"authkey" ForValue3:@"rzTFevN099Km39PV"];
    NSError *error;
    SBJSON *json = [[SBJSON new] autorelease];
    // NSLog(@"response %@",resultResponse);
	NSDictionary *luckyNumbers = [json objectWithString:resultResponse error:&error];
    NSDictionary *itemsApp = [luckyNumbers objectForKey:@"serviceresponse"];
    NSArray *items1App=[itemsApp objectForKey:@"Provider Info"];
    
    NSDictionary *arrayList1;
    // NSLog(@"items1app %@",luckyNumbers);
    for (id anUpdate1 in items1App)
    {
        NSDictionary *arrayList1=[(NSDictionary*)anUpdate1 objectForKey:@"serviceresponse"];
        
        
        temp=[arrayList1 objectForKey:@"adminusername"];
        temp1 =[arrayList1 objectForKey:@"adminfirstname"];
        temp2 =[arrayList1 objectForKey:@"adminmobile"];
        temp3 =[arrayList1 objectForKey:@"adminemail"];
        
        
        
    }
    //Fetching Weekly Evaluation details
    
     NSString *resultResponse1=[self HttpPostEntityFirstweekly:@"loginid" ForValue1:useridnumber EntityThird:@"authkey" ForValue3:@"rzTFevN099Km39PV"];
    NSError *error1;
    SBJSON *json1 = [[SBJSON new] autorelease];
    // NSLog(@"response %@",resultResponse);
	NSDictionary *luckyNumbers1 = [json1 objectWithString:resultResponse1 error:&error1];
    NSDictionary *itemsApp1 = [luckyNumbers1 objectForKey:@"serviceresponse"];
    NSArray *items1App1=[itemsApp1 objectForKey:@"Weekly_logs List"];
    week1=[[NSMutableArray alloc]init];
    week2=[[NSMutableArray alloc]init];
    week3=[[NSMutableArray alloc]init];
    week4=[[NSMutableArray alloc]init];
    week5=[[NSMutableArray alloc]init];
      week6=[[NSMutableArray alloc]init];
    NSDictionary *arrayList2;
    // NSLog(@"items1app %@",luckyNumbers);
    for (id anUpdate1 in items1App1)
    {
        NSDictionary *arrayList2=[(NSDictionary*)anUpdate1 objectForKey:@"serviceresponse"];
        [week1 addObject:[arrayList2 objectForKey:@"log_id"]];
        [week2 addObject:[arrayList2 objectForKey:@"week"]];
        [week3 addObject:[arrayList2 objectForKey:@"date_time"]];
        [week4 addObject:[arrayList2 objectForKey:@"continuous"]];
        [week5 addObject:[arrayList2 objectForKey:@"count"]];
        [week6 addObject:[arrayList2 objectForKey:@"status"]];
        
        
    }
    weekcount=0;
    for (int i=0; i<[week6 count ]; i++)
    {
        if([[week6 objectAtIndex:i] isEqual:@"0"])
        {
            weekcount++;
        }
    }
    if(weekcount==0)
    {
        eval.hidden=YES;
        weekremaining.text=[NSString stringWithFormat:@"You have completed all your weekly evaluations"];
    }
    else
    {
        eval.hidden=NO;
        weekremaining.text=[NSString stringWithFormat:@"You have %d evaluations thats overdue",weekcount];
    }

 
  //  NSLog(@"logid %@",week1);
   // NSLog(@"week %@",week2);
   // NSLog(@"date_time %@",week3);
   // NSLog(@"continuous %@",week4);
   // NSLog(@"count %@",week5);
   // NSLog(@"status %@",week6);
 //    NSLog(@"temp value %@",temp);
  //  NSLog(@"temp1 value %@",temp1);
   //NSLog(@"temp2 value %@",temp2);
    // NSLog(@"temp3 value %@",temp3);
    [[NSUserDefaults standardUserDefaults]setObject:temp forKey:@"Providerusername"];
    [[NSUserDefaults standardUserDefaults]setObject:temp1 forKey:@"Providerfirstname"];
    [[NSUserDefaults standardUserDefaults]setObject:temp2 forKey:@"Providermobile"];
    [[NSUserDefaults standardUserDefaults]setObject:temp3 forKey:@"Provideremail"];
    HUD.labelText = @"Completed.";
    HUD.customView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]] autorelease];
	HUD.mode = MBProgressHUDModeCustomView;
    [HUD hide:YES afterDelay:0];
    
    
}
-(NSString *)HttpPostEntityFirst:(NSString*)firstEntity ForValue1:(NSString*)value1  EntityThird:(NSString*)thirdEntity ForValue3:(NSString*)value3
{
    
    
    HUD.labelText = @"Feteching Providerdetail...";
    
    NSString *post =[[NSString alloc] initWithFormat:@"%@=%@&%@=%@",firstEntity,value1,thirdEntity,value3];
    NSURL *url=[NSURL URLWithString:@"http://localhost:8888/bcreasearch/Service/genericSelect.php?service=providerSelect"];
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
    //  NSLog(@" post %@ ",post);
    
    // NSLog(@"%@ ",data);
    
    return data;
    
}
-(NSString *)HttpPostEntityFirstweekly:(NSString*)firstEntity ForValue1:(NSString*)value1  EntityThird:(NSString*)thirdEntity ForValue3:(NSString*)value3
{
    
    
    HUD.labelText = @"Feteching Weekly evaluation...";
    
    NSString *post =[[NSString alloc] initWithFormat:@"%@=%@&%@=%@",firstEntity,value1,thirdEntity,value3];
    NSURL *url=[NSURL URLWithString:@"http://localhost:8888/bcreasearch/Service/genericSelect.php?service=weeklyevaluationSelect"];
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
    
 NSLog(@"%@ ",data);
    
    return data;
    
}

-(NSString *)HttpPostEntityFirstmessagestream:(NSString*)firstEntity ForValue1:(NSString*)value1 EntitySecond:(NSString*)secondEntity ForValue2:(NSString*)value2 EntityThird:(NSString*)thirdEntity ForValue3:(NSString*)value3
{
    
    
    HUD.labelText = @"Feteching Messagestream...";
    
    NSString *post =[[NSString alloc] initWithFormat:@"%@=%@&%@=%@&%@=%@",firstEntity,value1,secondEntity,value2,thirdEntity,value3];
    NSURL *url=[NSURL URLWithString:@"http://localhost:8888/bcreasearch/Service/genericUpdate.php?service=messageStreamUpdate"];
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
    // NSLog(@" post %@ ",post);
    
   // NSLog(@"%@ ",data);
    
    return data;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *mes=[[NSUserDefaults standardUserDefaults]objectForKey:@"messagestream"];
    if ([mes isEqual:@"0"]) {
        [switch1 setOn:NO];
        resLabel1.text=@"Off";
    }
    else
    {
        [switch1 setOn:YES];
        resLabel1.text=@"On";
    }
    welcome.text=[NSString stringWithFormat:@"Welcome %@ !",[[NSUserDefaults standardUserDefaults] objectForKey:@"username"]];
    UIButton *home = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *homeImage = [UIImage imageNamed:@" "]  ;
    [home setBackgroundImage:homeImage forState:UIControlStateNormal];
    [home addTarget:self action:@selector(back)
   forControlEvents:UIControlEventTouchUpInside];
    home.frame = CGRectMake(0, 0, 50, 30);
    UIBarButtonItem *cancelButton = [[[UIBarButtonItem alloc]
                                      initWithCustomView:home] autorelease];
    self.navigationItem.leftBarButtonItem = cancelButton;
    [self sunc];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
