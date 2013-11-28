//
//  weekmessage2.h
//  Breast Cancer
//
//  Created by DeemSysInc on 25/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface weekmessage2 : UIViewController<UITextFieldDelegate>
{
    IBOutlet UITextView * question2;
    IBOutlet UITextField * answer2;
    IBOutlet UILabel *inforce;
    NSMutableDictionary * recorddict;
    NSString * reinforce;
    NSMutableDictionary * temp;
    IBOutlet UILabel * hiddenfield;
    IBOutlet UIButton * send;
    IBOutlet UIButton * clear;
    IBOutlet UIButton * next;
}

-(IBAction)send:(id)sender;
-(IBAction)clear:(id)sender;
-(IBAction)next:(id)sender;
@property(nonatomic , retain) NSMutableDictionary * recorddict;
@end
