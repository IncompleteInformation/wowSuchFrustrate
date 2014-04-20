//
//  WVTMainViewController.m
//  wowSuchFrustrate
//
//  Created by Mac on 4/15/14.
//  Copyright (c) 2014 ___CASEYANDJOE___. All rights reserved.
//

#import "WVTMainViewController.h"
#import "WVTFlipsideViewController.h"

@interface WVTMainViewController ()

@end

@implementation WVTMainViewController{
    BOOL running;
    NSTimeInterval startTime;
    NSMutableArray *lapTimes;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self resetStopwatch];
}


- (void)updateTimer
{
    if (running == false) return;
    
    NSTimeInterval elapsedTime = [self getElapsedTime];
    
    int milliseconds = (int)((elapsedTime - (int)elapsedTime)*1000);
    int seconds = (int) elapsedTime;
    

    self.wowDisplay.text = [NSString stringWithFormat:@"%u.%03u", seconds, milliseconds];
    
    [self performSelector:@selector(updateTimer
                                    ) withObject:self afterDelay:.0166666];
}

- (NSTimeInterval)getElapsedTime
{
    NSTimeInterval curTime = [NSDate timeIntervalSinceReferenceDate];
    return curTime - startTime;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButtonPressed
{
    
    [buttonLabel setTitle:@"LAP" forState:UIControlStateNormal];
    if (!running)
    {
        running = true;
        startTime = [NSDate timeIntervalSinceReferenceDate];
        [self updateTimer];
    }
    else
    {
        [lapTimes addObject:[NSNumber numberWithDouble:[self getElapsedTime]]];
//        NSLog(@"%@",lapTimes);
    }
}

- (IBAction)stopButtonPressed
{
    [buttonLabel setTitle:@"START" forState:UIControlStateNormal];
    running = false;
//    [self resetStopwatch];
}

- (void)resetStopwatch
{
    self.wowDisplay.text = @"0.000";
    running = false;
    lapTimes = [[NSMutableArray alloc] init];
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(WVTFlipsideViewController *)controller
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self dismissViewControllerAnimated:YES completion:nil];
        [self resetStopwatch];
    } else {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
    }
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.flipsidePopoverController = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
//        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
//        WVTFlipsideViewController *flipSideController = (WVTFlipsideViewController *)navController.topViewController;
//        flipSideController.lapTimes = lapTimes;
        WVTFlipsideViewController *controller = (WVTFlipsideViewController *)segue.destinationViewController;
        controller.lapTimes = lapTimes;
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
            self.flipsidePopoverController = popoverController;
            popoverController.delegate = self;
        }
    }
}

- (IBAction)togglePopover:(id)sender
{
    if (self.flipsidePopoverController) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    } else {
        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
    }
}

@end
