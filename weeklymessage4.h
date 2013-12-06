//
//  weeklymessage4.h
//  Breast Cancer
//
//  Created by DeemSysInc on 23/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CFNetwork/CFNetwork.h>
#import "SKPSMTPMessage.h"
#import "NSData+Base64Additions.h"
#import "MBProgressHUD.h"
#import "Reachability.h"
#import "BlockAlertView.h"
#import "JSON.h"




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


@interface weeklymessage4 : UIViewController<SKPSMTPMessageDelegate,MBProgressHUDDelegate,UITextFieldDelegate>
{
   
    IBOutlet UILabel *question4;
    IBOutlet UITextField * answer4;
    NSMutableDictionary * recorddict;
    NSMutableDictionary * temp;
    
    
    MBProgressHUD *HUD;
    BOOL isConnect;
    IBOutlet UIButton *yesbutton;
    IBOutlet UIButton *nobutton;
}
-(IBAction)send:(id)sender;
-(IBAction)clear:(id)sender;
- (IBAction)yesselected:(id)sender;
- (IBAction)noselected:(id)sender;


@property (nonatomic,retain) NSMutableDictionary * recorddict;
@end
