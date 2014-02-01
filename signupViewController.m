//
//  signupViewController.m
//  SMSIPAD
//
//  Created by DeemSysInc on 12/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import "signupViewController.h"
#import "signup3ViewController.h"
#import "BlockAlertView.h"
#import <CFNetwork/CFNetwork.h>
#import "SKPSMTPMessage.h"
#import "NSData+Base64Additions.h"
#import "Reachability.h"
#import "MBProgressHUD.h"
#import "JSON.h"
#import "signup2ViewController.h"
@interface signupViewController ()

@end

@implementation signupViewController
@synthesize recorddict;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.tag==5) {
        
        NSUInteger newLength = [mobilenum.text length] + [string length] - range.length;
        return (newLength > 10) ? NO : YES;
    }
    else
        return YES;
}

- (void)viewDidLoad
{
    reset.clipsToBounds = YES;
    reset.layer.cornerRadius = 5.0f;
    next.clipsToBounds = YES;
    next.layer.cornerRadius = 5.0f;
    [super viewDidLoad];
    firstname.delegate=self;
    username.delegate=self;
    mobilenum.delegate=self;
    email.delegate=self;
    
    recorddict=[[NSMutableDictionary alloc]init];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
      [self sunc];
    
	// Do any additional setup after loading the view.
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    c=0;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}



- (IBAction)hideKeyboard:(id)sender
{
    //NSLog(@"hideKeyboard");
    [sender resignFirstResponder];
}

