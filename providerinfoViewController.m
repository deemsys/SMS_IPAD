//
//  providerinfoViewController.m
//  SMSIPAD
//
//  Created by DeemsysInc on 11/14/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import "providerinfoViewController.h"
#import "BlockAlertView.h"
#import <MessageUI/MFMailComposeViewController.h>
#import "messageview.h"

@interface providerinfoViewController ()

@end

@implementation providerinfoViewController

-(IBAction)callprovider:(id)sender
{
    NSLog(@"Phone calling...");
    
    UIDevice *device = [UIDevice currentDevice];
    
  //  NSString *cellNameStr = [NSString stringWithFormat:@"%@",self.tableCellNames[indexPath.row]];
    
    if ([[device model] isEqualToString:@"iPhone"] ) {
        
        NSString *phoneNumber = [@"tel://" stringByAppendingString:providerphonebook.text];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
    } else {
        
        BlockAlertView *alert = [BlockAlertView alertWithTitle:@"oh snap!" message:@"Your device doesn't support calling feature.."];
        
        //  [alert setCancelButtonWithTitle:@"Cancel" block:nil];
        // [alert setDestructiveButtonWithTitle:@"ok" block:nil];
        [alert setCancelButtonWithTitle:@"ok" block:nil];
        [alert show];
        
        
    }
}
-(IBAction)emailprovider:(id)sender
{
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
        controller.mailComposeDelegate = self;
        [controller setTitle:@"Email"];
        [controller setSubject:@""];
        [controller setMessageBody:@"Sent from BC research App Mail" isHTML:YES];
        [controller setToRecipients:[NSArray arrayWithObjects:provideremail.text,nil]];
        [self presentViewController:controller animated:YES completion:NULL];
    }
    else{
        BlockAlertView *alert = [BlockAlertView alertWithTitle:@"oh snap!" message:@"Your device doesn't support mailing feature."];
        
        //  [alert setCancelButtonWithTitle:@"Cancel" block:nil];
        // [alert setDestructiveButtonWithTitle:@"ok" block:nil];
        [alert setCancelButtonWithTitle:@"ok" block:nil];
        [alert show];

    }
    
}
-(void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    
    
    switch (result)
	{
		case MFMailComposeResultCancelled:
			NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued");
			break;
		case MFMailComposeResultSaved:
			NSLog(@"Mail saved: you saved the email message in the Drafts folder");
			break;
		case MFMailComposeResultSent:
			NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send the next time the user connects to email");
			break;
		case MFMailComposeResultFailed:
			NSLog(@"Mail failed: the email message was nog saved or queued, possibly due to an error");
			break;
		default:
			//NSLog(@"Mail not sent");
			break;
	}
    
	[self dismissModalViewControllerAnimated:YES ];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
