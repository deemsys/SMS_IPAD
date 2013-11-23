//
//  weeklymessage2.m
//  Breast Cancer
//
//  Created by DeemSysInc on 23/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import "weeklymessage2.h"
#import "BlockAlertView.h"

@interface weeklymessage2 ()

@end

@implementation weeklymessage2
/*
BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Weekly Evaluation" message:@"System Begins Your Evaluation."];

//  [alert setCancelButtonWithTitle:@"Cancel" block:nil];
// [alert setDestructiveButtonWithTitle:@"ok" block:nil];
[alert setCancelButtonWithTitle:@"ok" block:nil];
[alert show];
 */

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(IBAction)send:(id)sender
{
    
}
-(IBAction)clear:(id)sender
{
    answer2.text=@"";
    
}
-(IBAction)next:(id)sender
{
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [answer2 resignFirstResponder];
}
-(void)dismissKeyboard {
    [answer2 resignFirstResponder];
    [question2 resignFirstResponder];
    
}
- (IBAction)hideKeyboard:(id)sender
{
    // NSLog(@"hideKeyboard");
    [sender resignFirstResponder];
}
-(void)back
{
    
}
- (void)viewDidLoad
{
    UIButton *home = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *homeImage = [UIImage imageNamed:@" "]  ;
    [home setBackgroundImage:homeImage forState:UIControlStateNormal];
    [home addTarget:self action:@selector(back)
   forControlEvents:UIControlEventTouchUpInside];
    home.frame = CGRectMake(0, 0, 50, 30);
    UIBarButtonItem *cancelButton = [[[UIBarButtonItem alloc]
                                      initWithCustomView:home] autorelease];
    self.navigationItem.leftBarButtonItem = cancelButton;
    [super viewDidLoad];
    answer2.delegate=self;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
