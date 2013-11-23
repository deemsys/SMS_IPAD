//
//  weeklymessage3.h
//  Breast Cancer
//
//  Created by DeemSysInc on 23/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface weeklymessage3 : UIViewController<UITextViewDelegate>
{
    IBOutlet UILabel * pleaseexplain;
    IBOutlet UIView * answer3;
    IBOutlet UIView * tipsimprove;
    IBOutlet UILabel * recording;
    
}
-(IBAction)record:(id)sender;
-(IBAction)stop:(id)sender;
-(IBAction)play:(id)sender;
-(IBAction)save:(id)sender;
@end
