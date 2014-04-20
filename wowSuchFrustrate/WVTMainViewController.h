//
//  WVTMainViewController.h
//  wowSuchFrustrate
//
//  Created by Mac on 4/15/14.
//  Copyright (c) 2014 ___CASEYANDJOE___. All rights reserved.
//

#import "WVTFlipsideViewController.h"



@interface WVTMainViewController : UIViewController <UISplitViewControllerDelegate, UIPopoverControllerDelegate> {
    IBOutlet UIButton *buttonLabel;
}
@property (weak, nonatomic) IBOutlet UILabel *wowDisplay;

- (IBAction)startButtonPressed;
- (IBAction)stopButtonPressed;
- (void)resetStopwatch;

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;


@end