-(void)dismissKeyboard {
    [firstname resignFirstResponder];
    [username resignFirstResponder];
    [mobilenum resignFirstResponder];
    [email resignFirstResponder];
    
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



- (IBAction)clear:(id)sender {
    firstname.text=@"";
    email.text=@"";
    username.text=@"";
    mobilenum.text=@"";
}

-(IBAction)next:(id)sender
{
    //[recorddict setObject:_AppDArr forKey:@"Providersname"];
    //NSMutableArray*names=[recorddict objectForKey:@"Providersname"];
    
    //NSLog(@"%@ array",names[1]);
    if(([firstname.text length]!=0)&&([mobilenum.text length]!=0)&&([username.text length]!=0)&&([email.text length]!=0))
    {
        if ([self alphanumericvalidation:firstname.text]==1)
        {
            if ([self alphanumericvalidation:username.text]==1)
            {
                if ([self validateMobile:mobilenum.text]==1)
                {
                    if ([self validateEmail:email.text]==1)
                    {
                        c=1;
                        [recorddict setValue:firstname.text forKey:@"FirstName"];
                        [recorddict setValue:username.text forKey:@"UserName"];
                        [recorddict setValue:mobilenum.text forKey:@"Mobilenum"];
                        [recorddict setValue:email.text forKey:@"email"];
                        [recorddict setObject:_AppDArr forKey:@"Providersname"];
                        [recorddict setObject:temp2 forKey:@"Groupname"];
                        [recorddict setObject:temp3 forKey:@"Groupid"];
                        [recorddict setObject:temp4 forKey:@"Createdby"];
                        
                    }
                    else
                    {
                        BlockAlertView *alert = [BlockAlertView alertWithTitle:@"INFO!" message:@"Enter Valid E-mail id."];
                        [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
                        [alert show];
                    }
                }
                else
                {
                    BlockAlertView *alert = [BlockAlertView alertWithTitle:@"INFO!" message:@"Enter Valid Mobile Number."];
                    [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
                    [alert show];
                }
                
                
            }
            else
            {
                BlockAlertView *alert = [BlockAlertView alertWithTitle:@"INFO!" message:@"Enter Valid User Name."];
                [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
                [alert show];
            }
        }
        else
        {
            BlockAlertView *alert = [BlockAlertView alertWithTitle:@"INFO!" message:@"Enter Valid First Name."];
            [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
            [alert show];
        }
    }
    else
    {
        BlockAlertView *alert = [BlockAlertView alertWithTitle:@"INFO!" message:@"Enter all the required fields."];
        [alert setDestructiveButtonWithTitle:@"OK" block:nil];
        [alert show];
        
    }
    if(c==1)
        [self performSegueWithIdentifier:@"signup1to2" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([segue.identifier isEqualToString:@"signup1to2"])
    {
        
        
        signup2ViewController *destViewController = [segue destinationViewController];
        destViewController.recorddict=recorddict;
       // NSLog(@"recorddict in signup1 %@",recorddict);
        // destViewController.delegate=self;
        
    }
    
    
    
}
-(void)sunc
{
    _AppDArr=[[NSMutableArray alloc]init];
    _AppNArr=[[NSMutableArray alloc]init];
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
        [HUD hide:YES afterDelay:2];
        return;
    }
    NSString *resultResponse1=[self HttpPostEntityFirstPROVIDER:@"Patient_name" ForValue1:username.text  EntityThird:@"authkey" ForValue3:@"rzTFevN099Km39PV"];
    NSError *error;
    SBJSON *json = [[SBJSON new] autorelease];
    
    NSDictionary *luckyNumbers1 = [json objectWithString:resultResponse1 error:&error];
    
    NSDictionary *itemsApp = [luckyNumbers1 objectForKey:@"serviceresponse"];
    NSArray *items1App=[itemsApp objectForKey:@"Providers List"];
    //  NSLog(@"items1app %@",items1App);
    // NSMutableArray *ProD=[[NSMutableArray alloc]init];
    // NSMutableArray *ProNam=[[NSMutableArray alloc]init];
    // NSLog(@"Retrived Providers:%@",items1App);
    NSMutableArray*temp=[[NSMutableArray alloc]init];
    NSMutableArray*temp1=[[NSMutableArray alloc]init];
    NSDictionary *arrayList1;
    for (id anUpdate1 in items1App)
    {
        NSDictionary *arrayList1=[(NSDictionary*)anUpdate1 objectForKey:@"serviceresponse"];
        
        
        [temp addObject:[arrayList1 objectForKey:@"Provider username"]];
        [temp1 addObject:[arrayList1 objectForKey:@"Provider id"]];
        
        
    }
    
    
    // NSLog(@"temp value %@",temp);
    //  NSLog(@"temp1 value %@",temp1);
    
    
    if([_AppDArr count]==0&&[_AppNArr count]==0)
    {
        for(int j=0;j<[temp count];j++)
        {
            [_AppDArr addObject:[temp objectAtIndex:j]];
            [_AppNArr addObject:[temp1 objectAtIndex:j]];
        }
    }
    else {
        int x=0;
        for(int i=0;i<[temp1 count];i++)
        {
            x=0;
            for(int j=0;j<[_AppNArr count];j++)
            {
                
                NSString*s=[temp1 objectAtIndex:i];
                NSString*s1=[_AppNArr objectAtIndex:j];
                
                if([s isEqualToString:s1])
                {
                    
                }
                else {
                    
                    x++;
                    
                    if(x==[_AppNArr count])
                    {
                        x=0;
                        
                        [_AppDArr addObject:[temp objectAtIndex:i]];
                        [_AppNArr addObject:[temp1 objectAtIndex:i]];
                        
                    }
                }
            }
            
            
            
        }
        
    }
    
    NSString *resultResponse2=[self HttpPostEntityFirstGroup:@"Patient_name" ForValue1:username.text  EntityThird:@"authkey" ForValue3:@"rzTFevN099Km39PV"];
    NSError *error2;
    SBJSON *json2 = [[SBJSON new] autorelease];
    
    NSDictionary *luckyNumbers2 = [json2 objectWithString:resultResponse2 error:&error2];
    
    NSDictionary *itemsApp2 = [luckyNumbers2 objectForKey:@"serviceresponse"];
    NSArray *items2App=[itemsApp2 objectForKey:@"Group List"];
    // NSMutableArray *ProD=[[NSMutableArray alloc]init];
    // NSMutableArray *ProNam=[[NSMutableArray alloc]init];
    // NSLog(@"Retrived Providers:%@",items1App);
    temp2=[[NSMutableArray alloc]init];
    temp3=[[NSMutableArray alloc]init];
    temp4=[[NSMutableArray alloc]init];
    NSDictionary *arrayList2;
    for (id anUpdate1 in items2App)
    {
        NSDictionary *arrayList2=[(NSDictionary*)anUpdate1 objectForKey:@"serviceresponse"];
        
        
        [temp2 addObject:[arrayList2 objectForKey:@"Groupname"]];
        [temp3 addObject:[arrayList2 objectForKey:@"Groupid"]];
        [temp4 addObject:[arrayList2 objectForKey:@"Createdby"]];
        
        
        
    }
    
    
   //  NSLog(@"groupname value %@",temp2);
// NSLog(@"groupid value %@",temp3);
  //  NSLog(@"createdby value %@",temp4);
    
   // NSLog(@"providerName:%@",_AppDArr);
  // NSLog(@"ProviderId:%@",_AppNArr);
    
}










-(NSString *)HttpPostEntityFirstPROVIDER:(NSString*)firstEntity ForValue1:(NSString*)value1  EntityThird:(NSString*)thirdEntity ForValue3:(NSString*)value3
{
    
    //Reading all providers detail
    HUD.labelText = @"Synchronizing Data..";
    NSString *post =[[NSString alloc] initWithFormat:@"%@=%@&%@=%@",firstEntity,value1,thirdEntity,value3];
    
    
   // NSLog(@"%@",post);
    
    NSURL *url=[NSURL URLWithString:@"http://www.medsmonit.com/bcreasearch/Service/genericSelect.php?service=simpleselect"];
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
    
    
    // NSLog(@"%@",data);
    
    return data;
    
}
-(NSString *)HttpPostEntityFirstGroup:(NSString*)firstEntity ForValue1:(NSString*)value1  EntityThird:(NSString*)thirdEntity ForValue3:(NSString*)value3
{
    
    //Reading group names
    HUD.labelText = @"Synchronizing Data..";
    NSString *post =[[NSString alloc] initWithFormat:@"%@=%@&%@=%@",firstEntity,value1,thirdEntity,value3];
    
    
    // NSLog(@"%@",post);
    
    NSURL *url=[NSURL URLWithString:@"http://www.medsmonit.com/bcreasearch/Service/genericSelect.php?service=groupSelect"];
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
    
    
    //  NSLog(@"%@ data",data);
    
    return data;
    
}



- (void)dealloc {
   
    [reset release];
    [next release];
    [super dealloc];
}
@end
