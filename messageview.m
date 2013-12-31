//
//  messageview.m
//  Breast Cancer
//
//  Created by DeemSysInc on 20/11/13.
//  Copyright (c) 2013 DeemSysInc. All rights reserved.
//

#import "messageview.h"
#import <QuartzCore/QuartzCore.h>

@interface messageview ()

@end

@implementation messageview

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    mesagedetail.clipsToBounds = YES;
    mesagedetail.layer.cornerRadius = 10.0f;
  //  mesagedetail.backgroundColor = [UIColor clearColor];
    UIImageView *imageView = [[[UIImageView alloc] initWithFrame:mesagedetail.frame] autorelease];
    imageView.image = [UIImage imageNamed:@"BG.png"];
    [self.view addSubview:mesagedetail];
    [self.view bringSubviewToFront:mesagedetail];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [mesagedetail release];
    [super dealloc];
}
@end
