//
//  signup2ViewController.h
//  SMSIPAD
//
//  Created by DeemSysInc on 12/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface signup2ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate> 
{
    NSMutableDictionary *recorddict;
    IBOutlet UIPickerView*agepick;
    IBOutlet UILabel*agepicker;
    IBOutlet UISegmentedControl*seggender;
    IBOutlet UILabel*gender;
    IBOutlet UIPickerView*providerpick;
    IBOutlet UILabel*providerpicker;
    IBOutlet UIPickerView*grouppick;
    IBOutlet UILabel*grouppicker;
    int c;

    
}
@property (nonatomic, strong) IBOutlet UIPickerView *agepick;
@property(assign)NSMutableDictionary *recorddict;
@property(nonatomic,retain)UISegmentedControl*seggender;
@property (nonatomic, strong) NSArray *ageArray;
@property (nonatomic, strong) NSMutableArray *providerarray;
@property (nonatomic, strong) NSMutableArray *grouparray;
@property (nonatomic, strong) IBOutlet UILabel*agepicker;
@property (nonatomic, strong) IBOutlet UIPickerView *providerpick;
@property (nonatomic, strong) IBOutlet UIPickerView *grouppick;
@property (nonatomic, strong) IBOutlet UILabel*providerpicker;
@property (nonatomic, strong) IBOutlet UILabel*grouppicker;
-(IBAction)seggenderclicked:(id)sender;
- (IBAction)changeage:(id)sender;
-(IBAction)changeprovider:(id)sender;
-(IBAction)changegroup:(id)sender;

@end
