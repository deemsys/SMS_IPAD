//
//  participantprofile.m
//  Breast Cancer
//
//  Created by DeemSysInc on 21/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import "participantprofile.h"
#import "BlockAlertView.h"

@interface participantprofile ()

@end

@implementation participantprofile

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
   NSString*userid=[[NSUserDefaults standardUserDefaults]
                     objectForKey:@"loginid"];
    [self getparticipantdetail:userid];
    
    
    firstname.text=firstname1;
    username.text=username1;
    provider.text=providername1;
    mobilenumber.text=mobile1;
    
    
    
    
    
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
    NSString *resultResponse=[self HttpPostEntityFirst:@"userid" ForValue1:userid  EntityThird:@"authkey" ForValue3:@"rzTFevN099Km39PV"];
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
            providername1 =[arrayList1 objectForKey:@"providername"];
            mobile1 =[arrayList1 objectForKey:@"mobile"];
        
            
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
    // NSLog(@"items1app %@",luckyNumbers);
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
    NSLog(@" post %@ ",post);
    
    NSLog(@"%@ ",data);
    
    return data;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [group release];
    [super dealloc];
}
@end
