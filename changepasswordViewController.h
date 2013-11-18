//
//  changepasswordViewController.h
//  SMSIPAD
//
//  Created by DeemsysInc on 11/14/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextfieldScrollViewController.h"

@interface changepasswordViewController : UITextfieldScrollViewController

{
    IBOutlet UITextField*oldpaswrd;
    IBOutlet UITextField*newpaswrd;
    IBOutlet UITextField*confirmpawrd;
    
}
- (IBAction)changepassword:(id)sender;

@end
