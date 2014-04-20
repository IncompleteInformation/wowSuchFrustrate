//
//  WVTMainViewController.h
//  wowSuchFrustrate
//
//  Created by Mac on 4/15/14.
//  Copyright (c) 2014 ___CASEYANDJOE___. All rights reserved.
//

#import "WVTFlipsideViewController.h"



@interface WVTMainViewController : UIViewController <WVTFlipsideViewControllerDelegate, UIPopoverControllerDelegate> {
    IBOutlet UIButton *buttonLabel;
}
@property (weak, nonatomic) IBOutlet UILabel *wowDisplay;

- (IBAction)startButtonPressed;
- (IBAction)stopButtonPressed;
- (void)resetStopwatch;
//- (NSTimeInterval)lapTimeAtIndex: (NSInteger) index;
//- (NSInteger)sizeOfLapTimesArray;

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;


@end




//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return _array.count;
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (!cell) {
//        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"] autorelease];
//    }
//    cell.textLabel.text = [_array objectAtIndex:indexPath.row];
//    return cell;
//}


//-(Homework*) homeworkAtIndex: (NSInteger) index
//{
//    return [alist objectAtIndex:index] ;
//}
//
//-(NSInteger) numberOfObjectsInList
//{
//    return [alist count];
//}