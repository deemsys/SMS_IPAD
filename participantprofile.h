//
//  participantprofile.h
//  Breast Cancer
//
//  Created by DeemSysInc on 21/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface participantprofile : UIViewController<UIPickerViewAccessibilityDelegate,UIPickerViewDataSource>
{
    IBOutlet UILabel * firstname;
    IBOutlet UILabel * username;
    IBOutlet UILabel * mobilenumber;
    IBOutlet UILabel * gender;
    IBOutlet UILabel * city;
    IBOutlet UILabel * education;
    IBOutlet UILabel * medical;
    IBOutlet UILabel * time1;
    IBOutlet UILabel * time2;
    IBOutlet UILabel * time3;
    IBOutlet UILabel * provider;
    IBOutlet UIPickerView *group;
    IBOutlet UILabel * age;
}
-(IBAction)edit:(id)sender;

@end
