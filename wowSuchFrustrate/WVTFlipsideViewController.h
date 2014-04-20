//
//  WVTFlipsideViewController.h
//  wowSuchFrustrate
//
//  Created by Mac on 4/15/14.
//  Copyright (c) 2014 ___CASEYANDJOE___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WVTMainViewController.h"

@class WVTFlipsideViewController;

@protocol WVTFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(WVTFlipsideViewController *)controller;
@end

//@interface WVTFlipsideViewController : UIViewController
@interface WVTFlipsideViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

// I dragged this is from the storyboard
// not really sure how to populate it
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) id <WVTFlipsideViewControllerDelegate> delegate;
@property (nonatomic) NSMutableArray *lapTimes;

- (IBAction)done:(id)sender;

@end