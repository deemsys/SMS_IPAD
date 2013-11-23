//
//  weeklymessage.h
//  Breast Cancer
//
//  Created by DeemSysInc on 20/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface weeklymessage : UIViewController<UITextFieldDelegate>
{
    IBOutlet UIView * question1;
    IBOutlet UITextField * answer1;
    
}
-(IBAction)send:(id)sender;
-(IBAction)clear:(id)sender;
@property(nonatomic,retain)NSMutableDictionary * recorddict;
@end
