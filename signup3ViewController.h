//
//  signup3ViewController.h
//  SMSIPAD
//
//  Created by DeemSysInc on 12/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface signup3ViewController : UIViewController
{
    NSMutableDictionary*recorddict;
    IBOutlet UIPickerView*timepick1;
    IBOutlet UILabel*timepicker1;
     IBOutlet UILabel*timepicker2;
     IBOutlet UILabel*timepicker3;
   IBOutlet UIPickerView * timepick2;
    IBOutlet UIPickerView * timepick3;
    IBOutlet UILabel*reslabel;
    IBOutlet UISwitch*switch1;

    
}
@property(assign)NSMutableDictionary *recorddict;
@property (nonatomic, strong) NSMutableArray *timearray;
@property (nonatomic,retain) IBOutlet UIPickerView *timepick1;
@property (nonatomic,retain) IBOutlet UIPickerView *timepick2;
@property (nonatomic,retain) IBOutlet UIPickerView *timepick3;
@property(nonatomic,retain)IBOutlet UILabel *timepicker1;
@property(nonatomic,retain)IBOutlet UILabel *timepicker2;
@property(nonatomic,retain)IBOutlet UILabel *timepicker3;

@property (nonatomic, retain) UISwitch *switch1;
@property (nonatomic, retain) UILabel *reslabel;
- (IBAction) toggleEnabledTextForSwitch1onSomeLabel: (id) sender;
- (IBAction)changeTimeInLabel1:(id)sender;
- (IBAction)changeTimeInLabel2:(id)sender;
- (IBAction)changeTimeInLabel3:(id)sender;
-(IBAction)submit:(id)sender;

@end

