//
//  weeklymessage2.h
//  Breast Cancer
//
//  Created by DeemSysInc on 23/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface weeklymessage2 : UIViewController<UITextFieldDelegate>
{
    IBOutlet UIView * question2;
    IBOutlet UITextField * answer2;
    IBOutlet UILabel * reinforcement;
    NSMutableDictionary * recorddict;
}

-(IBAction)send:(id)sender;
-(IBAction)clear:(id)sender;
-(IBAction)next:(id)sender;
@property(nonatomic , retain) NSMutableDictionary * recorddict;
@end
