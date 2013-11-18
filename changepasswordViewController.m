//
//  changepasswordViewController.m
//  SMSIPAD
//
//  Created by DeemsysInc on 11/14/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import "changepasswordViewController.h"
#import "BlockAlertView.h"

@interface changepasswordViewController ()

@end

@implementation changepasswordViewController

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
    oldpaswrd.delegate=self;
    newpaswrd.delegate=self;
    confirmpawrd.delegate=self;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changepassword:(id)sender
{
    BlockAlertView*alert=[[BlockAlertView alloc]initWithTitle:@"Successful" message:@"Password changed successfully"];
    [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
    [alert show];
    
}
- (IBAction)hideKeyboard:(id)sender
{
  //  NSLog(@"hideKeyboard");
    [sender resignFirstResponder];
}

@end

