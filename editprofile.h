//
//  editprofile.h
//  Breast Cancer
//
//  Created by DeemSysInc on 21/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextfieldScrollViewController.h"
#import "BlockAlertView.h"
#import "Reachability.h"
#import "MBProgressHUD.h"
#import "JSON.h"
#import "ALPickerView.h"
#import "CYCustomMultiSelectPickerView.h"
@interface editprofile :UITextfieldScrollViewController<MBProgressHUDDelegate,CYCustomMultiSelectPickerViewDelegate>
{
    
    NSArray *entries;
    NSArray *entriesSelected;
	NSMutableDictionary *selectionStates;
    UILabel *showLbl;
    CYCustomMultiSelectPickerView *multiPickerView;
    NSMutableDictionary*recorddict;
    IBOutlet UITextField*fname;
    IBOutlet UILabel*username;
    IBOutlet UILabel*age;
    IBOutlet UITextField*city;
    IBOutlet UITextField*education;
    IBOutlet UITextField*email;
    IBOutlet UITextField*medical;
    IBOutlet UITextField*mobile;
    IBOutlet UILabel*provider;
    IBOutlet UILabel*time1;
    IBOutlet UILabel*time2;
    IBOutlet UILabel*time3;
    IBOutlet UITextField*gender;
    IBOutlet UIPickerView*timepick1;
    IBOutlet UIPickerView * timepick2;
    IBOutlet UIPickerView * timepick3;
    IBOutlet UIPickerView*grouppick;
    IBOutlet UILabel*grouppicker;
    IBOutlet UIPickerView*agepick;
    IBOutlet UILabel*agepicker;
    NSMutableArray*groupfinal;
    NSArray *groupdesc;
    NSString*selectgroupidold,*selectedgroupdescription;
    NSMutableArray*selectedgroupid;
    NSMutableArray*groupidlist;
    BOOL isConnect;
    MBProgressHUD *HUD;
    
}
- (IBAction)submit:(id)sender;
@property (nonatomic, strong) IBOutlet UIPickerView *agepick;
@property (nonatomic, strong) NSArray *ageArray;
- (IBAction)changeage:(id)sender;
@property (nonatomic, strong) IBOutlet UILabel*agepicker;
@property (nonatomic, strong) NSMutableArray *timearray;
@property (nonatomic,retain) IBOutlet UIPickerView *timepick1;
@property (nonatomic,retain) IBOutlet UIPickerView *timepick2;
@property (nonatomic,retain) IBOutlet UIPickerView *timepick3;
@property (nonatomic, strong) NSMutableArray *grouparray;
@property (nonatomic, strong) IBOutlet UIPickerView *grouppick;
@property (nonatomic, strong) IBOutlet UILabel*grouppicker;

@property (nonatomic, strong)IBOutlet UILabel*time1;

@property (nonatomic, strong)IBOutlet UILabel*time2;

@property (nonatomic, strong)IBOutlet UILabel*time3;


- (IBAction)changeTimeInLabel1:(id)sender;
- (IBAction)changeTimeInLabel2:(id)sender;
- (IBAction)changeTimeInLabel3:(id)sender;
-(IBAction)changegroup:(id)sender;
@property(assign) NSMutableDictionary*recorddict;
@end
