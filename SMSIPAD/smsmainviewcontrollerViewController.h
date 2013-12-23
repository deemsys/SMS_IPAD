//
//  smsmainviewcontrollerViewController.h
//  SMSIPAD
//
//  Created by DeemSysInc on 08/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlockAlertView.h"
#import "UITextfieldScrollViewController.h"
#import "MBProgressHUD.h"

@interface smsmainviewcontrollerViewController :UITextfieldScrollViewController<UITextFieldDelegate,MBProgressHUDDelegate>{
    IBOutlet UITextField*phonenumber;
    IBOutlet UITextField*password;
    NSMutableDictionary*recorddict;
    int a,c;
    MBProgressHUD *HUD;
    BOOL isConnect;
    IBOutlet UIButton *signin;
    IBOutlet UIButton *signup;
    IBOutlet UIButton *forgot;
    IBOutlet UILabel *notregisterd;
    
    
    
    
    
    
}
@property(nonatomic,retain)NSMutableDictionary*recorddict;
-(IBAction)signin:(id)sender;
- (IBAction)signup:(id)sender;


@end
