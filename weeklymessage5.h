//
//  weeklymessage5.h
//  Breast Cancer
//
//  Created by DeemSysInc on 23/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface weeklymessage5 : UIViewController
{
    NSMutableDictionary * recordict;
    NSMutableDictionary * temp;
    
    IBOutlet UIButton *end;
    
}
@property (nonatomic, retain) NSMutableDictionary * recorddict;
@property (nonatomic, retain) NSMutableDictionary * temp;
@end
