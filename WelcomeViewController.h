//
//  WelcomeViewController.h
//  SMSIPAD
//
//  Created by DeemSysInc on 12/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "Reachability.h"

@interface WelcomeViewController : UIViewController<MBProgressHUDDelegate>
{
    NSMutableDictionary *recorddict;
    NSString*temp,*temp1,*temp2,*temp3;
    MBProgressHUD *HUD;
    IBOutlet UILabel*welcome;
    BOOL isConnect;
}
@property(nonatomic,retain)NSMutableDictionary*recorddict;
@end
