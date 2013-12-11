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
    AVAudioRecorder *recorder;
    AVAudioPlayer *player;

}


@end

@implementation weeklymessage3
@synthesize recorddict;
@synthesize stopButton, playButton, recordButton;



NSString * aaa;
int a;






-(IBAction)stop:(id)sender
{
    [recorder stop];
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setActive:NO error:nil];
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
    [recorddict addEntriesFromDictionary:temp];
    recorddict=[[NSMutableDictionary alloc]init];
    
    recorddict=[[NSMutableDictionary alloc]init];
    [recorddict addEntriesFromDictionary:temp];
    
    if(([answer3.text length]!=0))
    {
       
            a=1;
            NSLog(@"a value %i",a);
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
        NSLog(@"recorddict in answer2 %@",recorddict);
        [self performSegueWithIdentifier:@"sms8" sender:self];
    }
    
    
    
}

- (IBAction)next:(id)sender
{
    recorddict=[[NSMutableDictionary alloc]init];
    [recorddict addEntriesFromDictionary:temp];
    
    NSLog(@"recorddict in answer2 %@",recorddict);
    [self performSegueWithIdentifier:@"sms8" sender:self];
    
    
}
-(IBAction)record:(id)sender
{
    if (player.playing) {
        [player stop];
        
    }
    NSLog(@"player%@",player);
    
    if (!recorder.recording) {
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setActive:YES error:nil];
        
        // Start recording
        [recorder record];
        [recordButton setTitle:@"Pause" forState:UIControlStateNormal];
        recording.hidden=FALSE;
        recording.text=@"Recording..";
        
    } else {
        
        // Pause recording
        [recorder pause];
        [recordButton setTitle:@"Record" forState:UIControlStateNormal];
        recording.hidden=TRUE;
    }
    
    [stopButton setEnabled:YES];
    [playButton setEnabled:NO];
   
}
-(IBAction)play:(id)sender
{
    
    if (!recorder.recording){
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:recorder.url error:nil];
        [player setDelegate:self];
        [player play];
        recording.text=@"Playing..";
        recording.hidden=FALSE;
    }
    
    
}

#pragma mark - AVAudioRecorderDelegate

- (void) audioRecorderDidFinishRecording:(AVAudioRecorder *)avrecorder successfully:(BOOL)flag{
    [recordButton setTitle:@"Record" forState:UIControlStateNormal];
    [stopButton setEnabled:NO];
    [playButton setEnabled:YES];
}

#pragma mark - AVAudioPlayerDelegate

- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Done"
                                                    message: @"Finish playing the recording!"
                                                   delegate: nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
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
    saveButton.clipsToBounds = YES;
    saveButton.layer.cornerRadius = 5.0f;
    
    
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
    [stopButton setEnabled:NO];
    [playButton setEnabled:NO];
    
    // Set the audio file
    NSArray *pathComponents = [NSArray arrayWithObjects:
                               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject],
                               @"MyAudioMemo.m4a",
                               nil];
    NSURL *outputFileURL = [NSURL fileURLWithPathComponents:pathComponents];
    
    // Setup audio session
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    
    // Define the recorder setting
    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];
    
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
    
    // Initiate and prepare the recorder
    recorder = [[AVAudioRecorder alloc] initWithURL:outputFileURL settings:recordSetting error:nil];
    recorder.delegate = self;
    recorder.meteringEnabled = YES;
   // [recorder prepareToRecord];
    
    
    
    
    
    
    
    
    
    

    	// Do any additional setup after loading the view.
    
    
    temp=[[NSMutableDictionary alloc]init];
    temp=recorddict;
    
    aaa = [recorddict objectForKey:@"answer2"];
    if ([aaa isEqual:@"I Forgot"])
    {
        NSArray *words = [NSArray arrayWithObjects: @"tip 1 for option 1", @"tip 2 for option 1", @"tip 3 for option 1",@"tip 4 for option 1",@"tip 5 for option 1", nil ];
        NSString *tips1=[words objectAtIndex:arc4random()%[words count]];
        NSLog(@"random %@",tips1);
        tipsimprove.text=tips1;
        tipsimprove.hidden=FALSE;
        nextbut.hidden=FALSE;
        
        pleaseexplain.hidden=TRUE;
        answer3.hidden=TRUE;
        playButton.hidden=TRUE;
        recordButton.hidden=TRUE;
        stopButton.hidden=TRUE;
        saveButton.hidden=TRUE;
        
        
    }
    else if([aaa isEqual:@"I Had side effects"])
    {
        NSArray *words = [NSArray arrayWithObjects: @"tip 1 for option 2", @"tip 2 for option 2", @"tip 3 for option 2",@"tip 4 for option 2",@"tip 5 for option 2", nil ];
        NSString *tips1=[words objectAtIndex:arc4random()%[words count]];
        NSLog(@"random %@",tips1);
        tipsimprove.text=tips1;
        
        tipsimprove.hidden=FALSE;
        nextbut.hidden=FALSE;
        
        pleaseexplain.hidden=TRUE;
        answer3.hidden=TRUE;
        playButton.hidden=TRUE;
        recordButton.hidden=TRUE;
        stopButton.hidden=TRUE;
        saveButton.hidden=TRUE;
        
    }
    else if([aaa isEqual:@"I ran out of Medication"])
    {NSArray *words = [NSArray arrayWithObjects: @"tip 1 for option 3", @"tip 2 for option 3", @"tip 3 for option 3",@"tip 4 for option 3",@"tip 5 for option 3", nil ];
        NSString *tips1=[words objectAtIndex:arc4random()%[words count]];
        NSLog(@"random %@",tips1);
        tipsimprove.text=tips1;
        
        tipsimprove.hidden=FALSE;
        nextbut.hidden=FALSE;
        
        pleaseexplain.hidden=TRUE;
        answer3.hidden=TRUE;
        playButton.hidden=TRUE;
        recordButton.hidden=TRUE;
        stopButton.hidden=TRUE;
        saveButton.hidden=TRUE;    }
    else
    {
        tipsimprove.hidden=TRUE;
        nextbut.hidden=TRUE;
        
        pleaseexplain.hidden=FALSE;
        answer3.hidden=FALSE;
        playButton.hidden=FALSE;
        recordButton.hidden=FALSE;
        stopButton.hidden=FALSE;
        saveButton.hidden=FALSE;
    }
    
    
    
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([segue.identifier isEqualToString:@"sms8"])
    {
        weeklymessage4 *destViewController = [segue destinationViewController];
        destViewController.recorddict=recorddict;
        NSLog(@"recorddict from third page %@",recorddict);
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
