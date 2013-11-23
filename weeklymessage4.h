//
//  weeklymessage4.h
//  Breast Cancer
//
//  Created by DeemSysInc on 23/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface weeklymessage4 : UIViewController<UITextFieldDelegate>
{
    IBOutlet UIView * question4;
    IBOutlet UITextField * answer4;
}
-(IBAction)send:(id)sender;
-(IBAction)clear:(id)sender;
@end
