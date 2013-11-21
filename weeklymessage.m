//
//  weeklymessage.m
//  Breast Cancer
//
//  Created by DeemSysInc on 20/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import "weeklymessage.h"
#import "BlockUI.h"
#import "BlockAlertView.h"

@interface weeklymessage ()

@end

@implementation weeklymessage

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
    BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Weekly Evaluation" message:@"System Begins Your Evaluation."];
    
    //  [alert setCancelButtonWithTitle:@"Cancel" block:nil];
   // [alert setDestructiveButtonWithTitle:@"ok" block:nil];
    [alert setCancelButtonWithTitle:@"ok" block:nil];
    [alert show];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
