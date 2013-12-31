//
//  weeklymessage3.h
//  Breast Cancer
//
//  Created by DeemSysInc on 23/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface weeklymessage3 : UIViewController<AVAudioRecorderDelegate, AVAudioPlayerDelegate>
{
    IBOutlet UILabel * pleaseexplain;
    IBOutlet UITextView * answer3;
    IBOutlet UILabel *tipsimprove;
  
    IBOutlet UILabel * recording;
    NSMutableDictionary * recorddict;
    NSMutableDictionary * temp;
    IBOutlet UIButton *nextbut;
    IBOutlet UIButton *saveButton;
    
    IBOutlet UIToolbar *toolbar;
    
    IBOutlet UIButton *play;
    
    IBOutlet UIButton *stop;
    

    IBOutlet UIButton *record;
}
-(IBAction)record:(id)sender;
-(IBAction)stop:(id)sender;
-(IBAction)play:(id)sender;
-(IBAction)save:(id)sender;
- (IBAction)next:(id)sender;

@property (nonatomic , retain) NSMutableDictionary * recorddict;
@property (strong, nonatomic) IBOutlet UIButton * playButton;
@property (strong, nonatomic) IBOutlet UIButton * recordButton;
@property (strong, nonatomic) IBOutlet UIButton * stopButton;
@end
