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

@interface smsmainviewcontrollerViewController :UITextfieldScrollViewController{
    IBOutlet UITextField*phonenumber;
    IBOutlet UITextField*password;
    NSMutableDictionary*recorddict;
    int a;
}
@property(nonatomic,retain)NSMutableDictionary*recorddict;
-(IBAction)signin:(id)sender;


@end
