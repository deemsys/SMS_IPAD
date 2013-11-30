//
//  weeklymail.h
//  Breast Cancer
//
//  Created by DeemSysInc on 30/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface weeklymail : UIViewController
{
    IBOutlet UITextView * mailmessage;
    IBOutlet UITextField * mailanswer;
    IBOutlet UIButton * send;
    IBOutlet UIButton * clear;
    NSMutableDictionary * recordict;
}
-(IBAction)send:(id)sender;
-(IBAction)clear:(id)sender;
@property (nonatomic,retain)NSMutableDictionary * recorddict;
@end
