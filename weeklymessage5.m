//
//  weeklymessage5.m
//  Breast Cancer
//
//  Created by DeemSysInc on 23/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import "weeklymessage5.h"

@interface weeklymessage5 ()

@end

@implementation weeklymessage5
@synthesize recorddict;
@synthesize temp;

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
    end.clipsToBounds = YES;
    end.layer.cornerRadius = 5.0f;
    UIButton *home = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *homeImage = [UIImage imageNamed:@" "]  ;
    [home setBackgroundImage:homeImage forState:UIControlStateNormal];
    [home addTarget:self action:@selector(back)
   forControlEvents:UIControlEventTouchUpInside];
    home.frame = CGRectMake(0, 0, 50, 30);
    UIBarButtonItem *cancelButton = [[[UIBarButtonItem alloc]
                                      initWithCustomView:home] autorelease];
    self.navigationItem.leftBarButtonItem = cancelButton;
   // NSLog(@"recorddict in welcome 5 %@",recorddict);
    [super viewDidLoad];
  [self performSelector:@selector(signUpMethod) withObject:nil afterDelay:1];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// Network Status Check
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
    if ([[recorddict objectForKey:@"audioname"] isEqual:@""])
    {
        
        
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
                
                BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Info!" message:@"Message Evaluation  Successful!"];
                
                [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
                [alert show];
                [HUD hide:YES];
                
                
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
    else if (![[recorddict objectForKey:@"audioname"] isEqual:@""])
    {
        NSString*loginid= [[NSUserDefaults standardUserDefaults] objectForKey:@"loginid"];
        
        NSString *resultResponse=[self HttpPostEntityFirst:@"loginid" ForValue1:loginid EntitySecond:@"authkey" ForValue2:@"rzTFevN099Km39PV"];
        NSString *resultResponseaudio=[self HttpPostEntityFirstaudiosave:@"loginid" ForValue1:loginid EntitySecond:@"authkey" ForValue2:@"rzTFevN099Km39PV"];
        
        
        
        //  NSLog(@"********%@",resultResponse);
        //   NSLog(@"REGISTRATION");
        
        NSError *error;
        
        SBJSON *json = [[SBJSON new] autorelease];
        NSDictionary *luckyNumbers = [json objectWithString:resultResponse error:&error];
        SBJSON *jsonaudio = [[SBJSON new] autorelease];
        NSDictionary *luckyNumbersaudio = [jsonaudio objectWithString:resultResponseaudio error:&error];
        
        if ((luckyNumbers == nil)&&(luckyNumbersaudio==nil))
        {
            
            //NSLog(@"luckyNumbers == nil");
            
        }
        else
        {
            
            NSDictionary* menu = [luckyNumbers objectForKey:@"serviceresponse"];
            // NSLog(@"Menu id: %@", [menu objectForKey:@"servicename"]);
            NSDictionary* menuaudio = [luckyNumbersaudio objectForKey:@"serviceresponse"];
            
            
            
            if ([[menu objectForKey:@"success"] isEqualToString:@"Yes"]&&[[menuaudio objectForKey:@"success"] isEqualToString:@"Yes"])
            {
                
                
                BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Info!" message:@"Message Evaluation  Successful!"];
                
                [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
                [alert show];
                [HUD hide:YES];
                
                
            }
            else if ([[menu objectForKey:@"success"] isEqualToString:@"No"]&&[[menuaudio objectForKey:@"success"] isEqualToString:@"No"])
            {
                
                BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Info!" message:@"Message Evaluation  failed!"];
                
                
                [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
                [alert show];
                [HUD hide:YES];
                
            }
            
            
            [HUD hide:YES];
            
        }
    }
    
    
    
    
    
}
-(NSString *)HttpPostEntityFirst:(NSString*)firstEntity ForValue1:(NSString*)value1 EntitySecond:(NSString*)secondEntity ForValue2:(NSString*)value2
{
    NSString *weeklyvisit=[[NSUserDefaults standardUserDefaults]objectForKey:@"weeklyvisit"];
    NSString*weekl=  [[NSUserDefaults standardUserDefaults]objectForKey:@"Weeklogid"];
    NSString *weeknum=[[NSUserDefaults standardUserDefaults]objectForKey:@"Weeknum"];
    NSString *weekdate=[[NSUserDefaults standardUserDefaults]objectForKey:@"Weekdate"];
   // NSLog(@"l=%@,n=%@,d=%@",weekl,weeknum, weekdate);
    int n=[[recorddict objectForKey:@"answer1"]integerValue];
    int countcol;
    
    
    if(n<=5)
    {
        countcol=1;
    }
    else
        countcol=0;
    
    NSString *post =[[NSString alloc] initWithFormat:@"%@=%@&answer1=%@&answer2=%@&answer3=%@&weeknum=%@&weekdate=%@&weeklogid=%@&countcol=%d&%@=%@",firstEntity,value1,[recorddict objectForKey:@"answer1"],[recorddict objectForKey:@"answer2"],[recorddict objectForKey:@"answer3"],weeknum,weekdate,weekl,countcol,secondEntity,value2];
    @try {
        
        NSString *post =[[NSString alloc] initWithFormat:@"%@=%@&answer1=%@&answer2=%@&answer3=%@&weeknum=%@&weekdate=%@&weeklogid=%@&countcol=%d&%@=%@",firstEntity,value1,[recorddict objectForKey:@"answer1"],[recorddict objectForKey:@"answer2"],[recorddict objectForKey:@"answer3"],weeknum,weekdate,weekl,countcol,secondEntity,value2];
        
        NSURL *url=[NSURL URLWithString:@"http://medsmonit.com/bcreasearch/Service/participantregister.php?service=weeklyevaluation"];
        
        
        
      //  NSLog(@"%@",post);
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
        
        
     //   NSLog(@"response for answers%@",data);
        
        
        
        
        
        return data;
        
    }
    @catch (NSException *exception)
    {
        
    }
    
    
    
}

-(NSString *)HttpPostEntityFirstaudiosave:(NSString*)firstEntity ForValue1:(NSString*)value1 EntitySecond:(NSString*)secondEntity ForValue2:(NSString*)value2
{
    
    @try {
        NSString*loginid= [[NSUserDefaults standardUserDefaults] objectForKey:@"loginid"];
        
        NSURL *url=[NSURL URLWithString:@"http://medsmonit.com/bcreasearch/Service/participantregister.php?service=audioinsert"];
        
        NSMutableURLRequest *req = [[NSMutableURLRequest alloc] initWithURL:url];
        [req setHTTPMethod:@"POST"];
        
        [req setValue:@"multipart/form-data; boundary=*****" forHTTPHeaderField:@"Content-Type"];//
        
        NSString*weekl=  [[NSUserDefaults standardUserDefaults]objectForKey:@"Weeklogid"];
        
     //   NSLog(@"weekid %@,logid %@",weekl,loginid);
        NSMutableData *body=[[NSMutableData alloc]init];
        
        NSData *userImageData = [[NSData alloc] initWithContentsOfFile:[recorddict objectForKey:@"audiourl"]];
        
        
        NSString *stringBoundary = [NSString stringWithString:@"*****"];
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n",stringBoundary] dataUsingEncoding:NSASCIIStringEncoding]];
        [body appendData:[[NSString stringWithString:@"Content-Disposition: form-data; name=\"weeklogid\"\r\n\r\n"] dataUsingEncoding:NSASCIIStringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"%@",weekl] dataUsingEncoding:NSASCIIStringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",stringBoundary] dataUsingEncoding:NSASCIIStringEncoding]];
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",stringBoundary] dataUsingEncoding:NSASCIIStringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n",stringBoundary] dataUsingEncoding:NSASCIIStringEncoding]];
        [body appendData:[[NSString stringWithString:@"Content-Disposition: form-data; name=\"patientid\"\r\n\r\n"] dataUsingEncoding:NSASCIIStringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"%@",loginid] dataUsingEncoding:NSASCIIStringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",stringBoundary] dataUsingEncoding:NSASCIIStringEncoding]];
        
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",stringBoundary] dataUsingEncoding:NSASCIIStringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n",stringBoundary] dataUsingEncoding:NSASCIIStringEncoding]];
        [body appendData:[[NSString stringWithString:@"Content-Disposition: form-data; name=\"patientaudio\"; filename=\"Record.m4a\"\r\nContent-Type: audio/m4a\r\n\r\n"] dataUsingEncoding:NSASCIIStringEncoding]];
        [body appendData:[NSData dataWithData:userImageData]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",stringBoundary] dataUsingEncoding:NSASCIIStringEncoding]];
        
        
        [req setHTTPBody:body];//putParams];
        // NSLog(@"body %@",body);
        NSHTTPURLResponse* response = nil;
        NSError* error = [[[NSError alloc] init] autorelease];
        NSString *result;
        NSData *responseData;
        responseData = [NSURLConnection sendSynchronousRequest:req returningResponse:&response error:&error];
        result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        
        
        [url release];
        [req release];
      //  NSLog(@"response for audio insertion %@",result);
        
        
        return result;
    }
    @catch (NSException *exception)
    {
        
    }
    
    
    
}


- (void)dealloc {
    [end release];
    [super dealloc];
}
@end
