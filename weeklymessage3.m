//
//  weeklymessage3.m
//  Breast Cancer
//
//  Created by DeemSysInc on 23/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import "weeklymessage3.h"
#import "weeklymessage4.h"
#import "weekmessage2.h"
#import "BlockAlertView.h"


@interface weeklymessage3 ()
{
   

}


@end

@implementation weeklymessage3
@synthesize recorddict;
@synthesize stop,record,play,save;



NSString * aaa;
int a;






-(IBAction)stop:(id)sender
{
    [play setEnabled:YES];
    [save setEnabled:YES];
    [stop setEnabled:NO];

    [self.audioPlayer stop];
    [self.audioRecorder stop];
    AVAudioSession *session = [AVAudioSession sharedInstance];
    int flags = AVAudioSessionSetActiveFlags_NotifyOthersOnDeactivation;
    [session setActive:NO withFlags:flags error:nil];
    
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [dirPaths objectAtIndex:0];
    NSDate *date=[NSDate date];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString * currentDate = [dateFormatter stringFromDate:date];
    NSLog(@"current date %@",currentDate);

    NSString *name=[[NSUserDefaults standardUserDefaults]objectForKey:@"username"];
   audioname=[NSString stringWithFormat:@"%@_%@_audiofile",currentDate,name];
    [recorddict setObject:audioname forKey:@"audioname"];

    NSURL *audioFileURL = [NSURL fileURLWithPath:[docsDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.m4a",audioname]]];
   // NSLog(@"%@ audio url",audioFileURL);
    [recorddict setObject:audioFileURL forKey:@"audiourl"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioFileURL error:nil];

   
    recording.hidden=TRUE;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





-(IBAction)save:(id)sender
{
    a=0;
    recording.hidden=YES;
    [recorddict addEntriesFromDictionary:temp];
    recorddict=[[NSMutableDictionary alloc]init];
    
    recorddict=[[NSMutableDictionary alloc]init];
    [recorddict addEntriesFromDictionary:temp];
    
    if(([answer3.text length]!=0))
    {
       
            a=1;
          //  NSLog(@"a value %i",a);
            [recorddict setValue:answer3.text forKey:@"answer2"];
            //NSLog(@"answer5%@",answer1.text);
       
    }
    else
    {
        BlockAlertView *alert = [BlockAlertView alertWithTitle:@"INFO!" message:@"Field should not be empty."];
        
        //  [alert setCancelButtonWithTitle:@"Cancel" block:nil];
        [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
        [alert show];
    }
    if (a==1)
    {
      //  NSLog(@"recorddict in answer2 %@",recorddict);
        [self performSegueWithIdentifier:@"sms8" sender:self];
    }
    
    
    
}

- (IBAction)next:(id)sender
{
    recorddict=[[NSMutableDictionary alloc]init];
    [recorddict addEntriesFromDictionary:temp];
    
  //  NSLog(@"recorddict in answer2 %@",recorddict);
    [self performSegueWithIdentifier:@"sms8" sender:self];
    
    
}
-(IBAction)record:(id)sender
{
    recording.hidden=FALSE;
    
    recording.text=@"Recording..";
    [self.audioRecorder prepareToRecord];
    [self.audioRecorder record];
    [stop setEnabled:YES];
    [record setEnabled:NO];
    
    
}
-(IBAction)play:(id)sender
{
        recording.hidden=FALSE;
        
       recording.text=@"Playing..";
        
    
    [stop setEnabled:YES];
    [record setEnabled:NO];
    [self.audioPlayer play];
    
}

#pragma mark - AVAudioPlayerDelegate

- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    recording.hidden=TRUE;
    
    BlockAlertView *alert=[[BlockAlertView alloc]initWithTitle:@"Done" message:@"Finish playing the recording!"];
    [alert show];
}


-(void)dismissKeyboard {
    [answer3 resignFirstResponder];
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [answer3 resignFirstResponder];
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
    
    // Disable Stop/Play button when application launches
    answer3.clipsToBounds = YES;
    answer3.layer.cornerRadius = 5.0f;
    nextbut.clipsToBounds = YES;
    nextbut.layer.cornerRadius = 5.0f;
    play.clipsToBounds = YES;
    play.layer.cornerRadius = 5.0f;
    stop.clipsToBounds = YES;
    stop.layer.cornerRadius = 5.0f;
    record.clipsToBounds = YES;
    record.layer.cornerRadius = 5.0f;
save.clipsToBounds = YES;
    save.layer.cornerRadius = 5.0f;
    
    
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
    
    
    
    // Disable Stop/Play button when application launches
    [stop setEnabled:NO];
    [play setEnabled:NO];
    [save setEnabled:NO];
    
    // Set the audio file
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [dirPaths objectAtIndex:0];
    NSDate *date=[NSDate date];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString * currentDate = [dateFormatter stringFromDate:date];
  //  NSLog(@"current date %@",currentDate);

   NSString *name=[[NSUserDefaults standardUserDefaults]objectForKey:@"username"];
    audioname=[NSString stringWithFormat:@"%@_%@_audiofile",currentDate,name];
    [recorddict setObject:audioname forKey:@"audioname"];

    NSURL *audioFileURL = [NSURL fileURLWithPath:[docsDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.m4a",audioname]]];
    NSDictionary *audioSettings = [NSDictionary dictionaryWithObjectsAndKeys:
                                   [NSNumber numberWithFloat:44100],AVSampleRateKey,
                                   [NSNumber numberWithInt: kAudioFormatAppleLossless],AVFormatIDKey,
                                   [NSNumber numberWithInt: 1],AVNumberOfChannelsKey,
                                   [NSNumber numberWithInt:AVAudioQualityMedium],AVEncoderAudioQualityKey,nil];
    NSError *error = nil;
  [recorddict setObject:audioFileURL forKey:@"audiourl"];
    self.audioRecorder = [[AVAudioRecorder alloc]
                          initWithURL:audioFileURL
                          settings:audioSettings
                          error:&error];
    
    [super viewDidLoad];
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryRecord error:nil];
    [session setActive:YES error:nil];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    

    	// Do any additional setup after loading the view.
    
    
    temp=[[NSMutableDictionary alloc]init];
    temp=recorddict;
    
    aaa = [recorddict objectForKey:@"answer2"];
    if ([aaa isEqual:@"I Forgot"])
    {
        NSArray *words = [NSArray arrayWithObjects: @"tip 1 for option 1", @"tip 2 for option 1", @"tip 3 for option 1",@"tip 4 for option 1",@"tip 5 for option 1", nil ];
        NSString *tips1=[words objectAtIndex:arc4random()%[words count]];
    //    NSLog(@"random %@",tips1);
        tipsimprove.text=tips1;
        tipsimprove.hidden=FALSE;
        nextbut.hidden=FALSE;
        
        pleaseexplain.hidden=TRUE;
        answer3.hidden=TRUE;
        play.hidden=TRUE;
        record.hidden=TRUE;
        stop.hidden=TRUE;
        save.hidden=TRUE;
        [recorddict setObject:@"" forKey:@"audioname"];
        [recorddict setObject:@"" forKey:@"audiourl"];
        
    }
    else if([aaa isEqual:@"I Had side effects"])
    {
        NSArray *words = [NSArray arrayWithObjects: @"tip 1 for option 2", @"tip 2 for option 2", @"tip 3 for option 2",@"tip 4 for option 2",@"tip 5 for option 2", nil ];
        NSString *tips1=[words objectAtIndex:arc4random()%[words count]];
     //   NSLog(@"random %@",tips1);
        tipsimprove.text=tips1;
        
        tipsimprove.hidden=FALSE;
        nextbut.hidden=FALSE;
        
        pleaseexplain.hidden=TRUE;
        answer3.hidden=TRUE;
        play.hidden=TRUE;
        record.hidden=TRUE;
        stop.hidden=TRUE;
        save.hidden=TRUE;
         [recorddict setObject:@"" forKey:@"audioname"];
          [recorddict setObject:@"" forKey:@"audiourl"];
        
    }
    else if([aaa isEqual:@"I ran out of Medication"])
    {NSArray *words = [NSArray arrayWithObjects: @"tip 1 for option 3", @"tip 2 for option 3", @"tip 3 for option 3",@"tip 4 for option 3",@"tip 5 for option 3", nil ];
        NSString *tips1=[words objectAtIndex:arc4random()%[words count]];
     //   NSLog(@"random %@",tips1);
        tipsimprove.text=tips1;
        
        tipsimprove.hidden=FALSE;
        nextbut.hidden=FALSE;
        
        pleaseexplain.hidden=TRUE;
        answer3.hidden=TRUE;
        play.hidden=TRUE;
        record.hidden=TRUE;
        stop.hidden=TRUE;
        save.hidden=TRUE;
         [recorddict setObject:@"" forKey:@"audioname"];
          [recorddict setObject:@"" forKey:@"audiourl"];
    }
    else
    {
        tipsimprove.hidden=TRUE;
        nextbut.hidden=TRUE;
        
        pleaseexplain.hidden=FALSE;
        answer3.hidden=FALSE;
        play.hidden=FALSE;
        record.hidden=FALSE;
        stop.hidden=FALSE;
        save.hidden=FALSE;
    }
    
    
    
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([segue.identifier isEqualToString:@"sms8"])
    {
        weeklymessage4 *destViewController = [segue destinationViewController];
        destViewController.recorddict=recorddict;
     //   NSLog(@"recorddict from third page %@",recorddict);
        // destViewController.delegate=self;
        
    }
    
    
    
    
}




- (void)dealloc {
    [nextbut release];
    [toolbar release];
    [tipsimprove release];
    [play release];
    [stop release];
    [record release];
    [super dealloc];
}
@end
