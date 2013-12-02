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
#import "UITextfieldScrollViewController.h"
#import "MBProgressHUD.h"
#import "Reachability.h"
#import "fileMngr.h"



@interface signupViewController :UITextfieldScrollViewController<MBProgressHUDDelegate>

{
    MBProgressHUD *HUD;
    NSString*appoFile;
    NSString*appoNFile;
    NSMutableArray *_AppDArr;
    NSMutableArray *_AppNArr;
    IBOutlet UITextField * firstname;
    IBOutlet UITextField *mobilenum;
    IBOutlet UITextField *username;
    IBOutlet UITextField *email;
    NSMutableDictionary*recorddict;
    int c;
    NSMutableArray*temp2,*temp3,*temp4;
    BOOL isConnect;
    

    
}
@property(nonatomic,retain)NSMutableDictionary*recorddict;
-(IBAction)clear:(id)sender;
-(IBAction)next:(id)sender;

@end
