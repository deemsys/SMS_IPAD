//
//  participantprofile.m
//  Breast Cancer
//
//  Created by DeemSysInc on 21/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import "participantprofile.h"
#import "BlockAlertView.h"
#import "editprofile.h"

@interface participantprofile ()

@end

@implementation participantprofile
@synthesize recorddict;
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
    recorddict=[[NSMutableDictionary alloc]init];
    NSString*userid=[[NSUserDefaults standardUserDefaults]objectForKey:@"loginid"];
    // NSString*userid=@"56";
    [self getparticipantdetail:userid];
    
    
    firstname.text=firstname1;
    username.text=username1;
    mobilenumber.text=mobile1;
    emailid.text=email1;
    
    city.text=city1;
    education.text=education1;
    medical.text=medical1;
    time1.text=time11;
    time2.text=time21;
    time3.text=time31;
    provider.text=provider1;
    age.text=age1;
    NSLog(@"age %@",age.text);
    [recorddict setValue:firstname1 forKey:@"firstname"];
    [recorddict setValue:username1 forKey:@"username"];
    [recorddict setValue:mobile1 forKey:@"mobile"];
    [recorddict setValue:email1 forKey:@"email"];
    [recorddict setValue:city1 forKey:@"city"];
    [recorddict setValue:education1 forKey:@"education"];
    [recorddict setValue:medical1 forKey:@"medical"];
    [recorddict setValue:time11 forKey:@"time11"];
    [recorddict setValue:time21 forKey:@"time21"];
    [recorddict setValue:time31 forKey:@"time31"];
    [recorddict setValue:provider1 forKey:@"provider"];
    [recorddict setValue:age1 forKey:@"age"];
    [recorddict setValue:group1 forKey:@"group"];
    
    
    
    
    if([gender1 isEqualToString:@"0"])
    {
        gender.text=@"Male";
        
    }
    else
        gender.text=@"Female";
    
    [recorddict setValue:gender.text forKey:@"gender"];
    
    // Generate content for our scroll view using the frame height and width as the reference point
    
}
-(void)getparticipantdetail:(NSString*)userid
{
    
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
	[self.navigationController.view addSubview:HUD];
    
    
	HUD.delegate = self;
	HUD.labelText = @"Loading...";
    [HUD show:YES];
    
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
    NSString *resultResponse=[self HttpPostEntityFirst:@"loginid" ForValue1:userid  EntityThird:@"authkey" ForValue3:@"rzTFevN099Km39PV"];
    NSError *error;
    SBJSON *json = [[SBJSON new] autorelease];
    // NSLog(@"response %@",resultResponse);
	NSDictionary *luckyNumbers = [json objectWithString:resultResponse error:&error];
    NSDictionary *itemsApp = [luckyNumbers objectForKey:@"serviceresponse"];
    NSArray *items1App=[itemsApp objectForKey:@"Patient info"];
    
    NSDictionary *arrayList1;
    if ([[itemsApp objectForKey:@"success"] isEqualToString:@"Yes"])
    {
        for (id anUpdate1 in items1App)
        {
            NSDictionary *arrayList1=[(NSDictionary*)anUpdate1 objectForKey:@"serviceresponse"];
            
            firstname1=[arrayList1 objectForKey:@"firstname"];
            username1 =[arrayList1 objectForKey:@"username"];
            mobile1 =[arrayList1 objectForKey:@"mobilenum"];
            email1 =[arrayList1 objectForKey:@"email"];
            gender1 =[arrayList1 objectForKey:@"gender"];
            city1 =[arrayList1 objectForKey:@"city"];
            education1=[arrayList1 objectForKey:@"education"];
            medical1 =[arrayList1 objectForKey:@"medical"];
            time11 =[arrayList1 objectForKey:@"time1"];
            time21 =[arrayList1 objectForKey:@"time2"];
            time31 =[arrayList1 objectForKey:@"time3"];
            provider1 =[arrayList1 objectForKey:@"providername"];
            group1 =[arrayList1 objectForKey:@"group"];
            age1 =[arrayList1 objectForKey:@"age"];
            
            HUD.labelText = @"Completed.";
            HUD.customView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]] autorelease];
            HUD.mode = MBProgressHUDModeCustomView;
            [HUD hide:YES afterDelay:0];
            
        }
        
    }
    else
    {
        BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Oh snap!" message:@"userid not found."];
        [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
        [alert show];
        
    }
    NSString *resultResponsegroup=[self HttpPostEntityFirstgroup:@"providername" ForValue1:provider1  EntityThird:@"authkey" ForValue3:@"rzTFevN099Km39PV"];
    NSError *error1;
    SBJSON *json1 = [[SBJSON new] autorelease];
    // NSLog(@"response %@",resultResponse);
	NSDictionary *luckyNumbers1 = [json1 objectWithString:resultResponsegroup error:&error1];
    NSDictionary *itemsApp1 = [luckyNumbers1 objectForKey:@"serviceresponse"];
    NSArray *items1App1=[itemsApp1 objectForKey:@"Group List"];
    groupname=[[NSMutableArray alloc]init];
    createdby=[[NSMutableArray alloc]init];
    groupid=[[NSMutableArray alloc]init];
     groupdes=[[NSMutableArray alloc]init];
    NSDictionary *arrayList2;
    if ([[itemsApp1 objectForKey:@"success"] isEqualToString:@"Yes"])
    {

        for (id anUpdate1 in items1App1)
        {
            NSDictionary *arrayList2=[(NSDictionary*)anUpdate1 objectForKey:@"serviceresponse"];
            
            [groupname addObject:[arrayList2 objectForKey:@"groupname"]];
            [createdby addObject:[arrayList2 objectForKey:@"createdby"]];
            [groupid addObject:[arrayList2 objectForKey:@"groupid"]];
            
        }
       
    }
    else
    {
        BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Oh snap!" message:@"Provider value is empty."];
        [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
        [alert show];
    }
     [recorddict setObject:groupid forKey:@"groupid"];
    [recorddict setObject:groupname forKey:@"Grouplist"];
      //  NSLog(@"items1app %@",luckyNumbers);
    NSLog(@"group name %@",groupname);
    NSLog(@"group id %@",groupid);
  NSLog(@" created by%@",createdby);
    
}

-(NSString *)HttpPostEntityFirst:(NSString*)firstEntity ForValue1:(NSString*)value1  EntityThird:(NSString*)thirdEntity ForValue3:(NSString*)value3
{
    
    
    HUD.labelText = @"Fetching Userdetail..";
    
    NSString *post =[[NSString alloc] initWithFormat:@"%@=%@&%@=%@",firstEntity,value1,thirdEntity,value3];
    NSURL *url=[NSURL URLWithString:@"http://localhost:8888/bcreasearch/Service/genericSelect.php?service=participantSelect"];
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
    //   NSLog(@" post %@ ",post);
    
     NSLog(@"%@ ",data);
    
    return data;
    
}
-(NSString *)HttpPostEntityFirstgroup:(NSString*)firstEntity ForValue1:(NSString*)value1  EntityThird:(NSString*)thirdEntity ForValue3:(NSString*)value3
{
    
    
    HUD.labelText = @"Fetching groupdetail..";
    
    NSString *post =[[NSString alloc] initWithFormat:@"%@=%@&%@=%@",firstEntity,value1,thirdEntity,value3];
    NSURL *url=[NSURL URLWithString:@"http://localhost:8888/bcreasearch/Service/genericSelect.php?service=getGroups"];
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
   //NSLog(@" post %@ ",post);
    
  // NSLog(@"%@ ",data);
    
    return data;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([segue.identifier isEqualToString:@"viewtoedit"])
    {
        
        
        editprofile *destViewController = [segue destinationViewController];
        destViewController.recorddict=recorddict;
        NSLog(@"recorddict in Participant Profile %@",recorddict);
        // destViewController.delegate=self;
        
    }
    
    
    
}

- (void)dealloc {
    [group release];
    [super dealloc];
}
@end
