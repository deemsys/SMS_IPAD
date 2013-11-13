//
//  signupViewController.h
//  SMSIPAD
//
//  Created by DeemSysInc on 12/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlockAlertView.h"
#import "signup2ViewController.h"

@interface signupViewController : UIViewController
{
    IBOutlet UITextField * firstname;
    IBOutlet UITextField *mobilenum;
    IBOutlet UITextField *mobilecode;
    IBOutlet UITextField *email;
    NSMutableDictionary*recorddict;
    int c;
    
}
@property(nonatomic,retain)NSMutableDictionary*recorddict;
-(IBAction)clear:(id)sender;
-(IBAction)next:(id)sender;
-(IBAction)verifyemail:(id)sender;
-(IBAction)sendmobilecode:(id)sender;
@end
