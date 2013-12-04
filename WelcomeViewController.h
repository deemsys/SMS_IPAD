//
//  WelcomeViewController.h
//  SMSIPAD
//
//  Created by DeemSysInc on 12/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "Reachability.h"

@interface WelcomeViewController : UIViewController<MBProgressHUDDelegate>
{
    NSMutableDictionary *recorddict;
    NSString*temp,*temp1,*temp2,*temp3;
    MBProgressHUD *HUD;
    IBOutlet UILabel*welcome;
    BOOL isConnect;
    IBOutlet UIButton *eval;
    IBOutlet UISwitch *switch1;
    IBOutlet UILabel *resLabel1;
    IBOutlet UILabel*weekremaining;
    int weekcount,continuous,count1;
    NSMutableArray *week1,*week2,*week3,*week4,*week5,*week6;
    NSMutableArray *seqweek1,*seqweek2,*seqweek3,*seqweek4,*seqweek5,*seqweek6;
    NSMutableArray *filtereddate,*filteredweek,*filteredlogid;
    NSString *firstname1;
    NSString *username1;
    NSString *mobile1;
    NSString *email1;
    NSString *gender1;
    NSString *city1;
    NSString *education1;
    NSString *medical1;
    NSString *time11;
    NSString *time21;
    NSString *time31;
    NSString *provider1;
    NSString *group1;
    NSString *age1;
    NSTimer *timer;
}
- (IBAction) toggleEnabledTextForSwitch1onSomeLabel: (id) sender;
@property (nonatomic, retain) UISwitch *switch1;
@property (nonatomic, retain) UILabel *resLabel1;
@property (nonatomic, retain) UIButton*eval;
@property(nonatomic,retain)NSMutableDictionary*recorddict;
@property (nonatomic, strong) NSTimer *timer;
@end
