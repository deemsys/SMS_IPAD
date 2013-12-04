//
//  weeklymail.h
//  Breast Cancer
//
//  Created by DeemSysInc on 30/11/13.
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


@interface weeklymail : UIViewController<SKPSMTPMessageDelegate,MBProgressHUDDelegate>
{
    MBProgressHUD *HUD;
    IBOutlet UITextView * mailmessage;
    IBOutlet UITextField * mailanswer;
    IBOutlet UIButton * send;
    IBOutlet UIButton * clear;
    NSMutableDictionary * recordict;
    NSString * proemail;
    NSString * patemail;
}
-(IBAction)send:(id)sender;
-(IBAction)clear:(id)sender;
@property (nonatomic,retain)NSMutableDictionary * recorddict;
@end
