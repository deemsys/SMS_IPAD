//
//  providerinfoViewController.h
//  SMSIPAD
//
//  Created by DeemsysInc on 11/14/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface providerinfoViewController : UIViewController<MFMailComposeViewControllerDelegate>
{
    IBOutlet UILabel*providername;
   IBOutlet UILabel*providerphonebook;
    IBOutlet UILabel*provideremail;
    
}
-(IBAction)callprovider:(id)sender;
-(IBAction)emailprovider:(id)sender;

@end
